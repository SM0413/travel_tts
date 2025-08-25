import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:travel_tts/common/model/texts_model.dart';
import 'package:travel_tts/common/provider/local_db_state_provider.dart';
import 'package:travel_tts/main/provider/main_page_state_provider.dart';
import 'package:travel_tts/main/repo/main_page_repo.dart';
import 'package:travel_tts/utils/global_util.dart';
import 'package:travel_tts/utils/model_util.dart';
import 'package:travel_tts/utils/network_util.dart';
import 'package:travel_tts/utils/toast_util.dart';
import 'package:travel_tts/utils/try_catch_util.dart';

class MainPageProvider extends AutoDisposeAsyncNotifier<void> {
  late final MainPageRepo _mainPageRepo;
  @override
  FutureOr<void> build() {
    _mainPageRepo = ref.read(mainPageRepo);
  }

  Future<void> getData() async {
    return await TryCatchUtil.handle(
      fn: () async {
        state = const AsyncLoading();
        if (await NetworkUtil.isOnlineNow()) {
          // 1) 원격 데이터 가져오기
          final List<TextsModel> remoteMyData = await (() async {
            if (!await NetworkUtil.isOnlineNow()) return <TextsModel>[];
            final res = await _mainPageRepo.getMyData();
            if (GlobalUtil.isEmpty(res)) return <TextsModel>[];
            return ModelUtil.fromJson(
                  fromJson: TextsModel.fromJson,
                  json: res,
                ) ??
                <TextsModel>[];
          })();

          final List<TextsModel> remoteOtherUserData = await (() async {
            if (!await NetworkUtil.isOnlineNow()) return <TextsModel>[];
            final res = await _mainPageRepo.getOtherUserData();
            if (GlobalUtil.isEmpty(res)) return <TextsModel>[];
            return ModelUtil.fromJson(
                  fromJson: TextsModel.fromJson,
                  json: res,
                ) ??
                <TextsModel>[];
          })();

          // 2) 로컬 데이터 (널 안전)
          final localDataList =
              ref.read(localDbStateProvider).value?.texts ?? <TextsModel>[];

          // 3) id 기준 병합(중복 제거) — 최신 updatedAt 우선 채택
          final Map<String, TextsModel> byId = {
            for (final t in remoteMyData) t.id: t,
          };
          for (final t in localDataList) {
            final exist = byId[t.id];
            if (exist == null) {
              byId[t.id] = t;
            } else {
              final existUpdated = exist.updatedAt ?? exist.createdAt;
              final localUpdated = t.updatedAt ?? t.createdAt;
              if (existUpdated == null && localUpdated != null) {
                byId[t.id] = t;
              } else if (existUpdated != null && localUpdated != null) {
                if (localUpdated.isAfter(existUpdated)) {
                  byId[t.id] = t;
                }
              }
            }
          }

          final merged = byId.values.toList();
          merged.addAll(remoteOtherUserData);
          ref.read(mainPageStateProvider.notifier).setState(myTexts: merged);
        } else {
          final localDataList =
              ref.read(localDbStateProvider).value?.texts ??
              [].cast<TextsModel>();
          ref
              .read(mainPageStateProvider.notifier)
              .setState(myTexts: localDataList);
        }

        state = const AsyncData(null);
      },
      isShowToast: true,
      fnName: "main_page_provider > getData",
    );
  }

  Future<void> share({required TextsModel model}) async {
    return TryCatchUtil.handle(
      fn: () async {
        // 온라인 여부 먼저
        if (!await NetworkUtil.isOnlineNow(isShowToast: true)) return;

        // 현 로컬 상태 가져오기 (로딩/널 가드)
        final localDb = ref.read(localDbStateProvider).value;
        if (localDb == null) {
          ToastUtil.show(title: "데이터 로딩 중입니다");
          return;
        }

        // 복사본 생성
        final localDbTexts = List<TextsModel>.from(localDb.texts);
        final mainPageTexts = List<TextsModel>.from(
          ref.read(mainPageStateProvider).myTexts,
        );

        // ❗️indexOf 대신 id 기반 탐색
        final localTextIdx = localDbTexts.indexWhere((t) => t.id == model.id);
        final mainPageTextIdx = mainPageTexts.indexWhere(
          (t) => t.id == model.id,
        );
        if (localTextIdx == -1 || mainPageTextIdx == -1) {
          ToastUtil.show(title: "항목을 찾지 못했어요");
          return;
        }

        // 토글 상태 생성 (옵티미스틱)
        final next = model.copyWith(isShare: !model.isShare);

        await ToastUtil.loading(() async {
          // 1) 낙관적 로컬 반영
          localDbTexts[localTextIdx] = next;
          mainPageTexts[mainPageTextIdx] = next;
          await ref
              .read(localDbStateProvider.notifier)
              .setState(texts: localDbTexts);
          ref
              .read(mainPageStateProvider.notifier)
              .setState(myTexts: mainPageTexts);

          try {
            // 2) 서버 반영
            if (next.isShare) {
              await _mainPageRepo.uploadTexts(data: next.toJson());
              ToastUtil.show(title: "공유에 성공했어요");
            } else {
              // deleteTexts가 id만 필요하면 id만 넘기도록 변경 권장
              await _mainPageRepo.deleteTexts(model: next);
              ToastUtil.show(title: "공유 중단에 성공했어요");
            }
          } catch (e) {
            // 3) 실패 시 롤백
            localDbTexts[localTextIdx] = model;
            mainPageTexts[mainPageTextIdx] = model;
            await ref
                .read(localDbStateProvider.notifier)
                .setState(texts: localDbTexts);
            ref
                .read(mainPageStateProvider.notifier)
                .setState(myTexts: mainPageTexts);
            rethrow;
          }
        });
      },
      isShowToast: true,
      fnName: "main_page_provider > share",
      errorMessage: "실패했어요",
      isNeedCloseLoading: true,
    );
  }

  Future<void> deleteText({required TextsModel model}) async {
    return await TryCatchUtil.handle(
      fn: () async {
        await ToastUtil.loading(() async {
          if (model.isShare) {
            if (!await NetworkUtil.isOnlineNow(isShowToast: false)) {
              ToastUtil.show(title: "공유된 정보는 인터넷이 연결된 상태에서만 삭제 가능해요");
              return;
            }
            await _mainPageRepo.deleteTexts(model: model);
          }
          final mainPageTexts = List<TextsModel>.from(
            ref.read(mainPageStateProvider).myTexts,
          );
          mainPageTexts.remove(model);
          ref
              .read(mainPageStateProvider.notifier)
              .setState(myTexts: mainPageTexts);
          final localDbTexts = List<TextsModel>.from(
            ref.read(localDbStateProvider).value!.texts,
          );
          localDbTexts.remove(model);
          await ref
              .read(localDbStateProvider.notifier)
              .setState(texts: localDbTexts);
        });
      },
      isShowToast: true,
      fnName: "main_page_provider > deleteText",
      errorMessage: "실패했어요",
    );
  }
}

final mainPageProvider =
    AutoDisposeAsyncNotifierProvider<MainPageProvider, void>(
      MainPageProvider.new,
    );

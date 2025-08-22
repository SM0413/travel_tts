import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:travel_tts/common/model/texts_model.dart';
import 'package:travel_tts/common/provider/local_db_state_provider.dart';
import 'package:travel_tts/main/provider/main_page_state_provider.dart';
import 'package:travel_tts/main/repo/main_page_repo.dart';
import 'package:travel_tts/utils/global_util.dart';
import 'package:travel_tts/utils/model_util.dart';
import 'package:travel_tts/utils/network_util.dart';
import 'package:travel_tts/utils/try_catch_util.dart';

class MainPageProvider extends AsyncNotifier<void> {
  late final MainPageRepo _mainPageRepo;
  @override
  FutureOr<void> build() {
    _mainPageRepo = ref.read(mainPageRepo);
  }

  Future<void> getData() async {
    return await TryCatchUtil.handle(
      fn: () async {
        state = const AsyncLoading();
        // 1) 원격 데이터 가져오기
        final List<TextsModel> remoteMyData = await (() async {
          if (!await NetworkUtil.isOnlineNow()) return <TextsModel>[];
          final res = await _mainPageRepo.getMyData();
          if (GlobalUtil.isEmpty(res)) return <TextsModel>[];
          return ModelUtil.fromJson(fromJson: TextsModel.fromJson, json: res) ??
              <TextsModel>[];
        })();

        final List<TextsModel> remoteOtherUserData = await (() async {
          if (!await NetworkUtil.isOnlineNow()) return <TextsModel>[];
          final res = await _mainPageRepo.getOtherUserData();
          if (GlobalUtil.isEmpty(res)) return <TextsModel>[];
          return ModelUtil.fromJson(fromJson: TextsModel.fromJson, json: res) ??
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
        state = const AsyncData(null);
      },
      isShowToast: true,
      fnName: "main_page_provider > getData",
    );
  }
}

final mainPageProvider = AsyncNotifierProvider<MainPageProvider, void>(
  MainPageProvider.new,
);

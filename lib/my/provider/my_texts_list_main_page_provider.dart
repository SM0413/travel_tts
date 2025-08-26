import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:travel_tts/common/model/texts_model.dart';
import 'package:travel_tts/common/provider/local_db_state_provider.dart';
import 'package:travel_tts/common/provider/user_state_provider.dart';
import 'package:travel_tts/main/provider/main_page_state_provider.dart';
import 'package:travel_tts/main/repo/main_page_repo.dart';
import 'package:travel_tts/my/provider/my_texts_list_main_page_state_provider.dart';
import 'package:travel_tts/utils/global_util.dart';
import 'package:travel_tts/utils/network_util.dart';
import 'package:travel_tts/utils/toast_util.dart';
import 'package:travel_tts/utils/try_catch_util.dart';

class MyTextsListMainPageProvider extends AutoDisposeAsyncNotifier<void> {
  late final MainPageRepo _mainPageRepo;
  @override
  FutureOr<void> build() {
    _mainPageRepo = ref.read(mainPageRepo);
  }

  Future<void> deleteText() async {
    return await TryCatchUtil.handle(
      fn: () async {
        final state = ref.read(myTextsListMainPageStateProvider);
        if (!state.isDelete) return;
        await ToastUtil.loading(() async {
          final deleteListCopy = List<TextsModel>.from(state.deleteModelList);
          final isOnline = await NetworkUtil.isOnlineNow();
          if (deleteListCopy.any((item) => item.isShare) && !isOnline) {
            ToastUtil.show(
              title: "공유된 정보는 인터넷이 연결된 상태에서만 삭제 가능해요",
              subTitle: "공유되지 않은 정보만 삭제할께요",
            );
            await Future.delayed(const Duration(seconds: 2));
          }
          final localDbData = List<TextsModel>.from(
            ref.read(localDbStateProvider).value!.texts,
          );
          final shareList = deleteListCopy.where((item) => item.isShare);
          final notShareList = deleteListCopy.where((item) => !item.isShare);
          if (isOnline) {
            final deleteFuture = shareList.map(
              (text) => _mainPageRepo.deleteTexts(model: text),
            );
            await Future.wait(deleteFuture);
            localDbData.removeWhere((item) => shareList.contains(item));
          }

          localDbData.removeWhere((item) => notShareList.contains(item));

          _commonSetTexts(localDbData);

          ToastUtil.show(title: "삭제되었어요");
        });
      },
      isShowToast: true,
      fnName: "my_texts_list_main_page_provider > deleteText",
      errorMessage: "실패했어요",
      userId: ref.read(userStateProvider).id,
      failFn: (e) async => await GlobalUtil.failFn(ref: ref, e: e),
    );
  }

  Future<void> deleteSingle({required TextsModel model}) async {
    return await TryCatchUtil.handle(
      fn: () async {
        await ToastUtil.loading(() async {
          final isOnline = await NetworkUtil.isOnlineNow();
          if (model.isShare) {
            if (!isOnline) {
              ToastUtil.show(title: "공유된 정보는 인터넷이 연결된 상태에서만 삭제 가능해요");
              await Future.delayed(const Duration(seconds: 2));
            } else {
              await _mainPageRepo.deleteTexts(model: model);
            }
          }

          final copy = List<TextsModel>.from(
            ref.read(localDbStateProvider).value!.texts,
          );

          copy.remove(model);
          _commonSetTexts(copy);

          ToastUtil.show(title: "삭제되었어요");
        });
      },
      isShowToast: true,
      fnName: "my_texts_list_main_page_provider > deleteSingle",
      errorMessage: "실패했어요",
      userId: ref.read(userStateProvider).id,
      failFn: (e) async => await GlobalUtil.failFn(ref: ref, e: e),
    );
  }

  void _commonSetTexts(List<TextsModel> modelList) {
    ref.read(localDbStateProvider.notifier).setState(texts: modelList);
    ref.read(mainPageStateProvider.notifier).setState(myTexts: modelList);
    ref
        .read(myTextsListMainPageStateProvider.notifier)
        .setState(deleteModelList: [], isCheckAll: false, isDelete: false);
  }
}

final myTextsListMainPageProvider =
    AutoDisposeAsyncNotifierProvider<MyTextsListMainPageProvider, void>(
      MyTextsListMainPageProvider.new,
    );

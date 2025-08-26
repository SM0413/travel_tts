import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:travel_tts/common/model/texts_model.dart';
import 'package:travel_tts/common/provider/local_db_state_provider.dart';
import 'package:travel_tts/common/provider/user_state_provider.dart';
import 'package:travel_tts/enums/db/db_enum.dart';
import 'package:travel_tts/main/provider/main_page_state_provider.dart';
import 'package:travel_tts/main/repo/main_page_repo.dart';
import 'package:travel_tts/my/provider/my_texts_list_main_page_state_provider.dart';
import 'package:travel_tts/utils/device_info_util.dart';
import 'package:travel_tts/utils/global_util.dart';
import 'package:travel_tts/utils/network_util.dart';
import 'package:travel_tts/utils/string_util.dart';
import 'package:travel_tts/utils/to_json_util.dart';
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
          ref.read(localDbStateProvider.notifier).setState(texts: localDbData);
          ref
              .read(mainPageStateProvider.notifier)
              .setState(myTexts: localDbData);
          ref
              .read(myTextsListMainPageStateProvider.notifier)
              .setState(
                deleteModelList: [],
                isCheckAll: false,
                isDelete: false,
              );

          ToastUtil.show(title: "삭제되었어요");
        });
      },
      isShowToast: true,
      fnName: "my_texts_list_main_page_provider > deleteText",
      errorMessage: "실패했어요",
      userId: ref.read(userStateProvider).id,
      failFn: (e) async {
        if (!await NetworkUtil.isOnlineNow()) {
          await ref
              .read(localDbStateProvider.notifier)
              .setErrorList(
                data: ToJsonUtil.errorLog(
                  userId: ref.read(userStateProvider).id,
                  e: e,
                  stackTrace: StackTrace.current,
                  deviceInfo: await DeviceInfoUtil.getDeviceInfo(),
                ),
              );
        } else {
          final errorList = ref.read(localDbStateProvider).value!.errorList;
          if (!GlobalUtil.isEmpty(errorList)) {
            final List<Future> uploadFUture = errorList.map((item) {
              return FirebaseFirestore.instance
                  .collection(DbEnum.errorLog.name)
                  .doc(StringUtil.getUUID())
                  .set(item);
            }).toList();
            await Future.wait(uploadFUture);
            await ref
                .read(localDbStateProvider.notifier)
                .setState(errorList: []);
          }
        }
      },
    );
  }
}

final myTextsListMainPageProvider =
    AutoDisposeAsyncNotifierProvider<MyTextsListMainPageProvider, void>(
      MyTextsListMainPageProvider.new,
    );

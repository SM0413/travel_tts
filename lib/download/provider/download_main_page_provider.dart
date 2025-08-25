import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_mlkit_translation/google_mlkit_translation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:travel_tts/common/provider/local_db_state_provider.dart';
import 'package:travel_tts/common/provider/user_state_provider.dart';
import 'package:travel_tts/enums/db/db_enum.dart';
import 'package:travel_tts/enums/trans_enum.dart';
import 'package:travel_tts/utils/device_info_util.dart';
import 'package:travel_tts/utils/global_util.dart';
import 'package:travel_tts/utils/network_util.dart';
import 'package:travel_tts/utils/string_util.dart';
import 'package:travel_tts/utils/to_json_util.dart';
import 'package:travel_tts/utils/toast_util.dart';
import 'package:travel_tts/utils/try_catch_util.dart';

class DownloadMainPageProvider extends AutoDisposeAsyncNotifier<void> {
  @override
  FutureOr<void> build() {}

  Future<void> downloadPack({required TransEnum tranEnum}) async {
    return await TryCatchUtil.handle(
      fn: () async {
        if (!await NetworkUtil.isOnlineNow(isShowToast: true)) {
          return;
        }
        await ToastUtil.loading(() async {
          final modelManager = OnDeviceTranslatorModelManager();
          await modelManager.downloadModel(tranEnum.type.bcpCode);
          final asisDownloadedList = List<String>.from(
            ref.read(localDbStateProvider).value!.downloadedLangPack,
          );
          asisDownloadedList.add(tranEnum.ko);
          ref
              .read(localDbStateProvider.notifier)
              .setState(downloadedLangPack: asisDownloadedList);
        });
      },
      isShowToast: true,
      fnName: "download_main_page_provider > downloadPack",
      errorMessage: "언어팩 다운로드에 실패했어요",
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

  Future<void> deletePack({required TransEnum tranEnum}) async {
    return await TryCatchUtil.handle(
      fn: () async {
        await ToastUtil.loading(() async {
          final modelManager = OnDeviceTranslatorModelManager();
          await modelManager.deleteModel(tranEnum.type.bcpCode);
          final asisDownloadedList = List<String>.from(
            ref.read(localDbStateProvider).value!.downloadedLangPack,
          );
          asisDownloadedList.remove(tranEnum.ko);
          ref
              .read(localDbStateProvider.notifier)
              .setState(downloadedLangPack: asisDownloadedList);
        });
      },
      isShowToast: true,
      fnName: "download_main_page_provider > deletePack",
      errorMessage: "언어팩 삭제에 실패했어요",
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

final downloadMainPageProvider =
    AutoDisposeAsyncNotifierProvider<DownloadMainPageProvider, void>(
      DownloadMainPageProvider.new,
    );

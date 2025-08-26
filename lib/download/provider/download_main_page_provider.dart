import 'dart:async';

import 'package:google_mlkit_translation/google_mlkit_translation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:travel_tts/common/provider/local_db_state_provider.dart';
import 'package:travel_tts/common/provider/user_state_provider.dart';
import 'package:travel_tts/enums/trans_enum.dart';
import 'package:travel_tts/utils/global_util.dart';
import 'package:travel_tts/utils/network_util.dart';
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
      failFn: (e) async => await GlobalUtil.failFn(ref: ref, e: e),
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
          // 기본 설정인 ["영어", "한국어"] 만 남아있는 상태
          ref
              .read(localDbStateProvider.notifier)
              .setState(
                downloadedLangPack: asisDownloadedList,
                defaultTargetLocale:
                    asisDownloadedList.length ==
                        2 // 기본 설정인 ["영어", "한국어"] 만 남아있는 상태
                    ? "영어"
                    : null,
              );
        });
      },
      isShowToast: true,
      fnName: "download_main_page_provider > deletePack",
      errorMessage: "언어팩 삭제에 실패했어요",
      userId: ref.read(userStateProvider).id,
      failFn: (e) async => await GlobalUtil.failFn(ref: ref, e: e),
    );
  }
}

final downloadMainPageProvider =
    AutoDisposeAsyncNotifierProvider<DownloadMainPageProvider, void>(
      DownloadMainPageProvider.new,
    );

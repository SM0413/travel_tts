import 'dart:async';
import 'dart:developer';

import 'package:travel_tts/utils/error_util.dart';
import 'package:travel_tts/utils/toast_util.dart';

abstract class TryCatchUtil {
  /// 공통 try-catch 함수
  static Future<T?> handle<T>({
    required Future<T> Function() fn,
    Function(Object e)? failFn,
    Function()? finallyFn,
    required bool isShowToast,
    required String fnName,
    String errorMessage = "정보를 가져오지 못했어요",
    bool isNeedCloseLoading = false,
    String? subTitle,
    String? etcInfo,
  }) async {
    final stopwatch = Stopwatch()..start();

    T? result; // 널러블로 설정
    try {
      result = await fn();
    } catch (e) {
      log(e.toString(), name: "[ HANDLE ERROR ]");
      await failFn?.call(e);
      await ErrorUtil.handle(
        e: e,
        isShowToast: isShowToast,
        errorMessage: errorMessage,
        subTitle: subTitle,
        etcInfo: etcInfo,
      );
      if (result is bool) {
        result = false as T?;
      }
    } finally {
      await finallyFn?.call();
      if (isNeedCloseLoading) {
        ToastUtil.closeLoading();
      }
      stopwatch.stop();

      log("[ $fnName ] ${stopwatch.elapsedMilliseconds} ms", name: "DURATION");
    }
    return result;
  }
}

abstract class ErrorUtil {
  // static final _db = FirebaseFirestore.instance;

  /// 에러 핸들링
  static Future<void> handle({
    required dynamic e,
    required bool isShowToast,
    String? errorMessage,
    String? subTitle,
    String? etcInfo,
  }) async {
    try {
      // final data = ToJsonUtil.errorLog(
      //   e: e ?? "",
      //   stackTrace: StackTrace.current,
      //   deviceInfo: await DeviceInfoUtil.getDeviceInfo(),
      // );

      // if (isShowToast) {
      //   ToastUtil.show(
      //     title: errorMessage ?? "문제가 발생했어요",
      //     subTitle: subTitle ?? "잠시 후 다시 시도해주세요",
      //     bgColor: ColorUtil.error,
      //     textColor: Colors.white,
      //   );
      // }

      // await _db
      //     .collection(DbEnum.errorLog.name)
      //     .doc(StringUtil.getUUID())
      //     .set(data);
    } catch (e) {
      // ignore: avoid_print
    }
  }
}

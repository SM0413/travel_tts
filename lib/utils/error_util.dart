import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:travel_tts/enums/db/db_enum.dart';
import 'package:travel_tts/utils/color_util.dart';
import 'package:travel_tts/utils/device_info_util.dart';
import 'package:travel_tts/utils/network_util.dart';
import 'package:travel_tts/utils/string_util.dart';
import 'package:travel_tts/utils/to_json_util.dart';
import 'package:travel_tts/utils/toast_util.dart';

abstract class ErrorUtil {
  static final _db = FirebaseFirestore.instance;

  /// 에러 핸들링
  static Future<void> handle({
    required dynamic e,
    required bool isShowToast,
    required String userId,
    String? errorMessage,
    String? subTitle,
    String? etcInfo,
  }) async {
    try {
      final data = ToJsonUtil.errorLog(
        userId: userId,
        e: e ?? "",
        stackTrace: StackTrace.current,
        deviceInfo: await DeviceInfoUtil.getDeviceInfo(),
      );

      if (isShowToast) {
        ToastUtil.show(
          title: errorMessage ?? "문제가 발생했어요",
          subTitle: subTitle ?? "잠시 후 다시 시도해주세요",
          bgColor: ColorUtil.error,
          textColor: Colors.white,
        );
      }
      if (await NetworkUtil.isOnlineNow()) {
        await _db
            .collection(DbEnum.errorLog.name)
            .doc(StringUtil.getUUID())
            .set(data);
      }
    } catch (e) {
      // ignore: avoid_print
    }
  }
}

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:travel_tts/common/provider/local_db_state_provider.dart';
import 'package:travel_tts/common/provider/user_state_provider.dart';
import 'package:travel_tts/enums/db/db_enum.dart';
import 'package:travel_tts/utils/device_info_util.dart';
import 'package:travel_tts/utils/network_util.dart';
import 'package:travel_tts/utils/string_util.dart';
import 'package:travel_tts/utils/to_json_util.dart';

/// 프로젝트 전체 공통 함수
abstract class GlobalUtil {
  /// 값이 비어있는지 체크
  ///
  /// String, List, Map, num, File 타입에 대해 체크 나머지는 true 반환
  ///
  /// [return] 값이 비어있으면 true, 아니면 false
  static bool isEmpty(dynamic value) {
    if (value == null) return true; // 먼저 null 체크
    if (value is String) {
      return value.trim().isEmpty;
    } else if (value is List || value is Map) {
      return value.isEmpty;
    } else if (value is num) {
      return value.isNaN || value < 0;
    } else if (value is File) {
      if (!value.existsSync()) return true; // 파일 존재 X
      // 0바이트인지 체크
      final length = value.lengthSync(); // 파일 길이(바이트)
      return length == 0;
    }
    return false;
  }

  static void openSetting() async {
    openAppSettings();
  }

  static GlobalKey<T> createGlobalKey<T extends State<StatefulWidget>>() {
    return GlobalKey<T>();
  }

  static List<Map<String, dynamic>> getDocs(
    QuerySnapshot<Map<String, dynamic>> res,
  ) {
    return res.docs.map((doc) => doc.data()).toList();
  }

  static Map<String, dynamic>? getSingleDoc(
    DocumentSnapshot<Map<String, dynamic>> res,
  ) {
    if (isEmpty(res.data())) return null;
    return res.data();
  }

  static Future<void> failFn({required dynamic ref, required dynamic e}) async {
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
      if (!isEmpty(errorList)) {
        final List<Future> uploadFUture = errorList.map((item) {
          return FirebaseFirestore.instance
              .collection(DbEnum.errorLog.name)
              .doc(StringUtil.getUUID())
              .set(item);
        }).toList();
        await Future.wait(uploadFUture);
        await ref.read(localDbStateProvider.notifier).setState(errorList: []);
      }
    }
  }
}

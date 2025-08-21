import 'dart:io';

import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

/// 프로젝트 전체 공통 함수
abstract class GlobalUtil {
  /// 값이 비어있는지 체크
  ///
  /// String, List, Map, num, File 타입에 대해 체크 나머지는 true 반환
  ///
  /// [return] 값이 비어있으면 true, 아니면 false
  static bool isEmpty(dynamic value) {
    if (value == null) return true; // 먼저 null 체크
    if (value is String || value is List || value is Map) {
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
}

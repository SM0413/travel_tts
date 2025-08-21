import 'package:flutter/services.dart';
import 'package:travel_tts/utils/toast_util.dart';
import 'package:uuid/uuid.dart';

abstract class StringUtil {
  static Future<void> copy({required String value, String? title}) async {
    await Clipboard.setData(ClipboardData(text: value));
    ToastUtil.show(title: title ?? "복사되었어요!");
  }

  /// [version] : v1, v4, v5, v6, v7, v8
  ///
  /// default : v6
  static String getUUID({
    String? version,
    String? v5Namespace,
    String? v5Name,
  }) {
    final uuid = const Uuid();
    String result = uuid.v6();
    switch (version) {
      case "v1":
        result = uuid.v1();
        break;
      case "v4":
        result = uuid.v4();
        break;
      case "v5":
        result = uuid.v5("$v5Namespace", "$v5Name");
        break;
      case "v7":
        result = uuid.v7();
        break;
      case "v8":
        result = uuid.v8();
        break;
      default:
        break;
    }
    return result;
  }
}

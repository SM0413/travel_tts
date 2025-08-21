import 'package:travel_tts/common/model/users_model.dart';
import 'package:travel_tts/utils/global_util.dart';

abstract class ModelUtil {
  /// json을 T로 변환
  static List<T>? fromJson<T>({
    List<dynamic>? json,
    required T Function(Map<String, dynamic>) fromJson,
  }) {
    // infoList가 비어 있으면 null 반환
    if (GlobalUtil.isEmpty(json)) return null;

    // infoList를 T로 변환
    return json!.map((item) => fromJson(item!)).toList();
  }

  static dynamic toJson(dynamic data) {
    if (data == null) return null;
    if (data is List) {
      return data.map((e) => toJson(e)).toList();
    }
    if (data is Map) {
      return data.map((key, value) => MapEntry(key, toJson(value)));
    }
    try {
      return data.toJson();
    } catch (e) {
      return data;
    }
  }

  static dynamic fromJsonUser(dynamic data) {
    if (GlobalUtil.isEmpty(data)) return null;
    if (data is List) {
      return data
          .map((info) => UsersModel.fromJson(info))
          .toList()
          .cast<UsersModel>();
    }
    return UsersModel.fromJson(data);
  }
}

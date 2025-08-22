// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UsersModel _$UsersModelFromJson(Map<String, dynamic> json) => _UsersModel(
  id: json['id'] as String? ?? "",
  name: json['name'] as String? ?? "",
  createdAt: ModelUtil.fromJsonTimeStamp(json['createdAt']),
  updatedAt: ModelUtil.fromJsonTimeStamp(json['updatedAt']),
);

Map<String, dynamic> _$UsersModelToJson(_UsersModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };

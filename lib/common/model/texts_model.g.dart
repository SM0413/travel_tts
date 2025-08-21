// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'texts_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TextsModel _$TextsModelFromJson(Map<String, dynamic> json) => _TextsModel(
  id: (json['id'] as num?)?.toInt() ?? -1,
  source: json['source'] as String? ?? "",
  target: json['target'] as String? ?? "",
  sourceLocale: json['sourceLocale'] as String? ?? "",
  targetLocale: json['targetLocale'] as String? ?? "",
  tags:
      (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  pitchSpeed: json['pitchSpeed'] as String? ?? "",
  userId: json['userId'] as String? ?? "",
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
  updatedAt: json['updated_at'] == null
      ? null
      : DateTime.parse(json['updated_at'] as String),
);

Map<String, dynamic> _$TextsModelToJson(_TextsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'source': instance.source,
      'target': instance.target,
      'sourceLocale': instance.sourceLocale,
      'targetLocale': instance.targetLocale,
      'tags': instance.tags,
      'pitchSpeed': instance.pitchSpeed,
      'userId': instance.userId,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };

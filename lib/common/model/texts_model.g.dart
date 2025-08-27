// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'texts_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TextsModel _$TextsModelFromJson(Map<String, dynamic> json) => _TextsModel(
  id: json['id'] as String? ?? "",
  source: json['source'] as String? ?? "",
  target: json['target'] as String? ?? "",
  sourceLocale: json['sourceLocale'] as String? ?? "",
  targetLocale: json['targetLocale'] as String? ?? "",
  tags:
      (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  userId: json['userId'] as String? ?? "",
  pitchSpeed: (json['pitchSpeed'] as num?)?.toDouble() ?? 1,
  isShare: json['isShare'] as bool? ?? false,
  createdAt: ModelUtil.fromJsonTimeStamp(json['createdAt']),
  updatedAt: ModelUtil.fromJsonTimeStamp(json['updatedAt']),
);

Map<String, dynamic> _$TextsModelToJson(_TextsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'source': instance.source,
      'target': instance.target,
      'sourceLocale': instance.sourceLocale,
      'targetLocale': instance.targetLocale,
      'tags': instance.tags,
      'userId': instance.userId,
      'pitchSpeed': instance.pitchSpeed,
      'isShare': instance.isShare,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'texts_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TextsModel _$TextsModelFromJson(Map<String, dynamic> json) => _TextsModel(
  id: (json['id'] as num?)?.toInt() ?? -1,
  source: json['source'] as String? ?? "",
  target: json['target'] as String? ?? "",
  locale: json['locale'] as String? ?? "",
  tags: json['tags'] as String? ?? "",
  pitchSpeed: json['pitchSpeed'] as String? ?? "",
  publicTextRef: json['publicTextRef'] as String? ?? "",
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
      'locale': instance.locale,
      'tags': instance.tags,
      'pitchSpeed': instance.pitchSpeed,
      'publicTextRef': instance.publicTextRef,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };

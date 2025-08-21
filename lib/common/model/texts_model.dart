import 'package:freezed_annotation/freezed_annotation.dart';

part 'texts_model.freezed.dart';
part 'texts_model.g.dart';

@freezed
abstract class TextsModel with _$TextsModel {
  const factory TextsModel({
    @Default(-1) int id,
    @Default("") String source,
    @Default("") String target,
    @Default("") String sourceLocale,
    @Default("") String targetLocale,
    @Default([]) List<String> tags,
    @Default("") String pitchSpeed,
    @Default("") String userId,
    @JsonKey(name: "created_at") DateTime? createdAt,
    @JsonKey(name: "updated_at") DateTime? updatedAt,
  }) = _TextsModel;

  factory TextsModel.fromJson(Map<String, dynamic> json) =>
      _$TextsModelFromJson(json);
}

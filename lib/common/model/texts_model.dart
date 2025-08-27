import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:travel_tts/utils/model_util.dart';

part 'texts_model.freezed.dart';
part 'texts_model.g.dart';

@freezed
abstract class TextsModel with _$TextsModel {
  const factory TextsModel({
    @Default("") String id,
    @Default("") String source,
    @Default("") String target,
    @Default("") String sourceLocale,
    @Default("") String targetLocale,
    @Default([]) List<String> tags,
    @Default("") String userId,
    @Default(1) double pitchSpeed,
    @Default(false) bool isShare,
    @JsonKey(fromJson: ModelUtil.fromJsonTimeStamp) DateTime? createdAt,
    @JsonKey(fromJson: ModelUtil.fromJsonTimeStamp) DateTime? updatedAt,
  }) = _TextsModel;

  factory TextsModel.fromJson(Map<String, dynamic> json) =>
      _$TextsModelFromJson(json);
}

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:travel_tts/utils/model_util.dart';

part 'users_model.freezed.dart';
part 'users_model.g.dart';

@freezed
abstract class UsersModel with _$UsersModel {
  const factory UsersModel({
    @Default("") String id,
    @Default("") String name,
    @JsonKey(fromJson: ModelUtil.fromJsonTimeStamp) DateTime? createdAt,
    @JsonKey(fromJson: ModelUtil.fromJsonTimeStamp) DateTime? updatedAt,
  }) = _UsersModel;

  factory UsersModel.fromJson(Map<String, dynamic> json) =>
      _$UsersModelFromJson(json);
}

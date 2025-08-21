import 'package:freezed_annotation/freezed_annotation.dart';

part 'users_model.freezed.dart';
part 'users_model.g.dart';

@freezed
abstract class UsersModel with _$UsersModel {
  const factory UsersModel({
    @Default(-1) int id,
    @Default("") String name,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _UsersModel;

  factory UsersModel.fromJson(Map<String, dynamic> json) =>
      _$UsersModelFromJson(json);
}

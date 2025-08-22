import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:travel_tts/common/model/texts_model.dart';

part 'local_db_model.freezed.dart';

@freezed
abstract class LocalDbModel with _$LocalDbModel {
  const factory LocalDbModel({
    @Default([]) List<TextsModel> texts,
    @Default([]) List<String> favoriteList,
    @Default(["한국어", "영어"]) List<String> downloadedLangPack,
  }) = _LocalDbModel; // 올바른 생성자 이름
}

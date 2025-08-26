import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:travel_tts/common/model/texts_model.dart';

part 'my_texts_list_main_page_model.freezed.dart';

@freezed
abstract class MyTextsListMainPageModel with _$MyTextsListMainPageModel {
  const factory MyTextsListMainPageModel({
    @Default([]) List<TextsModel> deleteModelList,
    @Default(false) bool isDelete,
    @Default(false) bool isCheckAll,
  }) = _MyTextsListMainPageModel; // 올바른 생성자 이름
}

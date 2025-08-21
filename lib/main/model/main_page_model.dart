import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:travel_tts/common/model/texts_model.dart';

part 'main_page_model.freezed.dart';

@freezed
abstract class MainPageModel with _$MainPageModel {
  const factory MainPageModel({
    required TextEditingController searchController,
    required FocusNode searchFocus,
    @Default([]) List<TextsModel> texts,
  }) = _MainPageModel; // 올바른 생성자 이름
}

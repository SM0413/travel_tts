import 'package:flutter/widgets.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_mlkit_translation/google_mlkit_translation.dart';

part 'upload_texts_model.freezed.dart';

@freezed
abstract class UploadTextsModel with _$UploadTextsModel {
  const factory UploadTextsModel({
    required TextEditingController sourceController,
    required TextEditingController targetController,
    required TextEditingController localeController,
    required TextEditingController tagController,
    required FocusNode sourceFocus,
    required FocusNode targetFocus,
    required FocusNode localeFocus,
    required FocusNode tagFocus,
    required GlobalKey<FormBuilderState> formKey,
    required GlobalKey<FormBuilderFieldState> sourceKey,
    required GlobalKey<FormBuilderFieldState> targetKey,
    required GlobalKey<FormBuilderFieldState> sourceLocaleKey,
    required GlobalKey<FormBuilderFieldState> targetLocaleKey,
    required GlobalKey<FormBuilderFieldState> pitchSpeedKey,
    required GlobalKey<FormBuilderFieldState> tagKey,
    required GlobalKey<FormBuilderFieldState> shareKey,
    required TranslateLanguage sourceTransLang,
    required TranslateLanguage targetTransLang,
    @Default(false) bool isFinished,
    @Default([]) List<String> tags,
  }) = _UploadTextsModel; // 올바른 생성자 이름
}

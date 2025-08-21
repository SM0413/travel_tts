import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_mlkit_translation/google_mlkit_translation.dart';

part 'upload_texts_model.freezed.dart';

@freezed
abstract class UploadTextsModel with _$UploadTextsModel {
  const factory UploadTextsModel({
    required TextEditingController sourceController,
    required TextEditingController targetController,
    required TextEditingController localeController,
    required TextEditingController speakSpeedController,
    required TextEditingController pitchSpeedController,
    required TextEditingController tagController,
    required FocusNode sourceFocus,
    required FocusNode targetFocus,
    required FocusNode localeFocus,
    required FocusNode speakSpeedFocus,
    required FocusNode pitchSpeedFocus,
    required FocusNode tagFocus,
    required GlobalKey formKey,
    required GlobalKey sourceKey,
    required GlobalKey targetKey,
    required GlobalKey localeKey,
    required GlobalKey speakSpeedKey,
    required GlobalKey pitchSpeedKey,
    required GlobalKey tagKey,
    required GlobalKey shareKey,
    required TranslateLanguage sourceTransLang,
    required TranslateLanguage targetTransLang,
    @Default(false) bool isFinished,
    @Default(false) bool isShare,
  }) = _UploadTextsModel; // 올바른 생성자 이름
}

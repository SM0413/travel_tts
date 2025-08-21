import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_mlkit_translation/google_mlkit_translation.dart';
import 'package:travel_tts/main/model/upload_texts_model.dart';
import 'package:travel_tts/utils/global_util.dart';
import 'package:travel_tts/utils/toast_util.dart';
import 'package:travel_tts/utils/trans_util.dart';
import 'package:travel_tts/utils/try_catch_util.dart';

class UploadTextsStateProvider extends AutoDisposeNotifier<UploadTextsModel> {
  @override
  UploadTextsModel build() {
    return UploadTextsModel(
      sourceController: TextEditingController(),
      targetController: TextEditingController(),
      localeController: TextEditingController(),
      speakSpeedController: TextEditingController(),
      pitchSpeedController: TextEditingController(),
      tagController: TextEditingController(),
      sourceFocus: FocusNode(),
      targetFocus: FocusNode(),
      localeFocus: FocusNode(),
      speakSpeedFocus: FocusNode(),
      pitchSpeedFocus: FocusNode(),
      tagFocus: FocusNode(),
      formKey: GlobalUtil.createGlobalKey<FormState>(),
      sourceKey: GlobalUtil.createGlobalKey<FormFieldState>(),
      targetKey: GlobalUtil.createGlobalKey<FormFieldState>(),
      localeKey: GlobalUtil.createGlobalKey<FormFieldState>(),
      speakSpeedKey: GlobalUtil.createGlobalKey<FormFieldState>(),
      pitchSpeedKey: GlobalUtil.createGlobalKey<FormFieldState>(),
      tagKey: GlobalUtil.createGlobalKey<FormFieldState>(),
      shareKey: GlobalUtil.createGlobalKey<FormFieldState>(),
      sourceTransLang: TranslateLanguage.korean,
      targetTransLang: TranslateLanguage.english,
    );
  }

  void setState({
    bool? isFinished,
    bool? isShare,
    TranslateLanguage? sourceTransLang,
    TranslateLanguage? targetTransLang,
  }) {
    state = state.copyWith(
      isFinished: isFinished ?? state.isFinished,
      isShare: isShare ?? state.isShare,
      sourceTransLang: sourceTransLang ?? state.sourceTransLang,
      targetTransLang: targetTransLang ?? state.targetTransLang,
    );
  }

  Future<void> updateTrans() async {
    return await TryCatchUtil.handle(
      fn: () async {
        final text = state.sourceController.text.trim();

        if (state.sourceTransLang == state.targetTransLang) {
          ToastUtil.show(title: "소스와 타겟언어가 같아요");
          return;
        }
        await ToastUtil.loading(() async {
          final transUtil = TransUtil(
            state.sourceTransLang,
            state.targetTransLang,
          );
          final result = await transUtil.translate(text);
          // 최신 입력 기준으로만 반영 (여기선 간단히 바로 반영)
          state.targetController.text = result;
        });
      },
      isShowToast: true,
      fnName: "fnName",
    );
  }
}

final uploadTextsStateProvider =
    AutoDisposeNotifierProvider<UploadTextsStateProvider, UploadTextsModel>(
      UploadTextsStateProvider.new,
    );

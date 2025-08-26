import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_mlkit_translation/google_mlkit_translation.dart';
import 'package:travel_tts/common/provider/local_db_state_provider.dart';
import 'package:travel_tts/common/provider/user_state_provider.dart';
import 'package:travel_tts/enums/db/db_enum.dart';
import 'package:travel_tts/enums/trans_enum.dart';
import 'package:travel_tts/main/model/upload_texts_model.dart';
import 'package:travel_tts/utils/device_info_util.dart';
import 'package:travel_tts/utils/global_util.dart';
import 'package:travel_tts/utils/network_util.dart';
import 'package:travel_tts/utils/string_util.dart';
import 'package:travel_tts/utils/to_json_util.dart';
import 'package:travel_tts/utils/toast_util.dart';
import 'package:travel_tts/utils/trans_util.dart';
import 'package:travel_tts/utils/try_catch_util.dart';

class UploadTextsStateProvider extends AutoDisposeNotifier<UploadTextsModel> {
  @override
  UploadTextsModel build() {
    final localState = ref.read(localDbStateProvider).value;
    return UploadTextsModel(
      sourceController: TextEditingController(),
      targetController: TextEditingController(),
      localeController: TextEditingController(),
      tagController: TextEditingController(),
      sourceFocus: FocusNode(),
      targetFocus: FocusNode(),
      localeFocus: FocusNode(),
      tagFocus: FocusNode(),
      formKey: GlobalUtil.createGlobalKey<FormBuilderState>(),
      sourceKey: GlobalUtil.createGlobalKey<FormBuilderFieldState>(),
      targetKey: GlobalUtil.createGlobalKey<FormBuilderFieldState>(),
      sourceLocaleKey: GlobalUtil.createGlobalKey<FormBuilderFieldState>(),
      targetLocaleKey: GlobalUtil.createGlobalKey<FormBuilderFieldState>(),
      pitchSpeedKey: GlobalUtil.createGlobalKey<FormBuilderFieldState>(),
      tagKey: GlobalUtil.createGlobalKey<FormBuilderFieldState>(),
      shareKey: GlobalUtil.createGlobalKey<FormBuilderFieldState>(),
      sourceTransLang: TranslateLanguage.korean,
      targetTransLang: TransEnum.values
          .firstWhere(
            (item) => item.ko == localState?.defaultTargetLocale,
            orElse: () => TransEnum.english,
          )
          .type,
      initPitchSpeedValue: localState?.defaultPitchSpeed ?? 1.0,
      initShareValue: localState?.isDefaultShareWhenUpload ?? false,
      initTargetLocaleValue: TransEnum.values
          .firstWhere(
            (item) => item.ko == localState?.defaultTargetLocale,
            orElse: () => TransEnum.english,
          )
          .ko,
    );
  }

  void setState({
    bool? isFinished,
    TranslateLanguage? sourceTransLang,
    TranslateLanguage? targetTransLang,
    List<String>? tags,
  }) {
    state = state.copyWith(
      isFinished: isFinished ?? state.isFinished,
      sourceTransLang: sourceTransLang ?? state.sourceTransLang,
      targetTransLang: targetTransLang ?? state.targetTransLang,
      tags: tags ?? state.tags,
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
          final result = await transUtil.translate(text, ref);
          // 최신 입력 기준으로만 반영 (여기선 간단히 바로 반영)
          state.targetController.text = result;
        });
      },
      isShowToast: true,
      fnName: "upload_texts_state_provider > updateTrans",
      userId: ref.read(userStateProvider).id,
      failFn: (e) async {
        if (!await NetworkUtil.isOnlineNow()) {
          await ref
              .read(localDbStateProvider.notifier)
              .setErrorList(
                data: ToJsonUtil.errorLog(
                  userId: ref.read(userStateProvider).id,
                  e: e,
                  stackTrace: StackTrace.current,
                  deviceInfo: await DeviceInfoUtil.getDeviceInfo(),
                ),
              );
        } else {
          final errorList = ref.read(localDbStateProvider).value!.errorList;
          if (!GlobalUtil.isEmpty(errorList)) {
            final List<Future> uploadFUture = errorList.map((item) {
              return FirebaseFirestore.instance
                  .collection(DbEnum.errorLog.name)
                  .doc(StringUtil.getUUID())
                  .set(item);
            }).toList();
            await Future.wait(uploadFUture);
            await ref
                .read(localDbStateProvider.notifier)
                .setState(errorList: []);
          }
        }
      },
    );
  }

  void setTags({String? tag}) {
    final asis = List<String>.from(state.tags);
    if (tag != null) {
      // 삭제
      asis.remove(tag);
    } else {
      // 등록
      tag = state.tagController.text.trim();
      if (GlobalUtil.isEmpty(tag)) {
        ToastUtil.show(title: "태그 내용을 입력해주세요");
        state.tagFocus.requestFocus();
        return;
      }

      if (asis.contains(tag)) {
        ToastUtil.show(title: "이미 등록한 태그예요");
        state.tagFocus.requestFocus();
        return;
      }
      if (asis.length >= 5) {
        ToastUtil.show(title: "태그는 최대 5개까지만 등록 가능해요");
        state.tagFocus.requestFocus();
        return;
      }
      asis.add(tag);
    }

    state.tagController.clear();
    state.tagFocus.requestFocus();
    setState(tags: asis);
  }
}

final uploadTextsStateProvider =
    AutoDisposeNotifierProvider<UploadTextsStateProvider, UploadTextsModel>(
      UploadTextsStateProvider.new,
    );

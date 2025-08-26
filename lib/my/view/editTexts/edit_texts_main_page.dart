import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:travel_tts/common/model/texts_model.dart';
import 'package:travel_tts/common/provider/local_db_state_provider.dart';
import 'package:travel_tts/common/view/widgets/common_inkwell_widget.dart';
import 'package:travel_tts/common/view/widgets/common_scaffold_widget.dart';
import 'package:travel_tts/common/view/widgets/common_submit_widget.dart';
import 'package:travel_tts/common/view/widgets/common_text_widget.dart';
import 'package:travel_tts/constructs/trans_const.dart';
import 'package:travel_tts/enums/db/texts_enum.dart';
import 'package:travel_tts/enums/icon_enum.dart';
import 'package:travel_tts/enums/router_enum.dart';
import 'package:travel_tts/enums/trans_enum.dart';
import 'package:travel_tts/main/provider/upload_texts_provider.dart';
import 'package:travel_tts/my/provider/editText/edit_texts_state_provider.dart';
import 'package:travel_tts/utils/color_util.dart';
import 'package:travel_tts/utils/global_util.dart';
import 'package:travel_tts/utils/network_util.dart';
import 'package:travel_tts/utils/router_util.dart';
import 'package:travel_tts/utils/size_util.dart';
import 'package:travel_tts/utils/text_util.dart';
import 'package:travel_tts/utils/toast_util.dart';
import 'package:travel_tts/utils/tts_util.dart';

class EditTextsMainPage extends HookConsumerWidget {
  const EditTextsMainPage({super.key, required this.text});

  final TextsModel text;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(editTextsStateProvider);
    final stateNotifier = ref.read(editTextsStateProvider.notifier);
    final localDbState = ref.watch(localDbStateProvider).value;
    final isNowSpeak = useState<bool>(false);
    useEffect(() {
      RouterUtil.waitBuild(
        fn: () {
          state.sourceController.text = text.source;
          state.targetController.text = text.target;
          stateNotifier.setState(
            sourceTransLang: TransEnum.values
                .firstWhere(
                  (item) => item.ko == text.sourceLocale,
                  orElse: () => TransEnum.korean,
                )
                .type,
            targetTransLang: TransEnum.values
                .firstWhere(
                  (item) => item.ko == text.targetLocale,
                  orElse: () => TransEnum.english,
                )
                .type,
            tags: text.tags,
          );
        },
      );
      return () {
        TtsUtil.stop();
      };
    }, []);

    return CommonScaffoldWidget(
      appBar: AppBar(title: const CommonTextWidget("수정")),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                FormBuilder(
                  key: state.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Card(
                        elevation: 0,
                        color: Theme.of(context).colorScheme.surface,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                          side: BorderSide(
                            color: Theme.of(context).dividerColor,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    IconEnum.trans.outline.icon,
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.primary,
                                  ),
                                  SizeUtil.basicWPadding(width: 8),
                                  CommonTextWidget(
                                    "언어 설정",
                                    style: TextUtil.textTheme(
                                      context,
                                    ).titleMedium,
                                    isBold: true,
                                  ),
                                  const Spacer(),
                                  CommonInkwellWidget(
                                    tooltip: "다운로드 화면으로 이동",
                                    onTap: () {
                                      RouterUtil.push(
                                        context: context,
                                        routeEnum: RouterEnum.myDownload,
                                      );
                                    },
                                    child: CommonTextWidget(
                                      "언어 팩 다운로드",
                                      style: TextUtil.textTheme(
                                        context,
                                      ).labelLarge,
                                      fontColor: ColorUtil.unSelected,
                                    ),
                                  ),
                                ],
                              ),
                              SizeUtil.basicHPadding(height: 12),
                              FormBuilderDropdown<String>(
                                key: state.sourceLocaleKey,
                                initialValue: text.sourceLocale,
                                name: TextsEnum.sourceLocale.name,
                                decoration: const InputDecoration(
                                  labelText: "소스 언어",
                                  hintText: "원문의 언어를 선택하세요",
                                  prefixIcon: Icon(Icons.record_voice_over),
                                ),
                                items: TransEnum.values
                                    .where(
                                      (enumInfo) =>
                                          (localDbState?.downloadedLangPack ??
                                                  [])
                                              .contains(enumInfo.ko),
                                    )
                                    .map(
                                      (trans) => DropdownMenuItem(
                                        value: trans.ko,
                                        child: CommonTextWidget(trans.ko),
                                      ),
                                    )
                                    .toList(),
                                onChanged: (value) async {
                                  if (value == null) return;
                                  isNowSpeak.value = false;
                                  await TtsUtil.stop();
                                  stateNotifier.setState(
                                    sourceTransLang: TransEnum.values
                                        .firstWhere(
                                          (type) => type.ko == value,
                                          orElse: () => TransEnum.korean,
                                        )
                                        .type,
                                  );
                                  await stateNotifier.updateTrans();
                                },
                              ),
                              SizeUtil.basicHPadding(height: 12),
                              FormBuilderDropdown<String>(
                                key: state.targetLocaleKey,
                                initialValue: text.targetLocale,
                                name: TextsEnum.targetLocale.name,
                                decoration: const InputDecoration(
                                  labelText: "타겟 언어",
                                  hintText: "번역될 언어를 선택하세요",
                                  prefixIcon: Icon(Icons.translate),
                                ),
                                items: TransEnum.values
                                    .where(
                                      (enumInfo) =>
                                          (localDbState?.downloadedLangPack ??
                                                  [])
                                              .contains(enumInfo.ko),
                                    )
                                    .map(
                                      (trans) => DropdownMenuItem(
                                        value: trans.ko,
                                        child: CommonTextWidget(trans.ko),
                                      ),
                                    )
                                    .toList(),
                                onChanged: (value) async {
                                  if (value == null) return;
                                  isNowSpeak.value = false;
                                  await TtsUtil.stop();
                                  stateNotifier.setState(
                                    targetTransLang: TransEnum.values
                                        .firstWhere(
                                          (type) => type.ko == value,
                                          orElse: () => TransEnum.english,
                                        )
                                        .type,
                                  );
                                  await stateNotifier.updateTrans();
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizeUtil.basicHPadding(height: 16),
                      Card(
                        elevation: 0,
                        color: Theme.of(context).colorScheme.surface,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                          side: BorderSide(
                            color: Theme.of(context).dividerColor,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                          child: Column(
                            children: [
                              FormBuilderTextField(
                                key: state.sourceKey,
                                name: TextsEnum.source.name,
                                controller: state.sourceController,
                                focusNode: state.sourceFocus,
                                keyboardType: TextInputType.multiline,
                                maxLines: 5,
                                maxLength: 500,
                                decoration: InputDecoration(
                                  icon: IconEnum.text.outline,
                                  hintText: "번역을 원하는 문장을 입력하세요",
                                  labelText: "원문",
                                  helperText: "입력 후 '번역' 버튼을 누르면 자동 번역됩니다",
                                  suffixIcon: Tooltip(
                                    message: "번역",
                                    child: IconButton(
                                      onPressed: () async {
                                        isNowSpeak.value = false;
                                        await TtsUtil.stop();
                                        final sourceText = state
                                            .sourceController
                                            .text
                                            .trim();
                                        if (GlobalUtil.isEmpty(sourceText)) {
                                          ToastUtil.show(
                                            title: "번역할 내용을 적어주세요",
                                          );
                                          state.sourceFocus.requestFocus();
                                          state.targetController.clear();
                                          return;
                                        }
                                        await stateNotifier.updateTrans();
                                      },
                                      icon: const Icon(Icons.g_translate),
                                    ),
                                  ),
                                ),
                                validator: FormBuilderValidators.compose([
                                  FormBuilderValidators.required(
                                    checkNullOrEmpty: true,
                                    errorText: "번역을 원하는 문자를 적어주세요",
                                  ),
                                ]),
                              ),
                              SizeUtil.basicHPadding(height: 8),
                              const Divider(height: 1),
                              SizeUtil.basicHPadding(height: 8),
                              FormBuilderTextField(
                                key: state.targetKey,
                                name: TextsEnum.target.name,
                                controller: state.targetController,
                                focusNode: state.targetFocus,
                                readOnly: true,
                                maxLines: 10,
                                decoration: InputDecoration(
                                  icon: IconEnum.text.outline,
                                  labelText: "번역 결과",
                                  helperText: "'말하기' 버튼으로 음성으로 들어볼 수 있어요",
                                  suffixIcon: Tooltip(
                                    message: "말하기 / 정지",
                                    child: IconButton(
                                      onPressed: () async {
                                        final value = state
                                            .targetController
                                            .text
                                            .trim();
                                        if (GlobalUtil.isEmpty(value)) return;

                                        if (isNowSpeak.value) {
                                          // 이미 말하는 중이면 정지
                                          await TtsUtil.stop();
                                          isNowSpeak.value = false;
                                        } else {
                                          // 말하기 시작
                                          isNowSpeak.value = true;
                                          await TtsUtil.play(
                                            value: value,
                                            speed:
                                                state
                                                    .pitchSpeedKey
                                                    .currentState
                                                    ?.value ??
                                                1.0,
                                            transEnum: TransEnum.values
                                                .firstWhere(
                                                  (item) =>
                                                      item.type ==
                                                      state.targetTransLang,
                                                ),
                                          );
                                          if (!context.mounted) return;
                                          isNowSpeak.value = false;
                                        }
                                      },
                                      icon: isNowSpeak.value
                                          ? IconEnum.speakStop.outline
                                          : IconEnum.speak.outline,
                                    ),
                                  ),
                                ),
                                onChanged: (value) {
                                  state.formKey.currentState?.validate();
                                },
                                validator: FormBuilderValidators.compose([
                                  FormBuilderValidators.required(
                                    checkNullOrEmpty: true,
                                    errorText: "번역된 문자를 생성해주세요",
                                  ),
                                ]),
                              ),
                            ],
                          ),
                        ),
                      ),
                      FormBuilderSlider(
                        key: state.pitchSpeedKey,
                        name: TextsEnum.pitchSpeed.name,
                        initialValue: text.pitchSpeed,
                        min: TransConst.minRate,
                        max: TransConst.maxRate,
                        divisions: TransConst.divisions,
                        decoration: const InputDecoration(
                          labelText: "속도 조절",
                          helperText: "0.1 단위로 조절할 수 있어요",
                        ),
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(
                            checkNullOrEmpty: true,
                            errorText: "필수 값 입니다",
                          ),
                        ]),
                        onChangeEnd: (value) async {
                          isNowSpeak.value = false;
                          await TtsUtil.stop();
                        },
                      ),
                      FormBuilderCheckbox(
                        key: state.shareKey,
                        name: TextsEnum.isShare.name,
                        title: const CommonTextWidget("공유하기"),
                        initialValue: text.isShare,
                        subtitle: const CommonTextWidget(
                          "다른 유저와 이 문장을 공유해보세요!",
                        ),
                        onChanged: (value) async {
                          if (value == true &&
                              !await NetworkUtil.isOnlineNow()) {
                            ToastUtil.show(title: "인터넷 연결을 해주셔야 공유가 가능해요");
                            state.shareKey.currentState?.didChange(false);
                          }
                        },
                      ),
                      FormBuilderTextField(
                        key: state.tagKey,
                        name: "tag",
                        controller: state.tagController,
                        focusNode: state.tagFocus,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          labelText: "태그",
                          hintText: "태그내용을 적어주세요",
                          prefixIcon: IconEnum.text.outline,
                          helperText: "검색 시 사용돼요",
                          suffixIcon: IconButton(
                            onPressed: () {
                              state.tagController.clear();
                              state.tagFocus.requestFocus();
                            },
                            icon: IconEnum.close.outline,
                          ),
                        ),
                        onSubmitted: (value) => stateNotifier.setTags(),
                      ),
                      if (!GlobalUtil.isEmpty(state.tags))
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: state.tags.map((tag) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 5,
                                ),
                                child: Chip(
                                  label: CommonTextWidget(tag),
                                  onDeleted: () {
                                    stateNotifier.setTags(tag: tag);
                                  },
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      SizeUtil.bottomPadding(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: CommonSubmitWidget(
        height: 80,
        tooltip: "내용 등록",
        text: "등록",
        bgColor: ColorUtil.primary,
        onTap: () async {
          isNowSpeak.value = false;
          await TtsUtil.stop();
          final sourceText = state.sourceController.text.trim();
          if (GlobalUtil.isEmpty(sourceText)) {
            ToastUtil.show(title: "번역할 내용을 적어주세요");
            state.sourceFocus.requestFocus();
            state.targetController.clear();
            return;
          }
          await stateNotifier.updateTrans();
          await ref.read(uploadTextsProvider.notifier).upload().then((value) {
            if (value) {
              RouterUtil.go(context: context, routeEnum: RouterEnum.navigation);
            }
          });
        },
      ),
    );
  }
}

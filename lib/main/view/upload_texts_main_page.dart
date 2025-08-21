import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:travel_tts/common/provider/local_db_provider.dart';
import 'package:travel_tts/common/view/widgets/common_inkwell_widget.dart';
import 'package:travel_tts/common/view/widgets/common_scaffold_widget.dart';
import 'package:travel_tts/common/view/widgets/common_submit_widget.dart';
import 'package:travel_tts/common/view/widgets/common_text_widget.dart';
import 'package:travel_tts/enums/db/texts_enum.dart';
import 'package:travel_tts/enums/icon_enum.dart';
import 'package:travel_tts/enums/router_enum.dart';
import 'package:travel_tts/enums/trans_enum.dart';
import 'package:travel_tts/main/provider/upload_texts_state_provider.dart';
import 'package:travel_tts/navigation/provider/navigation_state_provider.dart';
import 'package:travel_tts/utils/alert_util.dart';
import 'package:travel_tts/utils/color_util.dart';
import 'package:travel_tts/utils/global_util.dart';
import 'package:travel_tts/utils/network_util.dart';
import 'package:travel_tts/utils/router_util.dart';
import 'package:travel_tts/utils/size_util.dart';
import 'package:travel_tts/utils/text_util.dart';
import 'package:travel_tts/utils/toast_util.dart';

class UploadTextsMainPage extends HookConsumerWidget {
  const UploadTextsMainPage({super.key, required this.source});
  final String? source;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(uploadTextsStateProvider);
    final stateNotifier = ref.read(uploadTextsStateProvider.notifier);
    final localDbState = ref.watch(localDbStateProvider).value;
    final isNowSpeak = useState<bool>(false);
    useEffect(() {
      RouterUtil.waitBuild(
        fn: () {
          state.sourceController.text = source ?? "";
        },
      );
      return null;
    }, []);
    return CommonScaffoldWidget(
      appBar: AppBar(title: const CommonTextWidget("업로드")),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              FormBuilder(
                key: state.formKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
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
                                      RouterUtil.go(
                                        context: context,
                                        routeEnum: RouterEnum.navigation,
                                      );
                                      ref
                                          .read(
                                            navigationStateProvider.notifier,
                                          )
                                          .setState(selectedIndex: 1);
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
                                initialValue: TransEnum.values
                                    .firstWhere(
                                      (value) =>
                                          value.type == state.sourceTransLang,
                                      orElse: () => TransEnum.korean,
                                    )
                                    .ko,
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
                                initialValue: TransEnum.values
                                    .firstWhere(
                                      (value) =>
                                          value.type == state.targetTransLang,
                                      orElse: () => TransEnum.english,
                                    )
                                    .ko,
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
                                onSubmitted: (value) {},
                                validator: FormBuilderValidators.required(
                                  checkNullOrEmpty: true,
                                  errorText: "번역을 원하는 문자를 적어주세요",
                                ),
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
                                          final flutterTts = FlutterTts();
                                          await flutterTts.stop();
                                          isNowSpeak.value = false;
                                        } else {
                                          // 말하기 시작
                                          isNowSpeak.value = true;
                                          final flutterTts = FlutterTts();
                                          await flutterTts.speak(value);
                                        }
                                      },
                                      icon: isNowSpeak.value
                                          ? IconEnum.speakStop.outline
                                          : IconEnum.speak.outline,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      FormBuilderSlider(
                        name: TextsEnum.pitchSpeed.name,
                        initialValue: 1,
                        min: 0.1,
                        max: 2,
                        divisions: ((2 - 0.1) / 0.1).round(),
                        decoration: const InputDecoration(
                          labelText: "속도 조절",
                          helperText: "0.1 단위로 조절할 수 있어요",
                        ),
                      ),
                      FormBuilderCheckbox(
                        key: state.shareKey,
                        name: "share",
                        title: const CommonTextWidget("공유하기"),
                        subtitle: const CommonTextWidget(
                          "다른 유저와 이 문장을 공유해보세요!",
                        ),
                        onChanged: (value) async {
                          if (value == true &&
                              !await NetworkUtil.isOnlineNow()) {
                            ToastUtil.show(title: "인터넷 연결을 해주셔야 공유가 가능해요");
                          }
                        },
                      ),
                      SizeUtil.bottomPadding(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CommonSubmitWidget(
        height: 80,
        tooltip: "내용 등록",
        text: "등록",
        bgColor: ColorUtil.primary,
        onTap: () async {
          final isShare = await AlertUtil.show(
            context: context,
            confirmFn: () async {},
            title: "해당내용을 다른 유저와 공유하시겠어요?",
          );

          if (isShare) {
            // TODO DB에 업로드
          }
        },
      ),
    );
  }
}

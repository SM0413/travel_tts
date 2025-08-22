import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:travel_tts/common/model/texts_model.dart';
import 'package:travel_tts/common/provider/local_db_state_provider.dart';
import 'package:travel_tts/common/view/widgets/common_inkwell_widget.dart';
import 'package:travel_tts/common/view/widgets/common_text_widget.dart';
import 'package:travel_tts/enums/db/texts_enum.dart';
import 'package:travel_tts/enums/icon_enum.dart';
import 'package:travel_tts/enums/trans_enum.dart';
import 'package:travel_tts/utils/color_util.dart';
import 'package:travel_tts/utils/global_util.dart';
import 'package:travel_tts/utils/router_util.dart';
import 'package:travel_tts/utils/size_util.dart';
import 'package:travel_tts/utils/toast_util.dart';
import 'package:travel_tts/utils/trans_util.dart';
import 'package:travel_tts/utils/tts_util.dart';

class TextsInfoBottomSheet extends HookConsumerWidget {
  const TextsInfoBottomSheet({super.key, required this.state});

  final TextsModel state;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final targetKey = GlobalUtil.createGlobalKey<FormBuilderFieldState>();
    final speedKey = GlobalUtil.createGlobalKey<FormBuilderFieldState>();
    final transStr = useState<String>("");
    final isPlay = useState<bool>(false);

    useEffect(() {
      RouterUtil.waitBuild(
        fn: () {
          transStr.value = state.target;
        },
      );
      return () {
        TtsUtil.stop();
      };
    }, []);
    return FormBuilder(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconEnum.speak.rounded,

              CommonTextWidget(state.source),
              CommonTextWidget(transStr.value),

              Builder(
                builder: (ctx) {
                  final downloaded =
                      ref
                          .read(localDbStateProvider)
                          .value
                          ?.downloadedLangPack ??
                      <String>[];
                  final availableTrans = TransEnum.values
                      .where((e) => downloaded.contains(e.ko))
                      .toList();
                  final hasTarget = availableTrans.any(
                    (e) => e.ko == state.targetLocale,
                  );
                  final safeTargetInitial = hasTarget
                      ? state.targetLocale
                      : null;

                  final double minRate = 0.5;
                  final double maxRate = 2.0;
                  final double safeSpeed = (state.pitchSpeed)
                      .clamp(minRate, maxRate)
                      .toDouble();
                  final int divisions = ((maxRate - minRate) / 0.1)
                      .round(); // 0.1 step

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        spacing: 5,
                        children: [
                          IconEnum.trans.rounded,
                          CommonTextWidget(state.sourceLocale),
                          const Icon(Icons.arrow_forward_rounded),
                          Expanded(
                            child: FormBuilderDropdown<String>(
                              key: targetKey,
                              name: TextsEnum.targetLocale.name,
                              decoration: const InputDecoration(
                                labelText: "타겟 언어",
                                hintText: "번역될 언어를 선택하세요",
                                prefixIcon: Icon(Icons.translate),
                              ),
                              items: availableTrans
                                  .map(
                                    (transEnum) => DropdownMenuItem<String>(
                                      value: transEnum.ko,
                                      child: CommonTextWidget(transEnum.ko),
                                    ),
                                  )
                                  .toList(),
                              initialValue: safeTargetInitial,
                              onChanged: (value) async {
                                if (state.sourceLocale == value) {
                                  ToastUtil.show(title: "소스와 동일한 언어입니다");
                                  return;
                                }
                                final targetType = TransEnum.values
                                    .firstWhere(
                                      (item) => item.ko == value,
                                      orElse: () => TransEnum.english,
                                    )
                                    .type;
                                final sourceType = TransEnum.values
                                    .firstWhere(
                                      (item) => item.ko == state.sourceLocale,
                                      orElse: () => TransEnum.korean,
                                    )
                                    .type;
                                final tran = TransUtil(sourceType, targetType);
                                transStr.value = await tran.translate(
                                  state.source,
                                  ref,
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                      SizeUtil.basicHPadding(),
                      FormBuilderSlider(
                        key: speedKey,
                        name: TextsEnum.pitchSpeed.name,
                        initialValue: safeSpeed,
                        min: minRate,
                        max: maxRate,
                        divisions: divisions,
                        decoration: const InputDecoration(
                          labelText: "속도 조절",
                          helperText: "0.1 단위로 조절할 수 있어요",
                        ),
                      ),
                    ],
                  );
                },
              ),
              SizeUtil.basicHPadding(),
              CommonInkwellWidget(
                tooltip: isPlay.value ? "정지" : "재생",
                onTap: () async {
                  isPlay.value = !isPlay.value;
                  if (!isPlay.value) {
                    await TtsUtil.stop();
                    isPlay.value = false;
                  } else {
                    isPlay.value = true;
                    await TtsUtil.play(
                      value: transStr.value,
                      speed: speedKey.currentState?.value ?? 1,
                    );
                    isPlay.value = false;
                  }
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(
                    borderRadius: SizeUtil.basicRadius(),
                    color: ColorUtil.withOpacity(
                      color: ColorUtil.primary,
                      opacity: 15,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      isPlay.value
                          ? IconEnum.stop.rounded
                          : IconEnum.play.rounded,
                      CommonTextWidget(
                        isPlay.value ? "정지" : "재생",
                        isBold: true,
                      ),
                    ],
                  ),
                ),
              ),
              SizeUtil.basicHPadding(),
            ],
          ),
        ),
      ),
    );
  }
}

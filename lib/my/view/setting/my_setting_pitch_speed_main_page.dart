import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:travel_tts/common/provider/local_db_state_provider.dart';
import 'package:travel_tts/common/view/widgets/common_text_widget.dart';
import 'package:travel_tts/constructs/trans_const.dart';
import 'package:travel_tts/enums/db/texts_enum.dart';

class MySettingPitchSpeedMainPage extends HookConsumerWidget {
  const MySettingPitchSpeedMainPage({super.key, required this.initValue});

  final double initValue;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localNotifier = ref.read(localDbStateProvider.notifier);
    return ExpansionTile(
      title: const CommonTextWidget("기본 말하기 속도"),
      childrenPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      children: [
        FormBuilderSlider(
          name: TextsEnum.pitchSpeed.name,
          initialValue: initValue,
          min: TransConst.minRate,
          max: TransConst.maxRate,
          divisions: TransConst.divisions,
          decoration: const InputDecoration(
            labelText: "속도 조절",
            helperText: "0.1 단위로 조절할 수 있어요\n번역 생서 시 설정이예요",
          ),
          onChangeEnd: (value) {
            localNotifier.setState(defaultPitchSpeed: value);
          },
        ),
      ],
    );
  }
}

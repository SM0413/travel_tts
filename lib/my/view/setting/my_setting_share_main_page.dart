import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:travel_tts/common/provider/local_db_state_provider.dart';
import 'package:travel_tts/common/view/widgets/common_text_widget.dart';
import 'package:travel_tts/enums/db/texts_enum.dart';

class MySettingShareMainPage extends HookConsumerWidget {
  const MySettingShareMainPage({super.key, required this.initValue});

  final bool initValue;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localNotifier = ref.read(localDbStateProvider.notifier);
    return ExpansionTile(
      title: const CommonTextWidget("기본 공유 설정"),
      childrenPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      children: [
        FormBuilderCheckbox(
          name: TextsEnum.isShare.name,
          title: const CommonTextWidget("공유하기"),
          initialValue: initValue,
          decoration: const InputDecoration(helperText: "번역 생성 시 설정이에요"),
          onChanged: (value) {
            localNotifier.setState(isDefaultShareWhenUpload: value);
          },
        ),
      ],
    );
  }
}

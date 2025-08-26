import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:travel_tts/common/provider/local_db_state_provider.dart';
import 'package:travel_tts/common/view/widgets/common_text_widget.dart';
import 'package:travel_tts/enums/db/texts_enum.dart';
import 'package:travel_tts/enums/trans_enum.dart';

class MySettingTargetLocaleMainPage extends HookConsumerWidget {
  const MySettingTargetLocaleMainPage({super.key, required this.initValue});

  final String initValue;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localState = ref.watch(localDbStateProvider).value;
    final localNotifier = ref.read(localDbStateProvider.notifier);
    return ExpansionTile(
      title: const CommonTextWidget("기본 타겟 언어"),
      childrenPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      children: [
        FormBuilderDropdown<String>(
          name: TextsEnum.targetLocale.name,
          initialValue: initValue,
          items: TransEnum.values
              .where(
                (enumInfo) => (localState?.downloadedLangPack ?? []).contains(
                  enumInfo.ko,
                ),
              )
              .map(
                (trans) => DropdownMenuItem(
                  value: trans.ko,
                  child: CommonTextWidget(trans.ko),
                ),
              )
              .toList(),
          decoration: const InputDecoration(
            helperText: "원하는 언어가 없다면 '다운로드' 페이지에서 다운로드 받아보세요\n번역 생성 시 설정이예요",
          ),
          onChanged: (value) {
            localNotifier.setState(defaultTargetLocale: value);
          },
        ),
      ],
    );
  }
}

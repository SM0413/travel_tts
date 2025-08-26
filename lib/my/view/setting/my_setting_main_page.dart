import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:travel_tts/common/provider/local_db_state_provider.dart';
import 'package:travel_tts/common/view/widgets/common_error_widget.dart';
import 'package:travel_tts/common/view/widgets/common_scaffold_widget.dart';
import 'package:travel_tts/common/view/widgets/common_sliver_widget.dart';
import 'package:travel_tts/common/view/widgets/common_text_widget.dart';
import 'package:travel_tts/enums/db/local_db_enum.dart';
import 'package:travel_tts/my/view/setting/my_setting_pitch_speed_main_page.dart';
import 'package:travel_tts/my/view/setting/my_setting_share_main_page.dart';
import 'package:travel_tts/my/view/setting/my_setting_target_locale_main_page.dart';

class MySettingMainPage extends HookConsumerWidget {
  const MySettingMainPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CommonScaffoldWidget(
      appBar: AppBar(title: const CommonTextWidget("개인 설정")),
      body: CommonSliverWidget(
        slivers: [
          ref
              .watch(localDbStateProvider)
              .when(
                data: (local) {
                  final enumList = LocalDbEnum.values
                      .where((item) => item.isPersonalSetting)
                      .toList();
                  return SliverList.builder(
                    itemCount: enumList.length,
                    itemBuilder: (context, index) {
                      final enumInfo = enumList[index];

                      switch (enumInfo) {
                        case LocalDbEnum.defaultPitchSpeed:
                          return MySettingPitchSpeedMainPage(
                            initValue: local.defaultPitchSpeed,
                          );
                        case LocalDbEnum.defaultTargetLocale:
                          return MySettingTargetLocaleMainPage(
                            initValue: local.defaultTargetLocale,
                          );
                        case LocalDbEnum.isDefaultShareWhenUpload:
                          return MySettingShareMainPage(
                            initValue: local.isDefaultShareWhenUpload,
                          );
                        default:
                          return const SizedBox.shrink();
                      }
                    },
                  );
                },
                error: (error, stackTrace) =>
                    const SliverFillRemaining(child: CommonErrorWidget()),
                loading: () => const SliverFillRemaining(
                  child: Center(child: CircularProgressIndicator()),
                ),
              ),
        ],
      ),
    );
  }
}

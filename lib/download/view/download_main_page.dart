import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:travel_tts/common/view/widgets/common_text_widget.dart';

class DownloadMainPage extends HookConsumerWidget {
  const DownloadMainPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Center(child: CommonTextWidget("DownloadMainPage"));
  }
}

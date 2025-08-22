import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:travel_tts/common/view/widgets/common_scaffold_widget.dart';
import 'package:travel_tts/enums/router_enum.dart';
import 'package:travel_tts/init/provider/init_provider.dart';
import 'package:travel_tts/utils/router_util.dart';

class InitMainPage extends HookConsumerWidget {
  const InitMainPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(() {
      RouterUtil.waitBuild(
        fn: () async {
          await ref.read(initProvider.notifier).init();
          RouterUtil.go(context: context, routeEnum: RouterEnum.navigation);
        },
      );
      return null;
    }, []);
    return const CommonScaffoldWidget(
      body: Center(child: CircularProgressIndicator.adaptive()),
    );
  }
}

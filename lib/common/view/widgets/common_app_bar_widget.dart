import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:travel_tts/enums/icon_enum.dart';
import 'package:travel_tts/enums/router_enum.dart';
import 'package:travel_tts/utils/global_util.dart';
import 'package:travel_tts/utils/router_util.dart';

class CommonAppBarWidget extends HookConsumerWidget
    implements PreferredSizeWidget {
  const CommonAppBarWidget({super.key, required this.title, this.actions});

  final Widget title;
  final List<Widget>? actions;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppBar(
      title: title,
      actions: [
        IconButton(
          onPressed: () {
            RouterUtil.go(context: context, routeEnum: RouterEnum.navigation);
          },
          icon: IconEnum.home.outline,
        ),
        if (!GlobalUtil.isEmpty(actions)) ...actions!,
      ],
    );
  }
}

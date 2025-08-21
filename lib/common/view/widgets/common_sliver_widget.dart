import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CommonSliverWidget extends HookConsumerWidget {
  const CommonSliverWidget({
    super.key,

    required this.slivers,
    this.sliverAppbar,
    this.controller,
    this.physics,
    this.reverse = false,
  });

  final List<Widget> slivers;
  final SliverAppBar? sliverAppbar;
  final ScrollController? controller;
  final ScrollPhysics? physics;
  final bool reverse;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomScrollView(
      controller: controller,
      reverse: reverse,
      physics: physics,
      slivers: [if (sliverAppbar != null) sliverAppbar!, ...slivers],
    );
  }
}

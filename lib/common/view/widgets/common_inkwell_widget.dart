import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:travel_tts/utils/size_util.dart';

class CommonInkwellWidget extends HookConsumerWidget {
  const CommonInkwellWidget({
    super.key,
    required this.tooltip,
    required this.child,
    this.onTap,
    this.onDoubleTap,
    this.onLongPress,
    this.onLongPressUp,
    this.borderRadius,
    this.radius,
    this.isCanTab = true,
  });

  final Function()? onTap;
  final Function()? onDoubleTap;
  final Function()? onLongPress;
  final Function()? onLongPressUp;
  final String tooltip;
  final Widget child;
  final bool isCanTab;
  final BorderRadius? borderRadius;
  final double? radius;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Tooltip(
      message: tooltip,
      child: InkWell(
        borderRadius: borderRadius ?? SizeUtil.basicRadius(),
        radius: radius,
        onTap: () async {
          await onTap?.call();
          FocusScope.of(context).unfocus();
        },
        onDoubleTap: onDoubleTap,
        onLongPress: onLongPress,
        child: child,
      ),
    );
  }
}

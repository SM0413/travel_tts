import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:travel_tts/utils/global_util.dart';

class CommonGestureWidget extends HookConsumerWidget {
  const CommonGestureWidget({
    super.key,
    required this.child,
    this.eventName,
    this.onTap,
    this.onDoubleTap,
    this.onLongPress,
    this.onLongPressDown,
    this.onLongPressUp,
    this.onLongPressStart,
    this.onVerticalDragEnd,
    this.onVerticalDragUpdate,
    this.isCanTab = true,
  });

  final Function()? onTap;
  final Function()? onDoubleTap;
  final Function()? onLongPress;
  final Function()? onLongPressUp;
  final Function(LongPressStartDetails details)? onLongPressStart;
  final Function(LongPressDownDetails details)? onLongPressDown;
  final Function(DragEndDetails details)? onVerticalDragEnd;
  final Function(DragUpdateDetails)? onVerticalDragUpdate;
  final Widget child;
  final bool isCanTab;
  final String? eventName;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onVerticalDragUpdate: onVerticalDragUpdate,
      onVerticalDragEnd: onVerticalDragEnd,
      behavior: isCanTab
          ? HitTestBehavior.opaque
          : HitTestBehavior.translucent, //  자식중에 selectable이 있어도 잘 작동하도록 하는 속성
      onTap: () async {
        await onTap?.call();
        if (!GlobalUtil.isEmpty(eventName)) {}
        if (!context.mounted) return;
        FocusScope.of(context).unfocus();
      },
      onDoubleTap: onDoubleTap,
      onLongPress: onLongPress,
      onLongPressDown: onLongPressDown,
      onLongPressUp: onLongPressUp,
      onLongPressStart: onLongPressStart,
      child: child,
    );
  }
}

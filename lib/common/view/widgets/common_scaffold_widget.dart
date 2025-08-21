import 'package:flutter/material.dart';
import 'package:travel_tts/common/view/widgets/common_gesture_widget.dart';

class CommonScaffoldWidget extends StatelessWidget {
  const CommonScaffoldWidget({
    super.key,
    required this.body,
    this.appBar,
    this.bottomNavigationBar,
    this.floatingActionButton,
  });

  final AppBar? appBar;
  final Widget body;
  final Widget? bottomNavigationBar;
  final Widget? floatingActionButton;

  @override
  Widget build(BuildContext context) {
    return CommonGestureWidget(
      child: Scaffold(
        appBar: appBar,
        body: body,
        bottomNavigationBar: bottomNavigationBar,
        floatingActionButton: floatingActionButton,
      ),
    );
  }
}

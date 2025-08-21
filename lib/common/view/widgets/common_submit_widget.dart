import 'package:flutter/widgets.dart';
import 'package:travel_tts/common/view/widgets/common_inkwell_widget.dart';
import 'package:travel_tts/common/view/widgets/common_text_widget.dart';
import 'package:travel_tts/utils/color_util.dart';
import 'package:travel_tts/utils/size_util.dart';

class CommonSubmitWidget extends StatelessWidget {
  const CommonSubmitWidget({
    super.key,
    required this.tooltip,
    required this.text,
    required this.bgColor,
    required this.onTap,
    this.height = 50,
  });

  final String tooltip;
  final String text;
  final Color bgColor;
  final Function() onTap;
  final double height;

  @override
  Widget build(BuildContext context) {
    return CommonInkwellWidget(
      tooltip: tooltip,
      onTap: onTap,
      child: AnimatedContainer(
        width: SizeUtil.getW(100),
        height: height,
        duration: const Duration(milliseconds: 300),
        decoration: BoxDecoration(color: bgColor),
        child: Center(
          child: CommonTextWidget(
            text,
            isBold: true,
            fontSize: SizeUtil.mediumFontSize,
            fontColor: ColorUtil.white,
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:travel_tts/common/view/widgets/common_text_widget.dart';
import 'package:travel_tts/enums/icon_enum.dart';
import 'package:travel_tts/utils/size_util.dart';

class CommonNoDataWidget extends StatelessWidget {
  const CommonNoDataWidget({super.key, this.subTitle, this.child});

  final String? subTitle;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16), // 둥근 모서리
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconEnum.noData.withRoundedColor(
            size: 60,
            color: Colors.grey.shade400,
          ),
          SizeUtil.basicHPadding(),
          CommonTextWidget(
            "데이터가 없어요",
            style: TextStyle(
              fontSize: SizeUtil.mediumFontSize,
              fontWeight: FontWeight.bold,
              color: Colors.grey.shade600, // 텍스트 색상
            ),
          ),
          const SizedBox(height: 10),
          if (subTitle != null)
            CommonTextWidget(
              subTitle!,
              style: TextStyle(
                fontSize: SizeUtil.smallFontSize,
                color: Colors.grey.shade500,
              ),
              textAlign: TextAlign.center,
            ),
          const SizedBox(height: 10),
          if (child != null) child!,
        ],
      ),
    );
  }
}

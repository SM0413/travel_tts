import 'package:flutter/material.dart';
import 'package:travel_tts/common/view/widgets/common_text_widget.dart';
import 'package:travel_tts/enums/icon_enum.dart';
import 'package:travel_tts/enums/router_enum.dart';
import 'package:travel_tts/utils/global_util.dart';
import 'package:travel_tts/utils/router_util.dart';
import 'package:travel_tts/utils/size_util.dart';

class CommonErrorWidget extends StatelessWidget {
  const CommonErrorWidget({
    super.key,
    this.subTitle,
    this.title,
    this.isGoMain = true,
  });

  final String? subTitle;
  final String? title;
  final bool isGoMain;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconEnum.error.rounded,
          const SizedBox(height: 16.0), // 간격 추가
          CommonTextWidget(
            title ?? "문제가 발생했어요!",
            fontSize: SizeUtil.mediumFontSize,
            isBold: true,
            fontColor: Colors.black87,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8.0),
          if (!GlobalUtil.isEmpty(subTitle))
            CommonTextWidget(
              subTitle!,
              style: TextStyle(
                fontSize: SizeUtil.smallFontSize,
                color: Colors.grey[600],
              ),
              textAlign: TextAlign.center,
            ),
          if (isGoMain)
            TextButton(
              onPressed: () {
                RouterUtil.go(context: context, routeEnum: RouterEnum.home);
              },
              child: const CommonTextWidget("메인으로 돌아가기"),
            ),
        ],
      ),
    );
  }
}

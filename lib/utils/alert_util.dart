import 'package:flutter/material.dart';
import 'package:travel_tts/common/view/widgets/common_text_widget.dart';
import 'package:travel_tts/utils/global_util.dart';
import 'package:travel_tts/utils/router_util.dart';
import 'package:travel_tts/utils/size_util.dart';
import 'package:travel_tts/utils/string_util.dart';

abstract class AlertUtil {
  static Future<bool> show({
    required BuildContext context,
    String? title,
    String? content,
    required Function confirmFn,
    String cancelText = '취소',
    String confirmText = '확인',
    Color cancelColor = Colors.red,
    Color? confirmColor,
  }) async {
    return await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: CommonTextWidget(
              title ?? "확인해주세요!",
              style: const TextStyle(fontSize: SizeUtil.mediumFontSize),
              maxLines: 3,
            ),
            content: GlobalUtil.isEmpty(content)
                ? null
                : CommonTextWidget(content!, isCanSelect: true),
            actions: [
              TextButton(
                onPressed: () =>
                    Navigator.of(context).pop(false), // 취소 시 다이얼로그 닫기
                child: CommonTextWidget(cancelText, fontColor: cancelColor),
              ),
              TextButton(
                onPressed: () async {
                  await confirmFn(); // 확인 콜백 실행
                  Navigator.of(context).pop(true);
                },
                child: CommonTextWidget(confirmText, fontColor: confirmColor),
              ),
            ],
          ),
        ) ??
        false;
  }

  static void showCopyAlert(BuildContext context, {required String copyValue}) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("텍스트 복사"),
          content: SingleChildScrollView(
            child: CommonTextWidget(copyValue, isCanSelect: true),
          ),
          actions: [
            TextButton(
              onPressed: () async {
                await StringUtil.copy(value: copyValue);
              },
              child: const Text("전체 복사"),
            ),
            TextButton(
              onPressed: () {
                RouterUtil.pop(context);
              },
              child: const Text("닫기"),
            ),
          ],
        );
      },
    );
  }
}

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:travel_tts/enums/icon_enum.dart';
import 'package:travel_tts/utils/color_util.dart';
import 'package:travel_tts/utils/size_util.dart';

abstract class ToastUtil {
  static void show({
    required String title,
    int duration = 3000,
    String? subTitle,
    Color bgColor = Colors.white,
    Color textColor = Colors.black,
    Function()? onTapFn,
    bool isHideButton = true,
    bool onlyOne = true,
  }) {
    BotToast.showSimpleNotification(
      onlyOne: onlyOne,
      title: title,
      subTitle: subTitle,
      backgroundColor: bgColor,
      titleStyle: TextStyle(
        fontSize: SizeUtil.mediumFontSize,
        color: bgColor == Colors.white
            ? textColor
            : textColor != Colors.black
            ? textColor
            : Colors.white,
        fontWeight: FontWeight.bold,
      ),
      subTitleStyle: TextStyle(
        fontSize: SizeUtil.smallFontSize,
        color: bgColor == Colors.white
            ? textColor
            : textColor != Colors.black
            ? textColor
            : Colors.white,
      ),
      duration: Duration(milliseconds: duration),
      onTap: () async {
        await onTapFn?.call();
      },
      onClose: () {},
      closeIcon: IconEnum.close.withRoundedColor(color: Colors.white),
      hideCloseButton: isHideButton,
    ); // popup a notification toast;
  }

  static Future<void> loading(Function() fn) async {
    BotToast.showLoading();
    await fn();
    BotToast.closeAllLoading();
  }

  static void close() {
    BotToast.cleanAll();
  }

  static void closeLoading() {
    BotToast.closeAllLoading();
  }

  static void pleaseLoginFirst({
    BuildContext? context,
    String? title,
    String? subTitle,
  }) {
    show(
      title: title ?? "로그인을 먼저 해주세요",
      subTitle: context != null ? "여기를 눌러 로그인 해주세요" : subTitle,
      bgColor: ColorUtil.warning,
      onTapFn: () {
        if (context != null) {
          // RouterUtil.go(context: context, routeEnum: RouterEnum.loginMain);
        }
        close();
      },
    );
  }
}

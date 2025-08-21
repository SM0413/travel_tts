import 'package:flutter/material.dart';

abstract class ColorUtil {
  // Define color constants
  static const Color primary = Colors.blue;
  static const Color warning = Colors.orange;
  static const Color error = Colors.red;
  static const Color success = Colors.green;
  static const Color info = Colors.blue;
  static const Color white = Colors.white;
  static const Color black = Colors.black;
  static const Color unSelected = Colors.grey;
  static const Color favorite = Colors.red;
  // platform colors
  static const Color kakao = Colors.orangeAccent; //Color(0xFFFFEB03);
  static const Color naver = Color(0xFF02C75A);

  // Define color from string(a|r|g|b)
  static String getColorToStr(Color color) {
    return "${color.a}|${color.r}|${color.g}|${color.b}";
  }

  /// [opacity] > 0 : 0%, 50 : 50%, 100 : 100%
  static Color withOpacity({required Color color, required int opacity}) {
    final int alpha = (opacity / 100.0 * 255).round();
    return color.withAlpha(alpha);
  }
}

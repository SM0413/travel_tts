import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

abstract class SizeUtil {
  static double getH(double value) {
    return value.h;
  }

  static double getW(double value) {
    return value.w;
  }

  static SizedBox bottomPadding() {
    return SizedBox(height: 10.h);
  }

  static SizedBox basicHPadding({double height = 20}) {
    return SizedBox(height: height);
  }

  static SizedBox basicWPadding({double width = 10}) {
    return SizedBox(width: width);
  }

  static BorderRadius basicRadius() {
    return BorderRadius.circular(basicRadiusCircular);
  }

  static double contentH() {
    return 70.h;
  }

  static double keyboardPadding(BuildContext context) {
    final bottom = MediaQuery.of(context).viewInsets.bottom;
    if (bottom == 0) return 20;
    return bottom;
  }

  static const double basicRadiusCircular = 10;
  static const int maxInputLine = 15;
  static const int maxContentLength = 500;
  static const double largeFontSize = 23;
  static const double mediumFontSize = 18;
  static const double smallFontSize = 15;
  static const double superSmallFontSize = 12;
}

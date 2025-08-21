import 'package:flutter/material.dart';

abstract class TextUtil {
  static TextTheme textTheme(BuildContext context) {
    return Theme.of(context).textTheme;
  }
}

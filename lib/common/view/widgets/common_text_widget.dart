import 'package:flutter/material.dart';

class CommonTextWidget extends StatelessWidget {
  const CommonTextWidget(
    this.text, {
    super.key,
    this.style,
    this.maxLines,
    this.isCanSelect = false,
    this.textAlign,
    this.fontSize,
    this.isBold = false,
    this.fontColor,
    this.textOverflow = TextOverflow.ellipsis,
  });
  final String text;
  final TextStyle? style;
  final int? maxLines;
  final double? fontSize;
  final TextAlign? textAlign;
  final bool isCanSelect;
  final TextOverflow textOverflow;
  final bool isBold;
  final Color? fontColor;
  @override
  Widget build(BuildContext context) {
    final effectiveStyle =
        style?.copyWith(
          fontSize: fontSize,
          fontWeight: isBold ? FontWeight.bold : null,
          overflow: textOverflow,
          color: fontColor,
        ) ??
        TextStyle(
          fontSize: fontSize,
          fontWeight: isBold ? FontWeight.bold : null,
          overflow: textOverflow,
          color: fontColor,
        );

    if (isCanSelect) {
      return SelectableText(
        text,
        style: effectiveStyle,
        maxLines: maxLines,
        textAlign: textAlign,
        contextMenuBuilder: (BuildContext context, EditableTextState editable) {
          return AdaptiveTextSelectionToolbar.buttonItems(
            anchors: editable.contextMenuAnchors,
            buttonItems: editable.contextMenuButtonItems,
          );
        },
      );
    }

    return Text(
      text,
      style: effectiveStyle,
      maxLines: maxLines,
      textAlign: textAlign,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:travel_tts/utils/color_util.dart';

enum IconEnum {
  noData(Icon(Icons.inbox_outlined), Icon(Icons.inbox_rounded)),
  leftArrow(Icon(Icons.arrow_back_ios), Icon(Icons.arrow_back_ios)),
  rightArrow(Icon(Icons.arrow_forward_ios), Icon(Icons.arrow_forward_ios)),
  favorite(
    Icon(Icons.favorite_outline, color: ColorUtil.favorite),
    Icon(Icons.favorite_rounded, color: ColorUtil.favorite),
  ),
  close(Icon(Icons.close_outlined), Icon(Icons.close_rounded)),
  copy(Icon(Icons.copy_all_outlined), Icon(Icons.copy_all_rounded)),
  delete(
    Icon(Icons.delete_forever_outlined, color: ColorUtil.error),
    Icon(Icons.delete_forever_rounded, color: ColorUtil.error),
  ),
  error(
    Icon(Icons.error_outline_outlined, color: ColorUtil.error),
    Icon(Icons.error_outlined, color: ColorUtil.error),
  ),
  location(Icon(Icons.location_on_outlined), Icon(Icons.location_on_rounded)),
  time(Icon(Icons.access_time_outlined), Icon(Icons.access_time_rounded)),
  dalor(Icon(Icons.attach_money_outlined), Icon(Icons.attach_money_rounded));

  final Icon outline;
  final Icon rounded;
  const IconEnum(this.outline, this.rounded);

  Icon withOutlineColor({required Color? color, double? size}) {
    return Icon(outline.icon, size: size, color: color);
  }

  Icon withRoundedColor({required Color? color, double? size}) {
    return Icon(rounded.icon, size: size, color: color);
  }

  Icon withRoundedSize({required double? size}) {
    return Icon(rounded.icon, size: size);
  }

  Icon withOutlineSize({required double? size}) {
    return Icon(rounded.icon, size: size);
  }
}

import 'package:flutter/material.dart';
import 'package:travel_tts/utils/color_util.dart';

enum IconEnum {
  person(Icon(Icons.person), Icon(Icons.person_rounded)),
  home(Icon(Icons.home_outlined), Icon(Icons.home_rounded)),
  setting(Icon(Icons.settings_outlined), Icon(Icons.settings_rounded)),
  download(Icon(Icons.download_outlined), Icon(Icons.download_rounded)),
  search(Icon(Icons.search_outlined), Icon(Icons.search_rounded)),
  noData(Icon(Icons.inbox_outlined), Icon(Icons.inbox_rounded)),
  text(Icon(Icons.text_snippet_outlined), Icon(Icons.text_snippet_rounded)),
  trans(Icon(Icons.translate_outlined), Icon(Icons.translate_rounded)),
  play(Icon(Icons.play_arrow_outlined), Icon(Icons.play_arrow_rounded)),
  pause(Icon(Icons.pause_outlined), Icon(Icons.pause_rounded)),
  stop(Icon(Icons.stop_outlined), Icon(Icons.stop_rounded)),
  share(Icon(Icons.cloud_upload_outlined), Icon(Icons.cloud_upload_rounded)),
  notShare(Icon(Icons.cloud_off_outlined), Icon(Icons.cloud_off_rounded)),
  checkCircle(
    Icon(Icons.check_circle_outline),
    Icon(Icons.check_circle_rounded),
  ),
  speak(
    Icon(Icons.record_voice_over_outlined),
    Icon(Icons.record_voice_over_rounded),
  ),
  speakStop(
    Icon(Icons.voice_over_off_outlined),
    Icon(Icons.voice_over_off_rounded),
  ),
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

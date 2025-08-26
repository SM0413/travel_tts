import 'package:flutter/cupertino.dart';
import 'package:travel_tts/enums/icon_enum.dart';
import 'package:travel_tts/main/view/main_page.dart';
import 'package:travel_tts/my/view/my_main_page.dart';

enum NavigationEnum {
  main("메인", MainPage(), IconEnum.home),
  my("마이페이지", MyMainPage(), IconEnum.person);
  // download("다운로드", DownloadMainPage(), IconEnum.download),
  // settings("설정", SettingsMainPage(), IconEnum.setting);

  final String ko;
  final Widget page;
  final IconEnum icon;
  const NavigationEnum(this.ko, this.page, this.icon);
}

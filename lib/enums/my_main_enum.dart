import 'package:flutter/widgets.dart';
import 'package:travel_tts/download/view/download_main_page.dart';
import 'package:travel_tts/enums/icon_enum.dart';
import 'package:travel_tts/my/view/my_texts_list_main_page.dart';
import 'package:travel_tts/my/view/setting/my_setting_main_page.dart';

enum MyMainEnum {
  myTexts("번역", "수정/삭제를 해보세요", IconEnum.trans, MyTextsListMainPage()),
  download("다운로드", "언어팩을 미리 다운로드 받아보세요", IconEnum.download, DownloadMainPage()),
  settings("설정", "앱 설정을 정할 수 있어요", IconEnum.setting, MySettingMainPage());

  final String title;
  final String subTitle;
  final IconEnum icon;
  final Widget? page;

  const MyMainEnum(this.title, this.subTitle, this.icon, this.page);
}

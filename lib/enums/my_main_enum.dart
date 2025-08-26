import 'package:travel_tts/enums/icon_enum.dart';
import 'package:travel_tts/enums/router_enum.dart';

enum MyMainEnum {
  myTexts("번역", "수정/삭제를 해보세요", IconEnum.trans, RouterEnum.myTexts),
  download(
    "다운로드",
    "언어팩을 미리 다운로드 받아보세요",
    IconEnum.download,
    RouterEnum.myDownload,
  ),
  settings("설정", "앱 설정을 정할 수 있어요", IconEnum.setting, RouterEnum.mySetting);

  final String title;
  final String subTitle;
  final IconEnum icon;
  final RouterEnum page;

  const MyMainEnum(this.title, this.subTitle, this.icon, this.page);
}

import 'package:google_mlkit_translation/google_mlkit_translation.dart';

enum TransEnum {
  ///영어
  english("영어", TranslateLanguage.english, "en-US"),

  ///한국어
  korean("한국어", TranslateLanguage.korean, "ko-KR"),

  ///중국어 (간체)
  chinese("중국어", TranslateLanguage.chinese, "zh-CN"),

  ///일본어
  japanese("일본어", TranslateLanguage.japanese, "ja-JP"),

  ///스페인어
  spanish("스페인어", TranslateLanguage.spanish, "es-ES"),

  ///프랑스어
  french("프랑스어", TranslateLanguage.french, "fr-FR"),

  ///독일어
  german("독일어", TranslateLanguage.german, "de-DE"),

  ///이탈리아어
  italian("이탈리아어", TranslateLanguage.italian, "it-IT"),

  ///포르투갈어 (브라질 기준)
  portuguese("포르투갈어", TranslateLanguage.portuguese, "pt-BR"),

  ///러시아어
  russian("러시아어", TranslateLanguage.russian, "ru-RU"),

  ///아랍어
  arabic("아랍어", TranslateLanguage.arabic, "ar-SA"),

  ///힌디어
  hindi("힌디어", TranslateLanguage.hindi, "hi-IN"),

  ///인도네시아어
  indonesian("인도네시아어", TranslateLanguage.indonesian, "id-ID"),

  ///태국어
  thai("태국어", TranslateLanguage.thai, "th-TH"),

  ///베트남어
  vietnamese("베트남어", TranslateLanguage.vietnamese, "vi-VN"),

  ///말레이어
  malay("말레이어", TranslateLanguage.malay, "ms-MY"),

  ///터키어
  turkish("터키어", TranslateLanguage.turkish, "tr-TR"),

  ///스웨덴어 (유럽권 예비용)
  swedish("스웨덴어", TranslateLanguage.swedish, "sv-SE");

  final String ko;
  final TranslateLanguage type;
  final String lang;

  const TransEnum(this.ko, this.type, this.lang);
}

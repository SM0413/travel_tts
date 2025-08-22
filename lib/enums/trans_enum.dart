import 'package:google_mlkit_translation/google_mlkit_translation.dart';

enum TransEnum {
  ///갈리시아어
  galician("갈리시아어", TranslateLanguage.galician, "gl-ES"),

  ///구자라트어
  gujarati("구자라트어", TranslateLanguage.gujarati, "gu-IN"),

  ///그리스어
  greek("그리스어", TranslateLanguage.greek, "el-GR"),

  ///네덜란드어
  dutch("네덜란드어", TranslateLanguage.dutch, "nl-NL"),

  ///노르웨이어
  norwegian("노르웨이어", TranslateLanguage.norwegian, "no-NO"),

  ///덴마크어
  danish("덴마크어", TranslateLanguage.danish, "da-DK"),

  ///독일어
  german("독일어", TranslateLanguage.german, "de-DE"),

  ///라트비아어
  latvian("라트비아어", TranslateLanguage.latvian, "lv-LV"),

  ///러시아어
  russian("러시아어", TranslateLanguage.russian, "ru-RU"),

  ///루마니아어
  romanian("루마니아어", TranslateLanguage.romanian, "ro-RO"),

  ///리투아니아어
  lithuanian("리투아니아어", TranslateLanguage.lithuanian, "lt-LT"),

  ///마라티어
  marathi("마라티어", TranslateLanguage.marathi, "mr-IN"),

  ///마케도니아어
  macedonian("마케도니아어", TranslateLanguage.macedonian, "mk-MK"),

  ///말레이어
  malay("말레이어", TranslateLanguage.malay, "ms-MY"),

  ///몰타어
  maltese("몰타어", TranslateLanguage.maltese, "mt-MT"),

  ///베트남어
  vietnamese("베트남어", TranslateLanguage.vietnamese, "vi-VN"),

  ///벨라루스어
  belarusian("벨라루스어", TranslateLanguage.belarusian, "be-BY"),

  ///벵골어
  bengali("벵골어", TranslateLanguage.bengali, "bn-BD"),

  ///불가리아어
  bulgarian("불가리아어", TranslateLanguage.bulgarian, "bg-BG"),

  ///스와힐리어
  swahili("스와힐리어", TranslateLanguage.swahili, "sw-KE"),

  ///스웨덴어
  swedish("스웨덴어", TranslateLanguage.swedish, "sv-SE"),

  ///스페인어
  spanish("스페인어", TranslateLanguage.spanish, "es-ES"),

  ///슬로바키아어
  slovak("슬로바키아어", TranslateLanguage.slovak, "sk-SK"),

  ///슬로베니아어
  slovenian("슬로베니아어", TranslateLanguage.slovenian, "sl-SI"),

  ///아랍어
  arabic("아랍어", TranslateLanguage.arabic, "ar-SA"),

  ///아이슬란드어
  icelandic("아이슬란드어", TranslateLanguage.icelandic, "is-IS"),

  ///아이티어
  haitian("아이티어", TranslateLanguage.haitian, "ht-HT"),

  ///아일랜드어
  irish("아일랜드어", TranslateLanguage.irish, "ga-IE"),

  ///아프리칸스어
  afrikaans("아프리칸스어", TranslateLanguage.afrikaans, "af-ZA"),

  ///알바니아어
  albanian("알바니아어", TranslateLanguage.albanian, "sq-AL"),

  ///에스토니아어
  estonian("에스토니아어", TranslateLanguage.estonian, "et-EE"),

  ///에스페란토어
  esperanto("에스페란토어", TranslateLanguage.esperanto, "eo"),

  ///영어
  english("영어", TranslateLanguage.english, "en-US"),

  ///우르두어
  urdu("우르두어", TranslateLanguage.urdu, "ur-PK"),

  ///우크라이나어
  ukrainian("우크라이나어", TranslateLanguage.ukrainian, "uk-UA"),

  ///웨일스어
  welsh("웨일스어", TranslateLanguage.welsh, "cy-GB"),

  ///이탈리아어
  italian("이탈리아어", TranslateLanguage.italian, "it-IT"),

  ///인도네시아어
  indonesian("인도네시아어", TranslateLanguage.indonesian, "id-ID"),

  ///일본어
  japanese("일본어", TranslateLanguage.japanese, "ja-JP"),

  ///조지아어
  georgian("조지아어", TranslateLanguage.georgian, "ka-GE"),

  ///중국어
  chinese("중국어", TranslateLanguage.chinese, "zh-CN"),

  ///체코어
  czech("체코어", TranslateLanguage.czech, "cs-CZ"),

  ///카탈루냐어
  catalan("카탈루냐어", TranslateLanguage.catalan, "ca-ES"),

  ///칸나다어
  kannada("칸나다어", TranslateLanguage.kannada, "kn-IN"),

  ///크로아티아어
  croatian("크로아티아어", TranslateLanguage.croatian, "hr-HR"),

  ///타갈로그어
  tagalog("타갈로그어", TranslateLanguage.tagalog, "tl-PH"),

  ///타밀어
  tamil("타밀어", TranslateLanguage.tamil, "ta-IN"),

  ///태국어
  thai("태국어", TranslateLanguage.thai, "th-TH"),

  ///터키어
  turkish("터키어", TranslateLanguage.turkish, "tr-TR"),

  ///텔루구어
  telugu("텔루구어", TranslateLanguage.telugu, "te-IN"),

  ///페르시아어
  persian("페르시아어", TranslateLanguage.persian, "fa-IR"),

  ///포르투갈어
  portuguese("포르투갈어", TranslateLanguage.portuguese, "pt-BR"),

  ///폴란드어
  polish("폴란드어", TranslateLanguage.polish, "pl-PL"),

  ///프랑스어
  french("프랑스어", TranslateLanguage.french, "fr-FR"),

  ///핀란드어
  finnish("핀란드어", TranslateLanguage.finnish, "fi-FI"),

  ///한국어
  korean("한국어", TranslateLanguage.korean, "ko-KR"),

  ///헝가리어
  hungarian("헝가리어", TranslateLanguage.hungarian, "hu-HU"),

  ///히브리어
  hebrew("히브리어", TranslateLanguage.hebrew, "he-IL"),

  ///힌디어
  hindi("힌디어", TranslateLanguage.hindi, "hi-IN");

  final String ko;
  final TranslateLanguage type;
  final String lang;

  const TransEnum(this.ko, this.type, this.lang);
}

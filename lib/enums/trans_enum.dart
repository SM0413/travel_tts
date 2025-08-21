import 'package:google_mlkit_translation/google_mlkit_translation.dart';

enum TransEnum {
  ///갈리시아어
  galician("갈리시아어", TranslateLanguage.galician),

  ///구자라트어
  gujarati("구자라트어", TranslateLanguage.gujarati),

  ///그리스어
  greek("그리스어", TranslateLanguage.greek),

  ///네덜란드어
  dutch("네덜란드어", TranslateLanguage.dutch),

  ///노르웨이어
  norwegian("노르웨이어", TranslateLanguage.norwegian),

  ///덴마크어
  danish("덴마크어", TranslateLanguage.danish),

  ///독일어
  german("독일어", TranslateLanguage.german),

  ///라트비아어
  latvian("라트비아어", TranslateLanguage.latvian),

  ///러시아어
  russian("러시아어", TranslateLanguage.russian),

  ///루마니아어
  romanian("루마니아어", TranslateLanguage.romanian),

  ///리투아니아어
  lithuanian("리투아니아어", TranslateLanguage.lithuanian),

  ///마라티어
  marathi("마라티어", TranslateLanguage.marathi),

  ///마케도니아어
  macedonian("마케도니아어", TranslateLanguage.macedonian),

  ///말레이어
  malay("말레이어", TranslateLanguage.malay),

  ///몰타어
  maltese("몰타어", TranslateLanguage.maltese),

  ///베트남어
  vietnamese("베트남어", TranslateLanguage.vietnamese),

  ///벨라루스어
  belarusian("벨라루스어", TranslateLanguage.belarusian),

  ///벵골어
  bengali("벵골어", TranslateLanguage.bengali),

  ///불가리아어
  bulgarian("불가리아어", TranslateLanguage.bulgarian),

  ///스와힐리어
  swahili("스와힐리어", TranslateLanguage.swahili),

  ///스웨덴어
  swedish("스웨덴어", TranslateLanguage.swedish),

  ///스페인어
  spanish("스페인어", TranslateLanguage.spanish),

  ///슬로바키아어
  slovak("슬로바키아어", TranslateLanguage.slovak),

  ///슬로베니아어
  slovenian("슬로베니아어", TranslateLanguage.slovenian),

  ///아랍어
  arabic("아랍어", TranslateLanguage.arabic),

  ///아이슬란드어
  icelandic("아이슬란드어", TranslateLanguage.icelandic),

  ///아이티어
  haitian("아이티어", TranslateLanguage.haitian),

  ///아일랜드어
  irish("아일랜드어", TranslateLanguage.irish),

  ///아프리칸스어
  afrikaans("아프리칸스어", TranslateLanguage.afrikaans),

  ///알바니아어
  albanian("알바니아어", TranslateLanguage.albanian),

  ///에스토니아어
  estonian("에스토니아어", TranslateLanguage.estonian),

  ///에스페란토어
  esperanto("에스페란토어", TranslateLanguage.esperanto),

  ///영어
  english("영어", TranslateLanguage.english),

  ///우르두어
  urdu("우르두어", TranslateLanguage.urdu),

  ///우크라이나어
  ukrainian("우크라이나어", TranslateLanguage.ukrainian),

  ///웨일스어
  welsh("웨일스어", TranslateLanguage.welsh),

  ///이탈리아어
  italian("이탈리아어", TranslateLanguage.italian),

  ///인도네시아어
  indonesian("인도네시아어", TranslateLanguage.indonesian),

  ///일본어
  japanese("일본어", TranslateLanguage.japanese),

  ///조지아어
  georgian("조지아어", TranslateLanguage.georgian),

  ///중국어
  chinese("중국어", TranslateLanguage.chinese),

  ///체코어
  czech("체코어", TranslateLanguage.czech),

  ///카탈루냐어
  catalan("카탈루냐어", TranslateLanguage.catalan),

  ///칸나다어
  kannada("칸나다어", TranslateLanguage.kannada),

  ///크로아티아어
  croatian("크로아티아어", TranslateLanguage.croatian),

  ///타갈로그어
  tagalog("타갈로그어", TranslateLanguage.tagalog),

  ///타밀어
  tamil("타밀어", TranslateLanguage.tamil),

  ///태국어
  thai("태국어", TranslateLanguage.thai),

  ///터키어
  turkish("터키어", TranslateLanguage.turkish),

  ///텔루구어
  telugu("텔루구어", TranslateLanguage.telugu),

  ///페르시아어
  persian("페르시아어", TranslateLanguage.persian),

  ///포르투갈어
  portuguese("포르투갈어", TranslateLanguage.portuguese),

  ///폴란드어
  polish("폴란드어", TranslateLanguage.polish),

  ///프랑스어
  french("프랑스어", TranslateLanguage.french),

  ///핀란드어
  finnish("핀란드어", TranslateLanguage.finnish),

  ///한국어
  korean("한국어", TranslateLanguage.korean),

  ///헝가리어
  hungarian("헝가리어", TranslateLanguage.hungarian),

  ///히브리어
  hebrew("히브리어", TranslateLanguage.hebrew),

  ///힌디어
  hindi("힌디어", TranslateLanguage.hindi);

  final String ko;
  final TranslateLanguage type;

  const TransEnum(this.ko, this.type);
}

enum LocalDbEnum {
  texts(false),
  downloadedLangPack(false),
  favoriteList(false),
  uid(false),
  errorList(false),
  defaultPitchSpeed(true),
  defaultTargetLocale(true),
  isDefaultShareWhenUpload(true);

  final bool isPersonalSetting;

  const LocalDbEnum(this.isPersonalSetting);
}

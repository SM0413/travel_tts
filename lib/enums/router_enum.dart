enum RouterEnum {
  init('/init'),
  navigation('/'),
  myTexts('/my/texts'),
  mySetting('/my/setting'),
  myDownload('/my/download'),
  uploadTexts('/upload/texts'),
  editTexts('/edit/texts'),
  detailTexts('/detail/texts');

  final String path;
  const RouterEnum(this.path);
}

enum RouterEnum {
  init('/init'),
  navigation('/'),
  uploadTexts('/upload/texts'),
  detailTexts('/detail/texts');

  final String path;
  const RouterEnum(this.path);
}

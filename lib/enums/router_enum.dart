enum RouterEnum {
  init('/init'),
  navigation('/'),
  uploadTexts('/upload/texts');

  final String path;
  const RouterEnum(this.path);
}

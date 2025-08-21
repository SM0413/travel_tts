enum RouterEnum {
  home('/'),
  init('/init'),
  my('/my'),
  joinMain('/login'),
  loginMain('/login');

  final String path;
  const RouterEnum(this.path);
}

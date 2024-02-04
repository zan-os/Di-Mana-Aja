sealed class _RouteConfig {
  String get name;
  String get path;
}

enum RouteConfig implements _RouteConfig {
  home('home', '/home'),
  signin('signin', '/signin'),
  splash('/', '/'),
  course('course', '/course');

  const RouteConfig(this.name, this.path);

  @override
  final String name;

  @override
  final String path;
}

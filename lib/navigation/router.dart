import 'package:auto_route/auto_route.dart';
import 'package:decay/pages/home/home_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: [
    AutoRoute(
      initial: true,
      path: '/',
      name: 'HomeRoute',
      page: HomePage,
    ),
  ],
)
class $AppRouter {}

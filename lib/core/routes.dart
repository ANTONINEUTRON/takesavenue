import 'package:auto_route/auto_route.dart';
import 'package:takesavenue/core/routes.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: HomeRoute.page, initial: true),
    AutoRoute(page: ProfileRoute.page),
    AutoRoute(page: BantersRoute.page),
    AutoRoute(page: AddBanterRoute.page),
    AutoRoute(page: SettingsRoute.page),
    AutoRoute(page: ViewItemRoute.page),
  ];
}

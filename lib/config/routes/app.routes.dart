import 'package:auto_route/auto_route.dart';
import 'package:owl_hris/lib.dart';

import '../../features/settings/presentation/pages/notifications.page.dart';
import '../../features/settings/presentation/pages/password.page.dart';
import '../../features/profile/presentation/pages/personal.info.dart';
import '../../features/settings/presentation/pages/pin.page.dart';
import '../../features/settings/presentation/pages/setting.page.dart';
part 'app.routes.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        CustomRoute(page: LoginRoute.page, initial: true),
        CustomRoute(
          page: HomeRoute.page,
          transitionsBuilder: TransitionsBuilders.noTransition,
        ),
        CustomRoute(
          page: AbsentRoute.page,
          transitionsBuilder: TransitionsBuilders.noTransition,
        ),
        CustomRoute(
          page: ProfileRoute.page,
          transitionsBuilder: TransitionsBuilders.noTransition,
        ),
        CustomRoute(
          page: ClockInRoute.page,
          transitionsBuilder: TransitionsBuilders.noTransition,
        ),
        CustomRoute(
          page: AbsentHistoryRoute.page,
          transitionsBuilder: TransitionsBuilders.noTransition,
        ),
        CustomRoute(
          page: SettingRoute.page,
          transitionsBuilder: TransitionsBuilders.noTransition,
        ),
        CustomRoute(
          page: PINRoute.page,
          transitionsBuilder: TransitionsBuilders.noTransition,
        ),
        CustomRoute(
          page: NotificationRoute.page,
          transitionsBuilder: TransitionsBuilders.noTransition,
        ),
        CustomRoute(
          page: PasswordRoute.page,
          transitionsBuilder: TransitionsBuilders.noTransition,
        ),
        CustomRoute(
          page: MyPersonalInfoRoute.page,
          transitionsBuilder: TransitionsBuilders.noTransition,
        ),
      ];
}

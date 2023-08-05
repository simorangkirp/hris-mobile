import 'package:auto_route/auto_route.dart';

import '../../features/absen/presentation/pages/absent.screen.dart';
import '../../features/absen/presentation/pages/clock.in.dart';
import '../../features/auth/presentation/pages/auth.screen.dart';
import '../../features/home/presentation/pages/home.screen.dart';
import '../../features/profile/presentation/pages/profile.screen.dart';
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
      ];
}

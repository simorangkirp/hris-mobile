import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:owl_hris/lib.dart';

part 'app.routes.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        CustomRoute(
          page: SplashRoute.page,
          path: '/',
          initial: true,
        ),
        CustomRoute(
          page: LoginRoute.page,
          path: '/login',
        ),
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
          path: '/PIN',
          children: [
            CustomRoute(
              page: ForgotPINRoute.page,
              path: 'pin',
              transitionsBuilder: TransitionsBuilders.noTransition,
            ),
            CustomRoute(
              page: ForgotPINRoute.page,
              path: 'input-otp',
              transitionsBuilder: TransitionsBuilders.noTransition,
            ),
            CustomRoute(
              page: NewPINRoute.page,
              path: 'new-pin',
              transitionsBuilder: TransitionsBuilders.noTransition,
            ),
          ],
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
        CustomRoute(
          page: InboxRoute.page,
          transitionsBuilder: TransitionsBuilders.noTransition,
        ),
        CustomRoute(
          page: ApprovalRoute.page,
          path: '/approval/:type',
          transitionsBuilder: TransitionsBuilders.noTransition,
        ),
        CustomRoute(
          page: ApprovalDetailRoute.page,
          path: '/data/:id:txn',
          transitionsBuilder: TransitionsBuilders.noTransition,
        ),
        CustomRoute(
          page: SubmitAbsentRoute.page,
          path: '/absent-submissions/:params:period:inout',
          transitionsBuilder: TransitionsBuilders.noTransition,
        ),
        CustomRoute(
          page: PaidLeaveMainRoute.page,
          path: '/paid-leave',
          transitionsBuilder: TransitionsBuilders.noTransition,
        ),
        CustomRoute(
          page: AbsentCameraRoute.page,
          path: '/absent-camera/:params:period:inout',
          transitionsBuilder: TransitionsBuilders.noTransition,
        ),
      ];
}

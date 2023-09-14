// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app.routes.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    AbsentHistoryRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: const AbsentHistoryScreen()),
      );
    },
    AbsentRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AbsentScreen(),
      );
    },
    ApprovalDetailRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<ApprovalDetailRouteArgs>(
          orElse: () => ApprovalDetailRouteArgs(
                id: pathParams.optString('id'),
                txn: pathParams.optString('txn'),
                mode: pathParams.getString('mode'),
                type: pathParams.getString('type'),
              ));
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ApprovalDetailScreen(
          id: args.id,
          txn: args.txn,
          mode: args.mode,
          type: args.type,
          key: args.key,
        ),
      );
    },
    ApprovalRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<ApprovalRouteArgs>(
          orElse: () => ApprovalRouteArgs(type: pathParams.optString('type')));
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ApprovalScreen(
          type: args.type,
          key: args.key,
        ),
      );
    },
    ClockInRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: const ClockInScreen()),
      );
    },
    ForgotPINRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ForgotPINScreen(),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: const HomeScreen()),
      );
    },
    InboxRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const InboxScreen(),
      );
    },
    InputOTPRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const InputOTPScreen(),
      );
    },
    LoginRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: const LoginScreen()),
      );
    },
    MyPersonalInfoRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MyPersonalInfoScreen(),
      );
    },
    NewPINRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const NewPINScreen(),
      );
    },
    NotificationRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const NotificationScreen(),
      );
    },
    PINRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const PINScreen(),
      );
    },
    PasswordRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const PasswordScreen(),
      );
    },
    ProfileRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WrappedRoute(child: const ProfileScreen()),
      );
    },
    SettingRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SettingScreen(),
      );
    },
    SubmitAbsentRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SubmitAbsentScreen(),
      );
    },
    VerifyPINRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const VerifyPINScreen(),
      );
    },
  };
}

/// generated route for
/// [AbsentHistoryScreen]
class AbsentHistoryRoute extends PageRouteInfo<void> {
  const AbsentHistoryRoute({List<PageRouteInfo>? children})
      : super(
          AbsentHistoryRoute.name,
          initialChildren: children,
        );

  static const String name = 'AbsentHistoryRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [AbsentScreen]
class AbsentRoute extends PageRouteInfo<void> {
  const AbsentRoute({List<PageRouteInfo>? children})
      : super(
          AbsentRoute.name,
          initialChildren: children,
        );

  static const String name = 'AbsentRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ApprovalDetailScreen]
class ApprovalDetailRoute extends PageRouteInfo<ApprovalDetailRouteArgs> {
  ApprovalDetailRoute({
    String? id,
    String? txn,
    required String mode,
    required String type,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          ApprovalDetailRoute.name,
          args: ApprovalDetailRouteArgs(
            id: id,
            txn: txn,
            mode: mode,
            type: type,
            key: key,
          ),
          rawPathParams: {
            'id': id,
            'txn': txn,
            'mode': mode,
            'type': type,
          },
          initialChildren: children,
        );

  static const String name = 'ApprovalDetailRoute';

  static const PageInfo<ApprovalDetailRouteArgs> page =
      PageInfo<ApprovalDetailRouteArgs>(name);
}

class ApprovalDetailRouteArgs {
  const ApprovalDetailRouteArgs({
    this.id,
    this.txn,
    required this.mode,
    required this.type,
    this.key,
  });

  final String? id;

  final String? txn;

  final String mode;

  final String type;

  final Key? key;

  @override
  String toString() {
    return 'ApprovalDetailRouteArgs{id: $id, txn: $txn, mode: $mode, type: $type, key: $key}';
  }
}

/// generated route for
/// [ApprovalScreen]
class ApprovalRoute extends PageRouteInfo<ApprovalRouteArgs> {
  ApprovalRoute({
    String? type,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          ApprovalRoute.name,
          args: ApprovalRouteArgs(
            type: type,
            key: key,
          ),
          rawPathParams: {'type': type},
          initialChildren: children,
        );

  static const String name = 'ApprovalRoute';

  static const PageInfo<ApprovalRouteArgs> page =
      PageInfo<ApprovalRouteArgs>(name);
}

class ApprovalRouteArgs {
  const ApprovalRouteArgs({
    this.type,
    this.key,
  });

  final String? type;

  final Key? key;

  @override
  String toString() {
    return 'ApprovalRouteArgs{type: $type, key: $key}';
  }
}

/// generated route for
/// [ClockInScreen]
class ClockInRoute extends PageRouteInfo<void> {
  const ClockInRoute({List<PageRouteInfo>? children})
      : super(
          ClockInRoute.name,
          initialChildren: children,
        );

  static const String name = 'ClockInRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ForgotPINScreen]
class ForgotPINRoute extends PageRouteInfo<void> {
  const ForgotPINRoute({List<PageRouteInfo>? children})
      : super(
          ForgotPINRoute.name,
          initialChildren: children,
        );

  static const String name = 'ForgotPINRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [InboxScreen]
class InboxRoute extends PageRouteInfo<void> {
  const InboxRoute({List<PageRouteInfo>? children})
      : super(
          InboxRoute.name,
          initialChildren: children,
        );

  static const String name = 'InboxRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [InputOTPScreen]
class InputOTPRoute extends PageRouteInfo<void> {
  const InputOTPRoute({List<PageRouteInfo>? children})
      : super(
          InputOTPRoute.name,
          initialChildren: children,
        );

  static const String name = 'InputOTPRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LoginScreen]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute({List<PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MyPersonalInfoScreen]
class MyPersonalInfoRoute extends PageRouteInfo<void> {
  const MyPersonalInfoRoute({List<PageRouteInfo>? children})
      : super(
          MyPersonalInfoRoute.name,
          initialChildren: children,
        );

  static const String name = 'MyPersonalInfoRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [NewPINScreen]
class NewPINRoute extends PageRouteInfo<void> {
  const NewPINRoute({List<PageRouteInfo>? children})
      : super(
          NewPINRoute.name,
          initialChildren: children,
        );

  static const String name = 'NewPINRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [NotificationScreen]
class NotificationRoute extends PageRouteInfo<void> {
  const NotificationRoute({List<PageRouteInfo>? children})
      : super(
          NotificationRoute.name,
          initialChildren: children,
        );

  static const String name = 'NotificationRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [PINScreen]
class PINRoute extends PageRouteInfo<void> {
  const PINRoute({List<PageRouteInfo>? children})
      : super(
          PINRoute.name,
          initialChildren: children,
        );

  static const String name = 'PINRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [PasswordScreen]
class PasswordRoute extends PageRouteInfo<void> {
  const PasswordRoute({List<PageRouteInfo>? children})
      : super(
          PasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'PasswordRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ProfileScreen]
class ProfileRoute extends PageRouteInfo<void> {
  const ProfileRoute({List<PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SettingScreen]
class SettingRoute extends PageRouteInfo<void> {
  const SettingRoute({List<PageRouteInfo>? children})
      : super(
          SettingRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SubmitAbsentScreen]
class SubmitAbsentRoute extends PageRouteInfo<void> {
  const SubmitAbsentRoute({List<PageRouteInfo>? children})
      : super(
          SubmitAbsentRoute.name,
          initialChildren: children,
        );

  static const String name = 'SubmitAbsentRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [VerifyPINScreen]
class VerifyPINRoute extends PageRouteInfo<void> {
  const VerifyPINRoute({List<PageRouteInfo>? children})
      : super(
          VerifyPINRoute.name,
          initialChildren: children,
        );

  static const String name = 'VerifyPINRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

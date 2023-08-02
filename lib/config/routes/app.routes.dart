// private navigators
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/constants/constants.dart';
import '../../features/home/presentation/pages/home.screen.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorHomeKey =
    GlobalKey<NavigatorState>(debugLabel: 'shellHome');
final _shellNavigatorActKey =
    GlobalKey<NavigatorState>(debugLabel: 'shellActivity');
final _shellNavigatorNotifKey =
    GlobalKey<NavigatorState>(debugLabel: 'shellNotification');
final _shellNavigatorProfileKey =
    GlobalKey<NavigatorState>(debugLabel: 'shellProfile');

// the one and only GoRouter instance
final GoRouter router = GoRouter(
  errorBuilder: Routes.errorWidget,
  // navigatorKey: _rootNavigatorKey,
  // initialLocation: Routes.loginNamedPage,
  initialLocation: Routes.splashPage,
  routes: [
    GoRoute(
      path: "/",
      builder: (context, state) => const HomeScreen(),
    )
  ],
);

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: const Text("Error Screen"),
      ),
      body: const SafeArea(
        child: Expanded(
          child: Center(
            child: Text('Page Not Found'),
          ),
        ),
      ),
    );
  }
}

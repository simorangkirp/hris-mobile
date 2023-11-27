import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/foundation.dart'
    show TargetPlatform, defaultTargetPlatform;

import '../../../../lib.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void dispatchAuth() {
    BlocProvider.of<AuthBloc>(context).add(AuthCheckToken());
  }

  void dispatchDeviceInfo() {
    BlocProvider.of<AuthBloc>(context).add(AuthCheckDeviceInfo());
  }

  displayScfldMsg(BuildContext context, String msg) {
    return ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(failSnackBar(
        message: msg,
      ));
  }

  void redirectIntrScreen() {
    context.router.replaceAll([const IntroductionRoute()]);
  }

  void dispatchGetIntro() {
    BlocProvider.of<IntrodBloc>(context).add(IntrodGetIntroInfo());
  }

  Future<void> precacheImage(
      ImageProvider<Object> provider, BuildContext context,
      {Size? size, ImageErrorListener? onError}) async {}

  @override
  void didChangeDependencies() {
    precacheImage(const AssetImage('assets/image/owl.logo.png'), context);
    super.didChangeDependencies();
  }

  @override
  void initState() {
    super.initState();
    precacheImage(const AssetImage('assets/image/owl.logo.png'), context);
    // dispatchDeviceInfo();
    dispatchGetIntro();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return MultiBlocListener(
      listeners: [
        BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthDeviceChecked) {
              if (state.isNotPass!) {
                if (defaultTargetPlatform == TargetPlatform.android) {
                  // SystemNavigator.pop();
                  displayScfldMsg(context, "you're on a simulator device!");
                  // Future.delayed(const Duration(seconds: 2))
                  //     .then((value) => SystemNavigator.pop());
                  dispatchAuth();
                }
                if (defaultTargetPlatform == TargetPlatform.iOS) {
                  displayScfldMsg(context, "you're on a simulator device!");
                }
              } else {
                dispatchAuth();
              }
            }
            if (state is AuthTokenChecked) {
              if (state.token != null) {
                if (state.token!) {
                  Future.delayed(const Duration(milliseconds: 1200)).then(
                      (value) => context.router.replace(const HomeRoute()));
                } else {
                  if (state.authModel != null) {
                    Future.delayed(const Duration(milliseconds: 1200)).then(
                        (value) =>
                            context.router.replace(LoginRoute(param: 'bio')));
                  }
                }
                // Future.delayed(const Duration(milliseconds: 1200)).then((value) {
                //   if (state.token!) {
                //     context.router.replace(const HomeRoute());
                //   } else {
                //     context.router.replace(const LoginRoute());
                //   }
                // });
              }
            }
          },
        ),
        BlocListener<IntrodBloc, IntrodState>(
          listener: (context, state) {
            if (state is IntrodInfoLoaded) {
              if (!state.intro!) {
                redirectIntrScreen();
              }
              if (state.intro!) {
                BlocProvider.of<IntrodBloc>(context).add(IntrodRedirect());
              }
            }
            if (state is IntrodRedirected) {
              dispatchDeviceInfo();
            }
          },
        ),
      ],
      child: Scaffold(
        body: SafeArea(
          child: Container(
            height: 1.sh,
            width: 1.sw,
            color: theme.scaffoldBackgroundColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/image/owl.logo.png',
                      ),
                      fit: BoxFit.contain,
                    ),
                    shape: BoxShape.circle,
                  ),
                  width: 0.28.sh,
                  height: 0.28.sh,
                ),
                SizedBox(height: 24.h),
                Text(
                  'OWL ESS',
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

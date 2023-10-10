import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    dispatchAuth();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthTokenChecked) {
          if (state.token != null) {
            if (state.token!) {
              Future.delayed(const Duration(milliseconds: 1200))
                  .then((value) => context.router.replace(const HomeRoute()));
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
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          return Scaffold(
            body: SafeArea(
              child: Container(
                height: 1.sh,
                width: 1.sw,
                color: appBgWhite,
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
                        color: appBgBlack,
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

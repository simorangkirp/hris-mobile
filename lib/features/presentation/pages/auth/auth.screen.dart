import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:package_info_plus/package_info_plus.dart';
import '../../../../lib.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

@RoutePage()
class LoginScreen extends StatefulWidget implements AutoRouteWrapper {
  const LoginScreen({
    @PathParam('param') this.param,
    super.key,
  });
  final String? param;

  @override
  State<LoginScreen> createState() => _LoginScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<AuthBloc>(),
      child: this,
    );
  }
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController user = TextEditingController();
  TextEditingController pw = TextEditingController();
  String dt = '';
  String loc = '';
  String ver = '';
  String appBuild = '';
  bool isBio = false;
  AuthModel authmodel = AuthModel();

  getAppVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    ver = packageInfo.version;
    appBuild = packageInfo.buildNumber;
    setState(() {});
  }

  void dispatchLogin() {
    BlocProvider.of<AuthBloc>(context).add(SubmitLogin(LoginParams(
      unm: user.text,
      pw: pw.text,
    )));
  }

  //! Dispatch after successfully login
  void dispatchProfileDetail() {
    BlocProvider.of<AuthBloc>(context).add(AuthGetProfileDetail());
  }

  void dispatchGetIntro() {
    BlocProvider.of<AuthBloc>(context).add(AuthGetIntroInfo());
  }

  //! Dispatch after get profile details
  void dispatchActPeriod() {
    BlocProvider.of<AuthBloc>(context).add(AuthGetActPeriod(dt, loc));
  }

  void dispatchAuth() {
    BlocProvider.of<AuthBloc>(context).add(AuthCheckToken());
  }

  void dispatchLogout() {
    BlocProvider.of<AuthBloc>(context).add(OnLogOut());
  }

  void refreshData() {
    setState(() {});
  }

  FutureOr onGoBack() {
    refreshData();
  }

  Widget loadingAuth() {
    return Center(child: Lottie.asset('assets/lotties/animation_loading.json'));
  }

  Widget authSuccess() {
    return Center(child: Lottie.asset('assets/lotties/animation_success.json'));
  }

  void redirectScreen() {
    context.router.replaceAll([const HomeRoute()]);
  }

  void redirectIntrScreen() {
    context.router.replaceAll([const IntroductionRoute()]);
  }

  @override
  void initState() {
    super.initState();
    dispatchGetIntro();
    // dispatchGetCameras();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    Widget loginCard() {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(),
            Material(
              elevation: 2,
              borderRadius: BorderRadius.circular(8),
              child: Container(
                // color: Colors.red.withOpacity(0.4),
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 58.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Visibility(
                              visible: !isBio,
                              replacement: Text(
                                l10n.welcomeBack,
                                style: TextStyle(
                                  fontSize: 24.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              child: Text(
                                l10n.welcome,
                                style: TextStyle(
                                  fontSize: 24.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            SizedBox(height: 4.h),
                            Visibility(
                              visible: !isBio,
                              replacement: Text(
                                authmodel.unm ?? "-",
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                  color: appDivider.withOpacity(0.8),
                                ),
                              ),
                              child: Text(
                                l10n.login_to_acc_msg,
                                style: TextStyle(
                                  fontSize: 14.sp,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          width: 72.w,
                          height: 72.w,
                          child: Image.asset(
                            'assets/image/owl.logo.png',
                            fit: BoxFit.contain,
                          ),
                        )
                      ],
                    ),
                    Visibility(
                      visible: !isBio,
                      replacement: SizedBox(
                        height: 16.h,
                      ),
                      child: SizedBox(height: 24.h),
                    ),
                    Visibility(
                      visible: isBio,
                      child: InkWell(
                        onTap: () {
                          authmodel.unm = '';
                          authmodel.pw = '';
                          setState(() {
                            isBio = !isBio;
                          });
                          dispatchLogout();
                        },
                        child: Text(
                          l10n.chgAcc,
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: appBtnBlue,
                          ),
                        ),
                      ),
                    ),
                    Visibility(
                      visible: !isBio,
                      child: CustomFormTextField(
                        hint: 'username',
                        maxLine: 1,
                        maxLength: 24,
                        controller: user,
                      ),
                    ),
                    Visibility(visible: !isBio, child: SizedBox(height: 12.h)),
                    Visibility(
                      visible: !isBio,
                      child: CustomFormTextField(
                        hint: 'password',
                        obscureText: true,
                        maxLine: 1,
                        maxLength: 12,
                        controller: pw,
                      ),
                    ),
                    Visibility(visible: !isBio, child: SizedBox(height: 12.h)),
                    Visibility(
                      visible: false,
                      child: Text(
                        l10n.forgot_msg,
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    SizedBox(height: 48.h),
                    Visibility(
                      visible: !isBio,
                      child: GestureDetector(
                        onTap: () {
                          if (user.text.isEmpty || pw.text.isEmpty) {
                            ScaffoldMessenger.of(context)
                              ..hideCurrentSnackBar()
                              ..showSnackBar(failSnackBar(
                                message: user.text.isEmpty
                                    ? l10n.usern_mt_msg
                                    : l10n.pwd_mt_msg,
                              ));
                          } else {
                            dispatchLogin();
                          }
                        },
                        child: Material(
                          elevation: 4,
                          color: appBtnBlue,
                          borderRadius: BorderRadius.circular(12),
                          child: const ButtonConfirm(
                            text: 'Login',
                          ),
                        ),
                      ),
                    ),
                    Visibility(
                      visible: isBio,
                      child: GestureDetector(
                        onTap: () async {
                          final isAuth = await LocalAuthAPI.authenticate();
                          if (isAuth) {
                            user.text = authmodel.unm ?? "";
                            pw.text = authmodel.pw ?? "";
                            dispatchLogin();
                          }
                        },
                        child: Material(
                          elevation: 4,
                          color: appBtnBlue,
                          borderRadius: BorderRadius.circular(12),
                          child: const ButtonConfirm(
                            text: 'Login',
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 48.h),
                  ],
                ),
              ),
            ),
            Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      l10n.privacy_policy,
                      style: TextStyle(
                        color: appDisabledTextField,
                        fontSize: 12.sp,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: appDisabledTextField,
                      ),
                      height: 4,
                      width: 4,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      l10n.term_use,
                      style: TextStyle(
                        color: appDisabledTextField,
                        fontSize: 12.sp,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  l10n.about_owl_ess(ver, appBuild),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: appDisabledTextField,
                    fontSize: 12.sp,
                  ),
                ),
                SizedBox(height: 48.h),
              ],
            ),
          ],
        ),
      );
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthIntroInfoLoaded) {
              if (!state.intro!) {
                //! go to intro screen
                redirectIntrScreen();
              }
              if (state.intro!) {
                //! go to login screen
                getAppVersion();
                if (widget.param == 'bio') {
                  dispatchAuth();
                }
              }
            }
            if (state is AuthTokenChecked) {
              if (state.token == false &&
                  state.authModel?.unm != null &&
                  state.authModel?.pw != null) {
                isBio = true;
                authmodel = state.authModel!;
              } else {
                isBio = false;
              }
            }
            if (state is UserAuthGranted) {
              dispatchProfileDetail();
            }
            if (state is AuthDetailProfileLoaded) {
              if (state.profileModel?.lokasitugas != null) {
                loc = state.profileModel!.lokasitugas!;
              }
              dt = DateFormat('yyyy-MM-dd').format(DateTime.now()).toString();
              dispatchActPeriod();
            }
            if (state is AuthActPeriodLoaded) {
              Future.delayed(const Duration(seconds: 2))
                  .then((_) => redirectScreen());
            }
            if (state is AuthError) {
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(failSnackBar(
                  message: state.error!.messages!.error,
                ));
            }
            if (state is AuthStrMsg) {
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(failSnackBar(
                  message: state.msg,
                ));
            }
          },
          child: BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              if (state is AuthLoading) {
                return loadingAuth();
              } else if (state is AuthActPeriodLoaded) {
                return authSuccess();
              } else if (state is AuthError) {
                return loginCard();
              } else {
                return loginCard();
              }
            },
          ),
        ),
        // child: BlocConsumer<AuthBloc, AuthState>(
        //   builder: (context, state) {
        //     if (state is AuthLoading) {
        //       return loadingAuth();
        //     } else if (state is AuthActPeriodLoaded) {
        //       return authSuccess();
        //     } else if (state is AuthError) {
        //       return loginCard();
        //     } else {
        //       return loginCard();
        //     }
        //   },
        //   listener: (context, state) {
        //     if (state is UserAuthGranted) {
        //       dispatchProfileDetail();
        //     }
        //     if (state is AuthDetailProfileLoaded) {
        //       if (state.profileModel?.lokasitugas != null) {
        //         loc = state.profileModel!.lokasitugas!;
        //       }
        //       dt = DateFormat('yyyy-MM-dd').format(DateTime.now()).toString();
        //       dispatchActPeriod();
        //     }
        //     if (state is AuthActPeriodLoaded) {
        //       Future.delayed(const Duration(seconds: 2))
        //           .then((_) => redirectScreen());
        //     }
        //     if (state is AuthError) {
        //       ScaffoldMessenger.of(context)
        //         ..hideCurrentSnackBar()
        //         ..showSnackBar(failSnackBar(
        //           message: state.error!.messages!.error,
        //         ));
        //     }
        //     if (state is AuthStrMsg) {
        //       ScaffoldMessenger.of(context)
        //         ..hideCurrentSnackBar()
        //         ..showSnackBar(failSnackBar(
        //           message: state.msg,
        //         ));
        //     }
        //   },
        // ),
      ),
    );
  }
}

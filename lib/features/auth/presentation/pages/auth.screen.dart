import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:owl_hris/config/routes/app.routes.dart';
import 'package:owl_hris/features/auth/presentation/bloc/auth.bloc.dart';
import 'package:owl_hris/features/auth/presentation/bloc/auth.state.dart';

import '../../../../config/themes/colors.dart';
import '../../../../core/utils/common.widgets.dart';
import '../../domain/usecases/login.usecase.dart';
import '../bloc/auth.event.dart';

@RoutePage()
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    void dispatchLogin() {
      BlocProvider.of<AuthBloc>(context).add(SubmitLogin(const LoginParams(
        unm: 'patrick.owl',
        pw: '12345678',
      )));
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: MultiBlocListener(
        listeners: [
          BlocListener<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state is ProccessDone) {
                context.router.replace(const HomeRoute());
              }
            },
          ),
        ],
        child: SafeArea(
          child: Padding(
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
                                Text(
                                  'Welcome!',
                                  style: TextStyle(
                                    fontSize: 24.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                SizedBox(height: 4.h),
                                Text(
                                  'Login to your account',
                                  style: TextStyle(
                                    fontSize: 14.sp,
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
                        SizedBox(height: 24.h),
                        const CustomFormTextField(
                          hint: 'username',
                        ),
                        SizedBox(height: 12.h),
                        const CustomFormTextField(
                          hint: 'password',
                          obscureText: true,
                          maxLine: 1,
                        ),
                        SizedBox(height: 12.h),
                        Text(
                          'Forgot password?',
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(height: 48.h),
                        GestureDetector(
                          onTap: () {
                            dispatchLogin();
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
                          'Kebijakan privasi',
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
                          'Ketentuan penggunaan',
                          style: TextStyle(
                            color: appDisabledTextField,
                            fontSize: 12.sp,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Tentang HRIS OWL',
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
          ),
        ),
      ),
    );
  }
}

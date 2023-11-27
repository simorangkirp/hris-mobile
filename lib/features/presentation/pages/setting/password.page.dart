import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../lib.dart';

@RoutePage()
class PasswordScreen extends StatefulWidget {
  const PasswordScreen({super.key});

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  TextEditingController ctrl = TextEditingController();

  void dispatchGetOTP() {
    BlocProvider.of<PasswordBloc>(context).add(SettingReqOTP(ctrl.text));
  }

  bool? _visPass;

  @override
  void initState() {
    super.initState();
    _visPass = true;
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final ThemeData theme = Theme.of(context);
    // bool enbNewP = false;

    scfldMsg(String msg) {
      return ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(failSnackBar(
          message: msg,
        ));
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          l10n.chgPwd,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      body: BlocListener<PasswordBloc, PasswordState>(
        listener: (context, state) {
          if (state is PasswordError) {
            scfldMsg(state.msg ?? "Error");
          }
          if (state is PasswordOTPResponed) {
            context.router.push(InputOTPRoute(param: ctrl.text));
          }
        },
        child: BlocBuilder<PasswordBloc, PasswordState>(
          builder: (context, state) {
            if (state is OTPLoading) {
              return const Center(
                child: CircularProgressIndicator(
                  color: appBtnBlue,
                ),
              );
            } else {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 12.h),
                    Text(
                      l10n.resetPwd,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 18.sp,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      l10n.rst_pwd_msg,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12.sp,
                      ),
                    ),
                    SizedBox(height: 12.h),
                    Text(
                      l10n.pass,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    CustomFormTextField(
                      obscureText: _visPass,
                      suffix: IconButton(
                        icon: Icon(
                          _visPass!
                              ? Icons.remove_red_eye
                              : Icons.remove_red_eye_outlined,
                          color: _visPass! ? lighten(appText5, 50) : appText5,
                        ),
                        onPressed: () {
                          _visPass = _visPass;
                          setState(() {});
                        },
                      ),
                      maxLine: 1,
                      maxLength: 16,
                      label: l10n.currPwd,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                            RegExp(r'^([a-zA-Z0-9.,/-])*')),
                        LengthLimitingTextInputFormatter(1),
                      ],
                      controller: ctrl,
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return l10n.currPwdReq;
                        }  else {
                          return null;
                        }
                      },
                    ),
                    // TextFormField(
                    //   maxLines: 1,
                    //   maxLength: 16,
                    //   controller: ctrl,
                    //   inputFormatters: [
                    //     FilteringTextInputFormatter.allow(
                    //         RegExp(r'^([a-zA-Z0-9.,/-])*')),
                    //     LengthLimitingTextInputFormatter(1),
                    //   ],
                    //   cursorColor: appBtnBlue,
                    //   minLines: 1,
                    //   style: theme.textTheme.displaySmall,
                    //   decoration: InputDecoration(
                    //     counterText: '',
                    //     suffixIcon: IconButton(
                    //       icon: Icon(
                    //         _visPass!
                    //             ? Icons.remove_red_eye
                    //             : Icons.remove_red_eye_outlined,
                    //         color: _visPass! ? lighten(appText5, 50) : appText5,
                    //       ),
                    //       onPressed: () {
                    //         _visPass = !_visPass!;
                    //         setState(() {});
                    //       },
                    //     ),
                    //     focusedBorder: const OutlineInputBorder(
                    //       borderSide: BorderSide(
                    //         color: appBtnBlue,
                    //       ),
                    //     ),
                    //     border: const OutlineInputBorder(
                    //       borderSide: BorderSide(
                    //         color: appText3,
                    //       ),
                    //     ),
                    //     labelStyle: theme.textTheme.displaySmall,
                    //     fillColor: theme.colorScheme.secondary,
                    //     hintStyle: theme.textTheme.displaySmall,
                    //     hintText: l10n.pass,
                    //   ),
                    //   // decoration: InputDecoration(

                    //   // ),
                    //   // decoration: InputDecoration(
                    //   //   hintText: l10n.pass,
                    //   // ),
                    //   obscureText: _visPass!,
                    // ),
                    SizedBox(height: 24.h),
                    Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: () {
                          context.router.push(InputOTPRoute(param: ctrl.text));
                          // dispatchGetOTP();
                        },
                        child: Text(
                          l10n.submitBtn,
                          style: theme.textTheme.titleLarge,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}

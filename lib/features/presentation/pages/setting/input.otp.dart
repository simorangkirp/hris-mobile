import 'dart:async';
import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../lib.dart';

@RoutePage()
class InputOTPScreen extends StatefulWidget {
  const InputOTPScreen({
    @PathParam('param') this.param,
    super.key,
  });
  final String? param;
  @override
  State<InputOTPScreen> createState() => _InputOTPScreenState();
}

class _InputOTPScreenState extends State<InputOTPScreen> {
  List<TextEditingController> listCtrl = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];

  String otp = '';

  TextEditingController oldCtrl = TextEditingController();
  TextEditingController newCtrl = TextEditingController();
  TextEditingController valCtrl = TextEditingController();

  ProfileModel? model;

  void dispatchSubmitForm() {
    BlocProvider.of<PasswordBloc>(context)
        .add(SettingChangePwd(oldCtrl.text, newCtrl.text, otp));
  }

  void dispatchLogout() {
    BlocProvider.of<AuthBloc>(context).add(OnLogOut());
  }

  void dispatchGetOTP() {
    BlocProvider.of<PasswordBloc>(context)
        .add(SettingReqOTP(widget.param ?? "-"));
  }

  getProfile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      String? jsonBody = prefs.getString('ProfileDetailInfo');
      if (jsonBody != null) {
        final map = json.decode(jsonBody) as Map<String, dynamic>;
        model = ProfileModel.fromJson(map);
      }
    } catch (e) {
      throw Exception('Session is Expired');
    }
  }

  bool isOn = true;
  bool isLoading = false;
  bool _visOldPass = true;
  bool _visNewPass = true;
  bool _visValPass = true;
  Timer? timer;
  int start = 90;

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (start == 0) {
          isOn = false;
          timer.cancel();
          setState(() {});
        } else {
          setState(() {
            start--;
          });
        }
      },
    );
  }

  String formatduration(int totalseconds) {
    final duration = Duration(seconds: totalseconds);
    final minutes = duration.inMinutes;
    final seconds = totalseconds % 60;

    final minutesstring = '$minutes'.padLeft(2, '0');
    final secondsstring = '$seconds'.padLeft(2, '0');
    return '$minutesstring:$secondsstring';
  }

  final GlobalKey<FormState> changePwdFormKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    getProfile();
    startTimer();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final l10n = AppLocalizations.of(context);
    buildForm() {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            l10n.chgPwd,
            style: Theme.of(context).appBarTheme.titleTextStyle,
          ),
        ),
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Form(
            key: changePwdFormKey,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 32.h),
                CustomFormTextField(
                  obscureText: _visNewPass,
                  suffix: IconButton(
                    icon: Icon(
                      _visNewPass
                          ? Icons.remove_red_eye
                          : Icons.remove_red_eye_outlined,
                      color: _visNewPass ? lighten(appText5, 50) : appText5,
                    ),
                    onPressed: () {
                      _visNewPass = !_visNewPass;
                      setState(() {});
                    },
                  ),
                  maxLine: 1,
                  maxLength: 16,
                  label: l10n.currPwd,
                  controller: oldCtrl,
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return l10n.currPwdReq;
                    } else if (val != widget.param) {
                      return l10n.invPwdVal;
                    } else if (val.length < 8) {
                      return l10n.minPwdChar;
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(height: 12.h),
                CustomFormTextField(
                  obscureText: _visOldPass,
                  suffix: IconButton(
                    icon: Icon(
                      _visOldPass
                          ? Icons.remove_red_eye
                          : Icons.remove_red_eye_outlined,
                      color: _visOldPass ? lighten(appText5, 50) : appText5,
                    ),
                    onPressed: () {
                      _visOldPass = !_visOldPass;
                      setState(() {});
                    },
                  ),
                  maxLine: 1,
                  maxLength: 16,
                  label: l10n.newPwd,
                  controller: newCtrl,
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return l10n.newPwdReq;
                    } else if (val.length < 8) {
                      return l10n.minPwdChar;
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(height: 12.h),
                CustomFormTextField(
                  obscureText: _visValPass,
                  suffix: IconButton(
                    icon: Icon(
                      _visValPass
                          ? Icons.remove_red_eye
                          : Icons.remove_red_eye_outlined,
                      color: _visValPass ? lighten(appText5, 50) : appText5,
                    ),
                    onPressed: () {
                      _visValPass = !_visValPass;
                      setState(() {});
                    },
                  ),
                  maxLine: 1,
                  maxLength: 16,
                  label: l10n.valPwd,
                  controller: valCtrl,
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return l10n.newPwdReq;
                    } else if (val.length < 8) {
                      return l10n.minPwdChar;
                    } else if (newCtrl.text != valCtrl.text) {
                      return l10n.valPwdReq;
                    } else {
                      return null;
                    }
                  },
                ),
                SizedBox(height: 56.h),
                Text(
                  l10n.otpVerif,
                  style: theme.textTheme.headlineSmall,
                ),
                SizedBox(height: 8.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      l10n.otpVerifDesc,
                      style: theme.textTheme.bodyMedium,
                    ),
                    SizedBox(width: 4.w),
                    Text(
                      model?.nohp ?? "-",
                      style: theme.textTheme.bodyLarge,
                    ),
                  ],
                ),
                SizedBox(height: 24.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(listCtrl.length, (index) {
                    var ctrl = listCtrl[index];
                    return SizedBox(
                      height: 58,
                      width: 52,
                      child: TextFormField(
                        controller: ctrl,
                        decoration: InputDecoration(
                          hintText: "*",
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: //hasFocus ?
                                  const BorderSide(
                                      color: appLightGrey, width: 1)
                              //  : BorderSide.none,
                              ),
                          disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide:
                                  const BorderSide(color: appLightGrey)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(
                                  color: appButtonBlue, width: 1)),
                          errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(color: appWarning)),
                          focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(
                                  color: appWarning, width: 1.5)),
                        ),
                        cursorColor: appBtnBlue,
                        style: Theme.of(context).textTheme.titleLarge,
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(1),
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        onChanged: (value) {
                          if (value.isEmpty && index != 0) {
                            FocusScope.of(context).previousFocus();
                          }
                          if (value.length == 1 &&
                              index != (listCtrl.length - 1)) {
                            FocusScope.of(context).nextFocus();
                          }
                        },
                      ),
                    );
                  }),
                ),
                SizedBox(height: 32.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      l10n.otpResendDesc,
                      style: theme.textTheme.bodyMedium,
                    ),
                    SizedBox(width: 8.w),
                    Visibility(
                      visible: !isOn,
                      replacement: Text(
                        formatduration(start),
                        style: theme.textTheme.bodyLarge,
                      ),
                      child: GestureDetector(
                        onTap: () {
                          if (isOn = true) {
                            dispatchGetOTP();
                            setState(() {});
                          }
                        },
                        child: Text(
                          l10n.otpResend,
                          style: theme.textTheme.bodyLarge,
                        ),
                      ),
                    ),
                  ],
                ),
                // SizedBox(height: 32.h),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    if (changePwdFormKey.currentState!.validate()) {
                      otp = '';
                      for (var el in listCtrl) {
                        otp = otp + el.text;
                      }
                      dispatchSubmitForm();
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: appBtnBlue,
                    ),
                    width: double.maxFinite,
                    padding: EdgeInsets.symmetric(vertical: 12.h),
                    child: Center(
                      child: isLoading
                          ? const CircularProgressIndicator(
                              color: appBgWhite,
                            )
                          : Text(
                              l10n.submitBtn,
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 14.sp,
                                color: appBgWhite,
                              ),
                            ),
                    ),
                  ),
                ),
                SizedBox(height: 32.h),
              ],
            ),
          ),
        ),
      );
    }

    return MultiBlocListener(
      listeners: [
        BlocListener<PasswordBloc, PasswordState>(
          listener: (context, state) {
            if (state is PasswordSuccessReset) {
              Future.delayed(const Duration(seconds: 3)).then((value) {
                dispatchLogout();
              });
            }
            if (state is PasswordError) {
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(failSnackBar(
                  message: state.msg,
                ));
            }
            if (state is OTPLoading) {
              setState(() {
                isLoading = true;
              });
            }
            if (state is PasswordOTPResponed) {
              isOn = true;
              start = 90;
              startTimer();
              setState(() {
                isLoading = false;
              });
            }
          },
        ),
        BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is OnLogOutSuccess) {
              context.router.replaceAll([const SplashRoute()]);
            }
          },
        )
      ],
      child: BlocBuilder<PasswordBloc, PasswordState>(
        builder: (context, state) {
          if (state is PasswordLoading) {
            return Scaffold(
              body: SafeArea(
                child: Padding(
                  padding: Constant.appPadding,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Lottie.asset(ConstantLottie.submitLoading),
                      SizedBox(height: 12.h),
                      Text(
                        l10n.process_req_msg,
                        textAlign: TextAlign.center,
                        style: theme.textTheme.headlineLarge,
                      )
                    ],
                  ),
                ),
              ),
            );
          } else if (state is PasswordSuccessReset) {
            return Scaffold(
              body: SafeArea(
                child: Padding(
                  padding: Constant.appPadding,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Lottie.asset(ConstantLottie.submitSuccess),
                      SizedBox(height: 12.h),
                      Text(
                        l10n.process_req_msg_scs,
                        textAlign: TextAlign.center,
                        style: theme.textTheme.headlineLarge,
                      ),
                    ],
                  ),
                ),
              ),
            );
          } else {
            return buildForm();
          }
        },
      ),
    );
  }
}

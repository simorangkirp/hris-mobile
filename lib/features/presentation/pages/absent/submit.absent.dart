import 'dart:async';
import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../lib.dart';

@RoutePage()
class SubmitAbsentScreen extends StatefulWidget {
  const SubmitAbsentScreen({
    @PathParam('params') this.photoParam,
    @PathParam('period') this.period,
    @PathParam('inout') this.inout,
    super.key,
  });
  final String? photoParam;
  final String? period, inout;

  @override
  State<SubmitAbsentScreen> createState() => _SubmitAbsentScreenState();
}

class _SubmitAbsentScreenState extends State<SubmitAbsentScreen> {
  ScrollController ctrl = ScrollController();
  List<TextEditingController> listCtrl = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];

  bool isCheck = false;
  Uint8List? photo;
  String paramPIN = '';

  buildScafMsg(String msg) {
    return ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(failSnackBar(
        message: msg,
      ));
  }

  FutureOr onGoBack() {
    refreshData();
  }

  void refreshData() {
    if (widget.photoParam != null) {
      photo = const Base64Decoder().convert(widget.photoParam!.split(',').last);
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    if (widget.photoParam != null) {
      photo = const Base64Decoder().convert(widget.photoParam!.split(',').last);
    }
  }

  submitPIN() {
    paramPIN = '';
    for (var el in listCtrl) {
      paramPIN = paramPIN + el.text;
    }
    dispatchSubmitPIN();
  }

  TextEditingController desCtrl = TextEditingController();

  void dispatchSubmitPIN() {
    BlocProvider.of<AbsentBloc>(context).add(AbsentCheckPin(paramPIN));
  }

  void dispatchAddComment() {
    BlocProvider.of<AbsentBloc>(context).add(AbsentAddComment());
  }

  void dispatchRemoveComment() {
    BlocProvider.of<AbsentBloc>(context).add(AbsentRemoveComment());
  }

  void dispatchSubmitAbsent() {
    BlocProvider.of<AbsentBloc>(context).add(
      SubmitUserAbsent(SubmitUserAbsentParams(
        DateFormat('yyyy-MM-dd').format(DateTime.now()),
        widget.period ?? "",
        'H',
        widget.inout ?? "",
        DateFormat('HH:mm:ss').format(DateTime.now()),
        '', // Coordinate
        widget.photoParam ?? "",
        desCtrl.text, // Desc
        'mobile',
        '', // Coorphoto
      )),
    );
  }

  bool isAddDesc = false;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final ThemeData theme = Theme.of(context);
    Future<bool> determinePosition() async {
      bool serviceEnabled;
      LocationPermission permission;

      // Test if location services are enabled.
      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        // Location services are not enabled don't continue
        // accessing the position and request users of the
        // App to enable the location services.
        buildScafMsg(l10n.loc_disable_msg);
        return false;
      }

      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          // Permissions are denied, next time you could try
          // requesting permissions again (this is also where
          // Android's shouldShowRequestPermissionRationale
          // returned true. According to Android guidelines
          // your App should show an explanatory UI now.
          buildScafMsg(l10n.loc_denied_msg);
          return false;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        // Permissions are denied forever, handle appropriately.
        buildScafMsg(l10n.loc_permission_msg);
        return false;
      }
      return true;
    }

    buildFormAbsent() {
      return Padding(
        padding: Constant.appPadding,
        child: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (OverscrollIndicatorNotification overScrl) {
            overScrl.disallowIndicator();
            return false;
          },
          child: SingleChildScrollView(
            controller: ctrl,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 16.h),
                IntrinsicHeight(
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              l10n.date,
                              style: theme.textTheme.displaySmall,
                            ),
                            SizedBox(height: 2.h),
                            Text(
                              DateFormat('EEE, dd MMM yyyy')
                                  .format(DateTime.now()),
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 14.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 2.w),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              l10n.hour,
                              style: theme.textTheme.displaySmall,
                            ),
                            SizedBox(height: 2.h),
                            StreamBuilder(
                              stream:
                                  Stream.periodic(const Duration(seconds: 1)),
                              builder: (context, snapshot) {
                                return Text(
                                  DateFormat('HH:mm:ss').format(DateTime.now()),
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14.sp,
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 12.h),
                IntrinsicHeight(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              l10n.assignmentLocation,
                              style: theme.textTheme.displaySmall,
                            ),
                            SizedBox(height: 2.h),
                            Text(
                              'OWL HO',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 14.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: !isAddDesc
                            ? GestureDetector(
                                onTap: () {
                                  dispatchAddComment();
                                },
                                child: Row(
                                  children: [
                                    Container(
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: appBtnBlue,
                                      ),
                                      padding: EdgeInsets.all(4.w),
                                      child: Icon(
                                        Icons.add,
                                        size: 12.w,
                                        color: appBgWhite,
                                      ),
                                    ),
                                    SizedBox(width: 4.w),
                                    Text(
                                      l10n.desc,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14.sp,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : Row(
                                children: [
                                  Expanded(
                                    child: CustomFormTextField(
                                      label: l10n.desc,
                                      maxLength: 128,
                                      controller: desCtrl,
                                    ),
                                  ),
                                  SizedBox(width: 4.w),
                                  GestureDetector(
                                    onTap: () {
                                      dispatchRemoveComment();
                                    },
                                    child: Container(
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: appImperialRed,
                                      ),
                                      padding: EdgeInsets.all(4.w),
                                      child: Icon(
                                        Icons.close,
                                        size: 12.w,
                                        color: appBgWhite,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  l10n.photo,
                  style: theme.textTheme.displaySmall,
                ),
                SizedBox(height: 8.h),
                InkWell(
                  onTap: () {
                    context.router
                        .push(
                          AbsentCameraRoute(
                              inout: widget.inout, period: widget.period),
                        )
                        .then((value) => onGoBack());
                    // context.router
                    //     .pushAndPopUntil(
                    //         AbsentCameraRoute(
                    //             inout: widget.inout, period: widget.period),
                    //         predicate: (route) => false,
                    //         onFailure: (failure) => '/',
                    //         scopedPopUntil: true)
                    //     .then((value) => onGoBack());
                    // Navigator.of(context).pushAndRemoveUntil(
                    //     MaterialPageRoute(
                    //         builder: (BuildContext context) =>
                    //             const AbsentCameraScreen()),
                    //     (Route<dynamic> route) =>
                    //         false // Replace this with your root screen's route name (usually '/')
                    //     );
                  },
                  child: photo != null
                      ? Material(
                          borderRadius: BorderRadius.circular(12),
                          elevation: 8,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: SizedBox(
                              width: double.maxFinite,
                              height: 0.48.sh,
                              child: Image.memory(
                                photo!,
                                gaplessPlayback: true,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        )
                      : Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: appDivider.withOpacity(0.4),
                          ),
                          width: double.maxFinite,
                          height: 0.48.sh,
                          child: Center(
                            child: SizedBox(
                              height: 0.2.sh,
                              width: 0.2.sh,
                              child: SvgPicture.asset(
                                ConstIconPath.cameraIcon,
                                colorFilter: const ColorFilter.mode(
                                    appBgWhite, BlendMode.srcIn),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                ),
                SizedBox(height: 18.h),
                Visibility(
                  visible: !isCheck,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Material(
                        elevation: 4,
                        borderRadius: BorderRadius.circular(12),
                        child: InkWell(
                          onTap: () {
                            modalBtnPIN(
                              context,
                              listCtrl,
                              () => submitPIN(),
                            );
                          },
                          child: Container(
                            height: 36.h,
                            width: 36.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: appBgWhite,
                              border: Border.all(
                                color: appBtnBlue.withOpacity(0.6),
                                width: 2,
                              ),
                            ),
                            child: Center(
                              child: SvgPicture.asset(
                                ConstIconPath.pinIcon,
                                colorFilter: ColorFilter.mode(
                                    appBgBlack.withOpacity(0.7),
                                    BlendMode.srcIn),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Visibility(
                          visible:
                              defaultTargetPlatform == TargetPlatform.android,
                          child: SizedBox(width: 24.w)),
                      Visibility(
                        visible:
                            defaultTargetPlatform == TargetPlatform.android,
                        child: Material(
                          elevation: 4,
                          borderRadius: BorderRadius.circular(12),
                          child: InkWell(
                            onTap: () async {
                              final isAuth = await LocalAuthAPI.authenticate();
                              if (isAuth) {
                                setState(() {
                                  isCheck = true;
                                });
                              }
                            },
                            child: Container(
                              height: 36.h,
                              width: 36.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: appBgWhite,
                                border: Border.all(
                                  color: appBtnBlue.withOpacity(0.6),
                                  width: 2,
                                ),
                              ),
                              child: Center(
                                child: SvgPicture.asset(
                                  ConstIconPath.fingerPrintIcon,
                                  colorFilter: ColorFilter.mode(
                                      appBgBlack.withOpacity(0.7),
                                      BlendMode.srcIn),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Visibility(
                          visible: defaultTargetPlatform == TargetPlatform.iOS,
                          child: SizedBox(width: 24.w)),
                      Visibility(
                        visible: defaultTargetPlatform == TargetPlatform.iOS,
                        child: Material(
                          elevation: 4,
                          borderRadius: BorderRadius.circular(12),
                          child: InkWell(
                            onTap: () async {
                              final isAuth = await LocalAuthAPI.authenticate();
                              if (isAuth) {
                                setState(() {
                                  isCheck = true;
                                });
                              }
                            },
                            child: Container(
                              height: 36.h,
                              width: 36.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: appBgWhite,
                                border: Border.all(
                                  color: appBtnBlue.withOpacity(0.6),
                                  width: 2,
                                ),
                              ),
                              child: Center(
                                child: SvgPicture.asset(
                                  ConstIconPath.faceIdIcon,
                                  colorFilter: ColorFilter.mode(
                                      appBgBlack.withOpacity(0.7),
                                      BlendMode.srcIn),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // SizedBox(height: 12.h),
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 500),
                  transitionBuilder: (child, animation) {
                    return ScaleTransition(scale: animation, child: child);
                  },
                  child: Visibility(
                    key: ValueKey(isCheck),
                    visible: isCheck,
                    child: Container(
                      width: double.maxFinite,
                      height: 48.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: appNotifAbsIcn,
                          width: 2,
                        ),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 8.h),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            l10n.scs_auth_msg,
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w700,
                              color: appNotifAbsIcn,
                            ),
                          ),
                          SvgPicture.asset(
                            height: 16.h,
                            ConstIconPath.checkIcon,
                            colorFilter: const ColorFilter.mode(
                                appNotifAbsIcn, BlendMode.srcIn),
                            fit: BoxFit.fill,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 12.h),
                InkWell(
                  onTap: () {
                    if (isCheck) {
                      determinePosition().then((value) {
                        if (value) {
                          dispatchSubmitAbsent();
                        }
                      });
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: isCheck ? appBtnBlue : appDivider,
                    ),
                    width: double.maxFinite,
                    height: 42.h,
                    child: Center(
                      child: Text(
                        l10n.submitBtn,
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 16.sp,
                          color: appBgWhite,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 12.h),
              ],
            ),
          ),
        ),
      );
    }

    return BlocListener<AbsentBloc, AbsentState>(
      listener: (context, state) {
        if (state is UserAbsentSubmitted) {
          Future.delayed(const Duration(seconds: 3)).then((value) {
            context.router.navigate(const AbsentRoute());
          });
        }
        if (state is AbsentCommentAdded) {
          isAddDesc = true;
          setState(() {});
        }
        if (state is AbsentCommentRemoved) {
          isAddDesc = false;
          desCtrl.text = '';
          setState(() {});
        }
        if (state is AbsentPINChecked) {
          if (state.msg == Constant.pinValid) {
            setState(() {
              isCheck = true;
            });
          } else {
            buildScafMsg(state.msg ?? "error");
          }
        }
        if (state is AbsentSubmitAbsentError) {
          buildScafMsg(state.errMsg ?? "-");
        }
      },
      child: BlocBuilder<AbsentBloc, AbsentState>(
        builder: (context, state) {
          if (state is UserAbsentSubmitted) {
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
                        state.msg ?? "",
                        textAlign: TextAlign.center,
                        style: theme.textTheme.displayLarge,
                      ),
                    ],
                  ),
                ),
              ),
            );
          } else if (state is AbsentLoading) {
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
                        style: theme.textTheme.displayLarge,
                      )
                    ],
                  ),
                ),
              ),
            );
          }
          return Scaffold(
            appBar: AppBar(),
            body: SafeArea(
              child: buildFormAbsent(),
            ),
          );
        },
      ),
    );
  }
}

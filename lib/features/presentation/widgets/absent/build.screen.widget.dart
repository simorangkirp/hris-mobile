import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

import '../../../../lib.dart';

Widget buildScreen(
  BuildContext context,
  EntityProfile mod,
  UserAssignLocationModel? userLoc,
  AbsentData? absenData,
  Function(String mode) onTap,
  Function() logout,
) {
  bool isClockIn = false;
  bool isClockOut = false;
  bool isDone = false;
  String clockText = '';
  if (absenData?.absenIdIn != null && absenData?.absenIdOut == null) {
    clockText = 'Clock out';
    isClockIn = false;
    isClockOut = true;
    isDone = false;
  } else if (absenData?.absenIdIn == null && absenData?.absenIdOut == null) {
    clockText = 'Clock in';
    isClockIn = true;
    isClockOut = false;
    isDone = false;
  } else if (absenData?.absenIdIn != null && absenData?.absenIdOut != null) {
    clockText = 'Good bye!';
    isClockIn = false;
    isClockOut = false;
    isDone = true;
  }

  return Scaffold(
    appBar: buildCommAppBar(mod),
    endDrawer: const AppNavigationDrawer(),
    body: SafeArea(
      child: Padding(
        padding: Constant.appPadding,
        child: Column(
          children: [
            SizedBox(height: 92.h),
            Material(
              elevation: 48,
              borderRadius: BorderRadius.circular(320),
              shadowColor: isClockIn
                  ? appBtnBlue
                  : isClockOut
                      ? Colors.deepOrange
                      : appDivider,
              child: GestureDetector(
                onTap: () {
                  if (!isDone) {
                    onTap(isClockIn ? '1' : '2');
                  }
                },
                child: Container(
                  width: 0.62.sw,
                  height: 0.62.sw,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomRight,
                      colors: [
                        isClockIn
                            ? appBtnBlue
                            : isClockOut
                                ? Colors.deepOrange
                                : appDivider,
                        isClockIn
                            ? appBtnBlue
                            : isClockOut
                                ? Colors.deepOrange
                                : appDivider,
                        Colors.white,
                      ],
                    ),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          height: 76.h,
                          width: 58.w,
                          child: SvgPicture.asset(
                            'assets/icons/hand-touch.svg',
                            fit: BoxFit.contain,
                            colorFilter: const ColorFilter.mode(
                                appBgWhite, BlendMode.srcIn),
                          ),
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          clockText,
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            color: appBgWhite,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 42.h),
            Material(
              elevation: 4,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: Constant.containerPadding,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Date",
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        SizedBox(width: 4.w),
                        Expanded(
                          child: Text(
                            DateFormat('EEE, dd MMM yyyy')
                                .format(DateTime.now()),
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 4.h),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Location assignment",
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        SizedBox(width: 4.w),
                        Expanded(
                          child: Text(
                            userLoc?.namacustomer ?? "HO",
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Divider(color: appBgBlack.withOpacity(0.3), thickness: 2),
                    Row(
                      children: [
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: appSnackbarBgSuccess,
                                ),
                                padding: EdgeInsets.all(4.h),
                                child: Center(
                                  child: Icon(
                                    Icons.login,
                                    color: appBgWhite,
                                    size: 8.h,
                                  ),
                                ),
                              ),
                              SizedBox(width: 16.w),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    absenData?.hrIn ?? '-',
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    'clock in',
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w600,
                                      color: appBgBlack.withOpacity(0.6),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        VerticalDivider(
                            color: appBgBlack.withOpacity(0.3), thickness: 2),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: appSnackbarBgError,
                                ),
                                padding: EdgeInsets.all(4.h),
                                child: Center(
                                  child: Icon(
                                    Icons.logout,
                                    color: appBgWhite,
                                    size: 8.h,
                                  ),
                                ),
                              ),
                              SizedBox(width: 16.w),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    absenData?.hrOut ?? '-',
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    'clock out',
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w600,
                                      color: appBgBlack.withOpacity(0.6),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 32.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          InkWell(
                            onTap: () {
                              context.router.push(PaidLeaveFormRoute());
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: appBgBlack.withOpacity(0.2),
                                ),
                              ),
                              padding: EdgeInsets.all(16.w),
                              child: Center(
                                child: SvgPicture.asset(
                                  'assets/icons/alert.svg',
                                  colorFilter: const ColorFilter.mode(
                                    Colors.red,
                                    BlendMode.srcIn,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 8.h),
                          Text(
                            'Paid leave',
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Expanded(child: SizedBox()),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          GestureDetector(
                            onTap: () {
                              context.router.push(const AbsentHistoryRoute());
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: appBgBlack.withOpacity(0.2),
                                ),
                              ),
                              padding: EdgeInsets.all(16.w),
                              child: Center(
                                child: SvgPicture.asset(
                                  'assets/icons/file-search.svg',
                                  colorFilter: const ColorFilter.mode(
                                    Colors.green,
                                    BlendMode.srcIn,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 8.h),
                          Text(
                            'History',
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ),
  );
}

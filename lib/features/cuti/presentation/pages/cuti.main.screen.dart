import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:owl_hris/config/config.dart';

import '../../../../core/core.dart';
import '../../cuti.dart';

@RoutePage()
class PaidLeaveMainScreen extends StatefulWidget {
  const PaidLeaveMainScreen({super.key});

  @override
  State<PaidLeaveMainScreen> createState() => _PaidLeaveMainScreenState();
}

class _PaidLeaveMainScreenState extends State<PaidLeaveMainScreen> {
  ScrollController ctrl = ScrollController();
  String dt = "Current period";
  String sltdDt = '';
  String dtParam = '';
  bool startAnimation = false;
  void changeDate(DateTime v) {
    setState(() {
      sltdDt = DateFormat('MMM yyyy').format(v).toString();
      dtParam = DateFormat('yyyy-MM').format(v).toString();
    });
    // dispatchGetAbsentListPeriod();
  }

  void dispatchGetUserData() {
    BlocProvider.of<PaidLeaveBloc>(context).add(PaidLeaveGetUserData());
  }

  void displayMonthPicker(BuildContext ctx) {
    showDialog(
      context: ctx,
      builder: (ctx) {
        return CommonMonthPicker(
          onConfirm: (v) {
            context.router.pop();
            // log(v.toString());
            changeDate(v);
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Paid Leave'),
      ),
      body: BlocListener<PaidLeaveBloc, PaidLeaveState>(
        listener: (context, state) {},
        child: BlocBuilder<PaidLeaveBloc, PaidLeaveState>(
          builder: (context, state) {
            return Padding(
              padding: Constant.appPadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Material(
                    elevation: 8,
                    borderRadius: BorderRadius.circular(8),
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: EdgeInsets.symmetric(
                              horizontal: 8.w, vertical: 8.h),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: IntrinsicHeight(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Period',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 12.sp,
                                            ),
                                          ),
                                          Text(
                                            '2023',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 12.sp,
                                              color:
                                                  appBgBlack.withOpacity(0.6),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: IntrinsicHeight(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Annual leave',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 12.sp,
                                            ),
                                          ),
                                          Text(
                                            '15',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 12.sp,
                                              color:
                                                  appBgBlack.withOpacity(0.6),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 4.h),
                              Row(
                                children: [
                                  Expanded(
                                    child: IntrinsicHeight(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Available',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 12.sp,
                                            ),
                                          ),
                                          Text(
                                            '0',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 12.sp,
                                              color:
                                                  appBgBlack.withOpacity(0.6),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: IntrinsicHeight(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Taken',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 12.sp,
                                            ),
                                          ),
                                          Text(
                                            '1',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 12.sp,
                                              color:
                                                  appBgBlack.withOpacity(0.6),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          right: -2.w,
                          bottom: -8.h,
                          child: SizedBox(
                            width: 78.h,
                            height: 78.h,
                            child: SvgPicture.asset(
                              Constant.owlBird,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 24.h),
                  // Text(
                  //   'Recent',
                  //   style: TextStyle(
                  //     fontSize: 16.sp,
                  //     fontWeight: FontWeight.w500,
                  //   ),
                  // ),
                  IntrinsicHeight(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Material(
                          elevation: 4,
                          borderRadius: BorderRadius.circular(12),
                          child: GestureDetector(
                            onTap: () {
                              displayMonthPicker(context);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: appNotifCutIcn.withOpacity(0.8),
                              ),
                              height: 38.h,
                              width: 38.h,
                              child: SvgPicture.asset(
                                ConstIconPath.calendarDays,
                                fit: BoxFit.scaleDown,
                                colorFilter: const ColorFilter.mode(
                                    appBgWhite, BlendMode.srcIn),
                              ),
                            ),
                            // Container(
                            //   decoration: BoxDecoration(
                            //     borderRadius: BorderRadius.circular(4),
                            //     border: Border.all(
                            //       color: appButtonBlue.withOpacity(0.3),
                            //     ),
                            //     color: appButtonBlue,
                            //   ),
                            //   padding: EdgeInsets.all(6.w),
                            //   width: 32.w,
                            //   height: 32.w,
                            //   child: SvgPicture.asset(
                            //     ConstIconPath.calendarDays,
                            //     fit: BoxFit.contain,
                            //     colorFilter: const ColorFilter.mode(
                            //         appBgWhite, BlendMode.srcIn),
                            //   ),
                            // ),
                          ),
                        ),
                        SizedBox(width: 8.w),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              dt,
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                color: appBgBlack,
                              ),
                            ),
                            Text(
                              sltdDt,
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                color: appBgBlack.withOpacity(0.6),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 12.h),
                  Material(
                    elevation: 8,
                    borderRadius: BorderRadius.circular(4),
                    shadowColor: appCutiBg,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: appBgWhite,
                      ),
                      padding:
                          EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "-",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14.sp,
                                  ),
                                ),
                                Text(
                                  "-",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12.sp,
                                    color: appBgBlack.withOpacity(0.7),
                                  ),
                                ),
                                Text(
                                  "-",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12.sp,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SvgPicture.asset(
                            height: 18.h,
                            ConstIconPath.questionIcon,
                            colorFilter: const ColorFilter.mode(
                                appCutiBg, BlendMode.srcIn),
                            fit: BoxFit.fill,
                          ),
                          SizedBox(width: 12.w),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

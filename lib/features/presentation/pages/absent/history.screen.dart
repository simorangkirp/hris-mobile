import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import '../../../../lib.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

@RoutePage()
class AbsentHistoryScreen extends StatefulWidget implements AutoRouteWrapper {
  const AbsentHistoryScreen({super.key});

  @override
  State<AbsentHistoryScreen> createState() => _AbsentHistoryScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<AbsentBloc>(),
      child: this,
    );
  }
}

class _AbsentHistoryScreenState extends State<AbsentHistoryScreen> {
  void dispatchGetAbsentListPeriod() {
    BlocProvider.of<AbsentBloc>(context).add(GetAbsentPeriod(dtParam));
  }

  void dispatchGetHolidayList() {
    BlocProvider.of<AbsentBloc>(context).add(AbsentHolidayList());
  }

  List<HolidayModel>? listHoliday;

  String sltdDt = '';
  String dtParam = '';
  bool startAnimation = false;

  @override
  void initState() {
    super.initState();
    // dispatchGetAbsentListPeriod();
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    //   setState(() {
    //     startAnimation = true;
    //   });
    // });
    dispatchGetHolidayList();
  }

  void changeDate(DateTime v) {
    setState(() {
      sltdDt = DateFormat('MMM yyyy').format(v).toString();
      dtParam = DateFormat('yyyy-MM').format(v).toString();
    });
    dispatchGetAbsentListPeriod();
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
    final l10n = AppLocalizations.of(context)!;
    ScrollController ctrl = ScrollController();
    String dt = l10n.currPeriod;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          l10n.absentListTitle,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      body: BlocListener<AbsentBloc, AbsentState>(
        listener: (context, state) {
          if (state is AbsentLoading) {
            setState(() {
              startAnimation = false;
            });
          }
          if (state is AbsentPeriodLoaded) {
            Future.delayed(const Duration(milliseconds: 350), () {
              setState(() {
                startAnimation = true;
              });
            });
          }
          if (state is AbsentListHolidayLoaded) {
            listHoliday = state.listHoliday;
          }
        },
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: NotificationListener<OverscrollIndicatorNotification>(
              onNotification: (OverscrollIndicatorNotification overScrl) {
                overScrl.disallowIndicator();
                return false;
              },
              child: ListView(
                controller: ctrl,
                children: [
                  SizedBox(height: 8.h),
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
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.start,
                    //   crossAxisAlignment: CrossAxisAlignment.center,
                    //   children: [
                    //     Material(
                    //       elevation: 4,
                    //       borderRadius: BorderRadius.circular(4),
                    //       child: GestureDetector(
                    //         onTap: () {
                    //           displayMonthPicker(context);
                    //         },
                    //         child: Container(
                    //           decoration: BoxDecoration(
                    //             borderRadius: BorderRadius.circular(4),
                    //             border: Border.all(
                    //               color: appButtonBlue.withOpacity(0.3),
                    //             ),
                    //             color: appButtonBlue,
                    //           ),
                    //           padding: EdgeInsets.all(6.w),
                    //           width: 32.w,
                    //           height: 32.w,
                    //           child: SvgPicture.asset(
                    //             ConstIconPath.calendarDays,
                    //             fit: BoxFit.contain,
                    //             colorFilter: const ColorFilter.mode(
                    //                 appBgWhite, BlendMode.srcIn),
                    //           ),
                    //         ),
                    //       ),
                    //     ),
                    //     SizedBox(width: 8.w),
                    //     Column(
                    //       mainAxisAlignment: MainAxisAlignment.start,
                    //       crossAxisAlignment: CrossAxisAlignment.start,
                    //       mainAxisSize: MainAxisSize.min,
                    //       children: [
                    //         Text(
                    //           dt,
                    //           style: TextStyle(
                    //             fontSize: 14.sp,
                    //             fontWeight: FontWeight.w700,
                    //             color: appBgBlack,
                    //           ),
                    //         ),
                    //         Text(
                    //           sltdDt,
                    //           style: TextStyle(
                    //             fontSize: 14.sp,
                    //             fontWeight: FontWeight.w700,
                    //             color: appBgBlack.withOpacity(0.6),
                    //           ),
                    //         ),
                    //       ],
                    //     ),
                    //   ],
                    // ),
                  ),
                  SizedBox(height: 4.h),
                  //! Daftar Absent Widget
                  // Text(
                  //   'Daftar Absensi',
                  //   style: TextStyle(
                  //     fontSize: 14.sp,
                  //     fontWeight: FontWeight.w600,
                  //   ),
                  // ),
                  // SizedBox(height: 4.h),
                  Divider(
                    color: appBgBlack.withOpacity(0.5),
                    thickness: 2,
                  ),
                  SizedBox(height: 8.h),
                  BlocBuilder<AbsentBloc, AbsentState>(
                    builder: (context, state) {
                      if (state is AbsentPeriodLoaded) {
                        return state.listAbsent != null
                            ? ListView.builder(
                                shrinkWrap: true,
                                controller: ctrl,
                                itemCount: state.listAbsent!.length,
                                itemBuilder: (context, index) {
                                  var item = state.listAbsent![index];
                                  return items(item, index);
                                },
                              )
                            : const SizedBox();
                      } else {
                        return const SizedBox();
                      }
                    },
                  ),
                  SizedBox(height: 24.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget items(AbsentEntity items, int index) {
    return AnimatedContainer(
      curve: Curves.easeInOut,
      duration: Duration(milliseconds: 300 + (index * 100)),
      transform: Matrix4.translationValues(startAnimation ? 0 : 1.sw, 0, 0),
      child: Column(
        children: [
          Material(
            elevation: 4,
            borderRadius: BorderRadius.circular(4),
            child: AbsentItemCard(
              holiday: listHoliday,
              item: items,
            ),
          ),
          SizedBox(height: 12.h),
        ],
      ),
    );
  }
}

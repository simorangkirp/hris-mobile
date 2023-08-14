import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:owl_hris/features/absen/absen.dart';

import '../../../../config/themes/colors.dart';
import '../../../../core/core.dart';
import '../../../../injection.container.dart';
import '../widgets/absent.item.dart';

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
    BlocProvider.of<AbsentBloc>(context)
        .add(GetAbsentPeriod('SZQKN-N3G7C-X9RDC', '2023-07', '1'));
  }

  ScrollController ctrl = ScrollController();
  String dt = "";
  bool startAnimation = false;

  @override
  void initState() {
    super.initState();
    dispatchGetAbsentListPeriod();
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    //   setState(() {
    //     startAnimation = true;
    //   });
    // });
  }

  void changeDate(DateTime v) {
    setState(() {
      dt = DateFormat('MMM yyyy').format(v).toString();
    });
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
        centerTitle: true,
        title: Text(
          'Daftar Absensi',
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      body: BlocListener<AbsentBloc, AbsentState>(
        listener: (context, state) {
          if (state is AbsentPeriodLoaded) {
            Future.delayed(const Duration(milliseconds: 350), () {
              setState(() {
                startAnimation = true;
              });
            });
          }
        },
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Expanded(
              child: NotificationListener<OverscrollIndicatorNotification>(
                onNotification: (OverscrollIndicatorNotification overScrl) {
                  overScrl.disallowIndicator();
                  return false;
                },
                child: ListView(
                  controller: ctrl,
                  children: [
                    SizedBox(height: 18.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Material(
                          elevation: 4,
                          borderRadius: BorderRadius.circular(4),
                          child: GestureDetector(
                            onTap: () {
                              displayMonthPicker(context);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                border: Border.all(
                                  color: appButtonBlue.withOpacity(0.3),
                                ),
                                color: appButtonBlue,
                              ),
                              padding: EdgeInsets.all(6.w),
                              width: 32.w,
                              height: 32.w,
                              child: SvgPicture.asset(
                                ConstIconPath.calendarDays,
                                fit: BoxFit.contain,
                                colorFilter: const ColorFilter.mode(
                                    appBgWhite, BlendMode.srcIn),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 8.w),
                        Text(
                          dt,
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 12.h),
                    //! Daftar Absent Widget
                    Text(
                      'Daftar Absensi',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
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
              item: items,
            ),
          ),
          SizedBox(height: 12.h),
        ],
      ),
    );
  }
}

import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

import '../../../../lib.dart';

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
  List<PaidLeavePlafond>? plafond;
  ProfileModel? profile;
  List<PaidLeaveListData>? listpl;

  void changeDate(DateTime v) {
    setState(() {
      sltdDt = DateFormat('MMM yyyy').format(v).toString();
      dtParam = DateFormat('yyyy-MM').format(v).toString();
    });
    dispatchGetListData();
    // dispatchGetAbsentListPeriod();
  }

  void dispatchGetUserData() {
    BlocProvider.of<PaidLeaveBloc>(context).add(PaidLeaveGetUserData());
  }

  void dispatchGetUserPlafond() {
    BlocProvider.of<PaidLeaveBloc>(context).add(PaidLeaveGetPlafond());
  }

  void dispatchGetListData() {
    BlocProvider.of<PaidLeaveBloc>(context).add(PaidLeaveGetListData(dtParam));
  }

  void dispatchLogout() {
    BlocProvider.of<AuthBloc>(context).add(OnLogOut());
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
  void initState() {
    super.initState();
    dispatchGetUserData();
  }

  void refreshData() {
    dispatchGetUserData();
  }

  FutureOr onGoBack() {
    refreshData();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<PaidLeaveBloc, PaidLeaveState>(
          listener: (context, state) {
            if (state is PaidLeaveProfileLoaded) {
              profile = state.profile;
              dispatchGetUserPlafond();
            }
            if (state is PaidLeaveErrCall) {
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(failSnackBar(
                  message: state.errMsg,
                ));
            }
            if (state is PaidLeavePlafondLoaded) {
              plafond = state.plafond;
              dispatchGetListData();
            }
            if (state is PaidLeaveListDataLoaded) {
              setState(() {
                listpl = state.listData;
              });
            }
          },
        ),
        BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is ShowLogoutDialog) {
              onLogOutDialog(
                context,
                () => dispatchLogout(),
              );
            }
            if (state is OnLogOutSuccess) {
              context.router.replaceAll([const SplashRoute()]);
            }
          },
        ),
      ],
      child: BlocBuilder<PaidLeaveBloc, PaidLeaveState>(
        builder: (context, state) {
          if (state is PaidLeaveLoading) {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else {
            return Scaffold(
              appBar: buildCommAppBar(profile),
              endDrawer: const AppNavigationDrawer(),
              body: Padding(
                padding: Constant.appPadding,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 24.h),
                    buildPlafond(plafond),
                    SizedBox(height: 24.h),
                    IntrinsicHeight(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
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
                          Material(
                            elevation: 4,
                            borderRadius: BorderRadius.circular(12),
                            child: GestureDetector(
                              onTap: () {
                                context.router.push(PaidLeaveFormRoute());
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: appNotifCutIcn.withOpacity(0.8),
                                ),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 8.h, vertical: 8.h),
                                height: 38.h,
                                constraints: BoxConstraints(
                                  minWidth: 38.h,
                                ),
                                child: const Icon(
                                  Icons.add,
                                  color: appBgWhite,
                                ),
                                // Row(
                                //   children: [
                                //     Icon(
                                //       Icons.add,
                                //       color: appBgWhite,
                                //     ),
                                //     VerticalDivider(
                                //       color: appBgWhite,
                                //       thickness: 2,
                                //     ),
                                //     Text(
                                //       'Create',
                                //       style: TextStyle(
                                //         fontSize: 14.sp,
                                //         fontWeight: FontWeight.w500,
                                //         color: appBgWhite,
                                //       ),
                                //     ),
                                //   ],
                                // ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 16.h),
                    Expanded(
                      child: BlocBuilder<PaidLeaveBloc, PaidLeaveState>(
                        builder: (context, state) {
                          if (state is PaidLeaveListDataLoaded) {
                            return buildListItems(
                              listpl,
                              (s) {
                                context.router
                                    .push(PaidLeaveDetailRoute(id: s))
                                    .then((value) => onGoBack());
                              },
                            );
                          } else if (state is PaidLeaveSearchLoading) {
                            return Center(
                              child: SizedBox(
                                height: 32.h,
                                width: 32.h,
                                child: const CircularProgressIndicator(),
                              ),
                            );
                          } else {
                            return noDataWidget();
                          }
                        },
                      ),
                    ),
                    // ! build listview of buildListItems
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}

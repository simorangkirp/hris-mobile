import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:owl_hris/lib.dart';

@RoutePage()
class ProfileScreen extends StatefulWidget implements AutoRouteWrapper {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<ProfileScreenBloc>(),
      child: this,
    );
  }
}

buildProfileScreen(BuildContext ctx, EntityProfile? data, int? aCtr) {
  return Scaffold(
    appBar: AppBar(
      automaticallyImplyLeading: false,
      // centerTitle: true,
      // title: Text(
      //   'Profile',
      //   style: TextStyle(
      //     fontSize: 16.sp,
      //     fontWeight: FontWeight.w400,
      //   ),
      // ),
    ),
    endDrawer: const AppNavigationDrawer(),
    body: Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        children: [
          SizedBox(height: 72.h),
          buildProfileInfo(data),
          SizedBox(height: 12.h),
          buildTimeSheet(aCtr),
          SizedBox(height: 12.h),
          buildListMenu(),
        ],
      ),
    ),
  );
}

buildProfileSkeleton() {
  return Scaffold(
    body: Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 72.h),
          buildProfileInfoSkel(),
          SizedBox(height: 18.h),
          buildTimeSheetSkel(),
          SizedBox(height: 18.h),
          buildListMenuSkel(),
        ],
      ),
    ),
  );
}

class _ProfileScreenState extends State<ProfileScreen> {
  EntityProfile? model;
  late int absCtr;
  String? now;
  String? currPeriod;
  void dispatchGetProfileInfo() {
    BlocProvider.of<ProfileScreenBloc>(context)
        .add(GetProfileInfoProfileScreen());
  }

  void dispatchGetAbsentInfo() {
    BlocProvider.of<ProfileScreenBloc>(context)
        .add(GetAbsentInfo(currPeriod ?? '-'));
  }

  void dispatchGetActPeriod() {
    BlocProvider.of<ProfileScreenBloc>(context).add(ProfileScrnGetActPeriod(
      model?.lokasitugas ?? "-",
      now ?? "-",
    ));
  }

  @override
  void initState() {
    absCtr = 0;
    dispatchGetProfileInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileScreenBloc, ProfileScreenState>(
      listener: (context, state) {
        if (state is ProfileInfoLoaded) {
          model = state.profile;
          now = DateFormat('yyyy-MM-dd').format(DateTime.now()).toString();
          dispatchGetActPeriod();
        }
        if (state is ProfileScrnActPeriodLoaded) {
          currPeriod = state.period?.periode ?? '-';
          dispatchGetAbsentInfo();
        }
        if (state is AbsentDataLoaded) {
          if (state.listAbsent!.isNotEmpty) {
            for (var e in state.listAbsent!) {
              if (e.data?.absenIdIn != null || e.data?.absenIdOut != null) {
                absCtr = absCtr + 1;
                // log("${e.tanggal} $absCtr");
              }
            }
          }
        }
      },
      child: BlocBuilder<ProfileScreenBloc, ProfileScreenState>(
        builder: (context, state) {
          if (state is AbsentDataLoaded) {
            return buildProfileScreen(context, model, absCtr);
          } else {
            return buildProfileSkeleton();
          }
        },
      ),
    );
  }
}

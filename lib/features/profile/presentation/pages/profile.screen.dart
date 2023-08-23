import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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

buildProfileScreen(BuildContext ctx, EntityProfile? data) {
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
          buildTimeSheet(),
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
  void dispatchGetProfileInfo() {
    BlocProvider.of<ProfileScreenBloc>(context)
        .add(GetProfileInfoProfileScreen());
  }

  @override
  void initState() {
    dispatchGetProfileInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileScreenBloc, ProfileScreenState>(
      listener: (context, state) {
        if (state is ProfileInfoLoaded) {
          model = state.profile;
        }
      },
      child: BlocBuilder<ProfileScreenBloc, ProfileScreenState>(
        builder: (context, state) {
          if (state is ProfileScreenLoading) {
            return buildProfileSkeleton();
          } else {
            return buildProfileScreen(context, model);
          }
        },
      ),
    );
  }
}

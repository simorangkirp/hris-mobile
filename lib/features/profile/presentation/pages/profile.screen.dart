import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/common.widgets.dart';
import '../widgets/menus.component.dart';
import '../widgets/profile.info.dart';
import '../widgets/timesheet.dart';

@RoutePage()
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
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
            buildProfileInfo(),
            SizedBox(height: 12.h),
            buildTimeSheet(),
            SizedBox(height: 12.h),
            buildListMenu(),
          ],
        ),
      ),
    );
  }
}

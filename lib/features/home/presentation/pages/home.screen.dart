import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/themes/colors.dart';
import '../../../../core/utils/common.widgets.dart';
import '../widgets/active.task.dart';
import '../widgets/announcement.component.dart';
import '../widgets/appbar.dart';
import '../widgets/features.component.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ScrollController sCtrl = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      endDrawer: const AppNavigationDrawer(),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: NotificationListener<OverscrollIndicatorNotification>(
                onNotification: (OverscrollIndicatorNotification overScrl) {
                  overScrl.disallowIndicator();
                  return false;
                },
                child: SingleChildScrollView(
                  controller: sCtrl,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(height: 12.h),
                        faturesComponent(),
                        Divider(
                          color: appBgBlack.withOpacity(0.3),
                          height: 32.h,
                        ),
                        const HomePengumumanWidget(),
                        Divider(
                          color: appBgBlack.withOpacity(0.3),
                          height: 32.h,
                        ),
                        const HomeTaskWidget(),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

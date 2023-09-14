import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:owl_hris/config/routes/app.routes.dart';
import 'package:owl_hris/config/themes/colors.dart';

import '../../../../core/utils/common.widgets.dart';
import '../widgets/datetime.component.dart';

@RoutePage()
class AbsentScreen extends StatefulWidget {
  const AbsentScreen({super.key});

  @override
  State<AbsentScreen> createState() => _AbsentScreenState();
}

class _AbsentScreenState extends State<AbsentScreen> {
  @override
  Widget build(BuildContext context) {
    buildAppBar() {
      return AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(120),
              child: SizedBox(
                height: 42.w,
                width: 42.w,
                child: Image.asset(
                  'assets/image/serenia-0363.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: 12.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Welcome Back!',
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  'Patrick S',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }

    return Scaffold(
      appBar: buildAppBar(),
      endDrawer: const AppNavigationDrawer(),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 24.h),
            const ClockWidget(),
            SizedBox(height: 32.h),
            Material(
              elevation: 48,
              borderRadius: BorderRadius.circular(320),
              shadowColor: Colors.deepOrange,
              child: GestureDetector(
                onTap: () {
                  context.router.push(const ClockInRoute());
                },
                child: Container(
                  width: 0.62.sw,
                  height: 0.62.sw,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomRight,
                      colors: [
                        Colors.deepOrange,
                        Colors.deepOrange,
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
                          'Absen Masuk',
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
            SizedBox(height: 72.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
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
                        SizedBox(height: 8.h),
                        Text(
                          'Ijin tidak hadir',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    Column(
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
                          'Lihat history',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

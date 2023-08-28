import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:owl_hris/lib.dart';

@RoutePage()
class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Settings'),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: [
              SizedBox(height: 24.h),
              Material(
                elevation: 4,
                borderRadius: BorderRadius.circular(16),
                child: Container(
                  decoration: BoxDecoration(
                    color: appBgBlack.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  padding:
                      EdgeInsets.symmetric(horizontal: 8.w, vertical: 16.h),
                  child: Row(
                    children: [
                      Expanded(
                        child: SvgPicture.asset(ConstIconPath.passLock),
                      ),
                      SizedBox(width: 12.w),
                      Expanded(
                        flex: 6,
                        child: Text(
                          'Password',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 12.h),
              Material(
                elevation: 4,
                borderRadius: BorderRadius.circular(16),
                child: Container(
                  decoration: BoxDecoration(
                    color: appBgBlack.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  padding:
                      EdgeInsets.symmetric(horizontal: 8.w, vertical: 16.h),
                  child: Row(
                    children: [
                      Expanded(
                        child: SvgPicture.asset(ConstIconPath.pinLock),
                      ),
                      SizedBox(width: 12.w),
                      Expanded(
                        flex: 6,
                        child: Text(
                          'PIN',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 12.h),
              Material(
                elevation: 4,
                borderRadius: BorderRadius.circular(16),
                child: Container(
                  decoration: BoxDecoration(
                    color: appBgBlack.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  padding:
                      EdgeInsets.symmetric(horizontal: 8.w, vertical: 16.h),
                  child: Row(
                    children: [
                      Expanded(
                        child: SvgPicture.asset(ConstIconPath.textIcon),
                      ),
                      SizedBox(width: 12.w),
                      Expanded(
                        flex: 6,
                        child: Text(
                          'Language',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 12.h),
              Material(
                elevation: 4,
                borderRadius: BorderRadius.circular(16),
                child: Container(
                  decoration: BoxDecoration(
                    color: appBgBlack.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  padding:
                      EdgeInsets.symmetric(horizontal: 8.w, vertical: 16.h),
                  child: Row(
                    children: [
                      Expanded(
                        child: Icon(Icons.wifi),
                      ),
                      SizedBox(width: 12.w),
                      Expanded(
                        flex: 6,
                        child: Text(
                          'Dark mode',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 12.h),
              Material(
                elevation: 4,
                borderRadius: BorderRadius.circular(16),
                child: Container(
                  decoration: BoxDecoration(
                    color: appBgBlack.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  padding:
                      EdgeInsets.symmetric(horizontal: 8.w, vertical: 16.h),
                  child: Row(
                    children: [
                      Expanded(
                        child: SvgPicture.asset(ConstIconPath.notification),
                      ),
                      SizedBox(width: 12.w),
                      Expanded(
                        flex: 6,
                        child: Text(
                          'Notifications',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

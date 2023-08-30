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
  bool expandLang = false;
  bool isDarkmode = false;
  String ddVal = 'id';
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
                child: GestureDetector(
                  onTap: () {
                    context.router.push(const PasswordRoute());
                  },
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
              ),
              SizedBox(height: 12.h),
              Material(
                elevation: 4,
                borderRadius: BorderRadius.circular(16),
                child: GestureDetector(
                  onTap: () {
                    context.router.push(const PINRoute());
                  },
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
              ),
              SizedBox(height: 12.h),
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        expandLang = !expandLang;
                      });
                    },
                    child: Container(
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
                  ExpandableWidget(
                    expand: expandLang,
                    child: SizedBox(
                      width: double.maxFinite,
                      // color: appBgBlack.withOpacity(0.2),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Select language',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 12.sp,
                            ),
                          ),
                          const Spacer(),
                          DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              value: ddVal,
                              items: const [
                                DropdownMenuItem<String>(
                                  value: 'en',
                                  child: Text(
                                    'English',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                                DropdownMenuItem<String>(
                                  value: 'id',
                                  child: Text(
                                    'Indonesia',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ],
                              onChanged: (value) {
                                setState(() {
                                  ddVal = value ?? "";
                                });
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12.h),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Row(
                  children: [
                    const Expanded(
                      child: Icon(Icons.dark_mode_rounded),
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
                    SizedBox(width: 12.w),
                    Switch(
                      value: isDarkmode,
                      onChanged: (value) {
                        setState(() {
                          isDarkmode = !isDarkmode;
                        });
                      },
                    )
                  ],
                ),
              ),
              SizedBox(height: 12.h),
              Material(
                elevation: 4,
                borderRadius: BorderRadius.circular(16),
                child: GestureDetector(
                  onTap: () {
                    context.router.push(const NotificationRoute());
                  },
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}

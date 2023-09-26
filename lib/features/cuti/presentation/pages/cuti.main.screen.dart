import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:owl_hris/config/config.dart';
import 'package:owl_hris/core/constants/constants.dart';

@RoutePage()
class PaidLeaveMainScreen extends StatefulWidget {
  const PaidLeaveMainScreen({super.key});

  @override
  State<PaidLeaveMainScreen> createState() => _PaidLeaveMainScreenState();
}

class _PaidLeaveMainScreenState extends State<PaidLeaveMainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: Constant.appPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Material(
              elevation: 8,
              borderRadius: BorderRadius.circular(8),
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding:
                        EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: IntrinsicHeight(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Period',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12.sp,
                                      ),
                                    ),
                                    Text(
                                      '2023',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12.sp,
                                        color: appBgBlack.withOpacity(0.6),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              child: IntrinsicHeight(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Annual leave',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12.sp,
                                      ),
                                    ),
                                    Text(
                                      '15',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12.sp,
                                        color: appBgBlack.withOpacity(0.6),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 4.h),
                        Row(
                          children: [
                            Expanded(
                              child: IntrinsicHeight(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Available',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12.sp,
                                      ),
                                    ),
                                    Text(
                                      '0',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12.sp,
                                        color: appBgBlack.withOpacity(0.6),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              child: IntrinsicHeight(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Taken',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12.sp,
                                      ),
                                    ),
                                    Text(
                                      '1',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12.sp,
                                        color: appBgBlack.withOpacity(0.6),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    right: -2.w,
                    bottom: -8.h,
                    child: SizedBox(
                      width: 78.h,
                      height: 78.h,
                      child: SvgPicture.asset(
                        Constant.owlBird,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.h),
            Text(
              'Recent',
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
            ),

          ],
        ),
      ),
    );
  }
}

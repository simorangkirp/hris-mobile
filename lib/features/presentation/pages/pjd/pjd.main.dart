import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:owl_hris/config/config.dart';
import 'package:owl_hris/core/constants/constants.dart';

@RoutePage()
class PJDMainScreen extends StatefulWidget {
  const PJDMainScreen({super.key});

  @override
  State<PJDMainScreen> createState() => _PJDMainScreenState();
}

class _PJDMainScreenState extends State<PJDMainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: Constant.appPadding,
        child: ListView(
          children: [
            SizedBox(height: 18.h),
            Text(
              'PJD Aktif',
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 12.h),
            Material(
              elevation: 2,
              borderRadius: BorderRadius.circular(8),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 8.h),
                    IntrinsicHeight(
                      child: Row(
                        children: [
                          const VerticalDivider(
                            color: appBtnBlue,
                            thickness: 2,
                          ),
                          Text(
                            'Jakarta',
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward,
                            size: 12.h,
                          ),
                          Text(
                            'Medan',
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Row(
                      children: [
                        Text(
                          'No Transaksi',
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: appDivider,
                          ),
                        ),
                        SizedBox(width: 4.w),
                        Text(
                          '12345577890754',
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 4.h),
                    Container(
                      color: appLightGrey.withOpacity(0.8),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 8.w, vertical: 8.h),
                        child: Column(
                          children: [
                            IntrinsicHeight(
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Jenis',
                                          style: TextStyle(
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w400,
                                            color: appDivider,
                                          ),
                                        ),
                                        SizedBox(height: 2.h),
                                        Text(
                                          'Luar Kota',
                                          style: TextStyle(
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w500,
                                            color: appDivider,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'PT Tujuan',
                                          style: TextStyle(
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w400,
                                            color: appDivider,
                                          ),
                                        ),
                                        SizedBox(height: 2.h),
                                        Text(
                                          'PT ALAM',
                                          style: TextStyle(
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w500,
                                            color: appDivider,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 4.h),
                            IntrinsicHeight(
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Tanggal',
                                          style: TextStyle(
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w400,
                                            color: appDivider,
                                          ),
                                        ),
                                        SizedBox(height: 2.h),
                                        Text(
                                          '11-16 Nov 2023',
                                          style: TextStyle(
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w500,
                                            color: appDivider,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Tanggal Pengajuan',
                                          style: TextStyle(
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w400,
                                            color: appDivider,
                                          ),
                                        ),
                                        SizedBox(height: 2.h),
                                        Text(
                                          '12 Oct 2023',
                                          style: TextStyle(
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w500,
                                            color: appDivider,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 12.h),
                  ],
                ),
              ),
            ),
            SizedBox(height: 12.h),
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
                            // displayMonthPicker(context);
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
                            'Periode',
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: appBgBlack,
                            ),
                          ),
                          Text(
                            '',
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
                        // plafond != null
                        context.router.push(const PJDFormRoute());
                        //     : {};
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color:
                              // plafond != null
                              // ? appNotifCutIcn.withOpacity(0.8)
                              appNotifCutIcn.withOpacity(0.8),
                          // : appDivider.withOpacity(0.8),
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
          ],
        ),
      ),
    );
  }
}

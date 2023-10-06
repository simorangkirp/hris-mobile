import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../lib.dart';

Widget buildApprvlItem(BuildContext ctx, List<ApprovalCountEntity>? model,
    Function(String val) onTap) {
  bool cuti = false;
  bool pjd = false;
  bool absen = false;
  bool klaim = false;
  if (model != null) {
    for (var e in model) {
      if (e.jenis == "ABSEN" && int.parse(e.jumlah ?? "0") > 0) {
        absen = true;
      }
      if (e.jenis == "CUTI" && int.parse(e.jumlah ?? "0") > 0) {
        cuti = true;
      }
      if (e.jenis == "REIMBURSEMENT" && int.parse(e.jumlah ?? "0") > 0) {
        klaim = true;
      }
      if (e.jenis == "PJD" && int.parse(e.jumlah ?? "0") > 0) {
        pjd = true;
      }
    }
  }
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'Approval',
        style: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w900,
        ),
      ),
      SizedBox(height: 12.h),
      IntrinsicHeight(
        child: Row(
          children: [
            Expanded(
              child: InkWell(
                onTap: () {
                  // if (absen) {
                  onTap('ABSEN');
                  // }
                },
                child: Stack(
                  children: [
                    Positioned(
                      top: 4.w,
                      right: 4.w,
                      child: Visibility(
                        visible: absen,
                        child: Container(
                          height: 12.w,
                          width: 12.w,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: appBtnBlue,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: appBgBlack.withOpacity(0.4),
                        ),
                      ),
                      padding:
                          EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SvgPicture.asset(ConstIconPath.clock),
                          SizedBox(height: 8.h),
                          Text(
                            'Absent',
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Stack(
                children: [
                  Positioned(
                    top: 4.w,
                    right: 4.w,
                    child: Visibility(
                      visible: cuti,
                      child: Container(
                        height: 12.w,
                        width: 12.w,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: appBtnBlue,
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      // if (cuti) {
                      onTap('CUTI');
                      // }
                    },
                    child: Container(
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: appBgBlack.withOpacity(0.4),
                        ),
                      ),
                      padding:
                          EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SvgPicture.asset(ConstIconPath.timeOff),
                          SizedBox(height: 8.h),
                          Text(
                            'Paid leave',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Stack(
                children: [
                  Positioned(
                    top: 4.w,
                    right: 4.w,
                    child: Visibility(
                      visible: klaim,
                      child: Container(
                        height: 12.w,
                        width: 12.w,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: appBtnBlue,
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      // if (klaim) {
                      onTap('REIMBURSEMENT');
                      // }
                    },
                    child: Container(
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: appBgBlack.withOpacity(0.4),
                        ),
                      ),
                      padding:
                          EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SvgPicture.asset(ConstIconPath.receipt),
                          SizedBox(height: 8.h),
                          Text(
                            'Claim',
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
                child: Stack(
              children: [
                Positioned(
                  top: 4.w,
                  right: 4.w,
                  child: Visibility(
                    visible: pjd,
                    child: Container(
                      height: 12.w,
                      width: 12.w,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: appBtnBlue,
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    // if (pjd) {
                    onTap('PJD');
                    // }
                  },
                  child: Container(
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: appBgBlack.withOpacity(0.4),
                      ),
                    ),
                    padding:
                        EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SvgPicture.asset(ConstIconPath.plane),
                        SizedBox(height: 8.h),
                        Text(
                          'PJD',
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )),
          ],
        ),
      ),
    ],
  );
}

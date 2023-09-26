import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:owl_hris/lib.dart';

Widget buildTimeSheet(int? ctr) {
  return Container(
    decoration: BoxDecoration(
      border: Border.all(
        color: appIconMenuTitle.withOpacity(0.1),
        width: 1,
      ),
      color: appNotifCutIcn.withOpacity(0.1),
      borderRadius: BorderRadius.circular(2),
    ),
    width: double.maxFinite,
    height: 64.h,
    child: Row(
      children: [
        Expanded(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "Time Off",
              style: TextStyle(
                fontWeight: FontWeight.w400,
                color: appBgBlack.withOpacity(0.6),
                fontSize: 12.sp,
              ),
            ),
            Text(
              // plafond.diambil ?? "0",
              "0",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: appBgBlack,
                fontSize: 16.sp,
              ),
            ),
          ],
        )),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Attendance",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: appBgBlack.withOpacity(0.6),
                  fontSize: 12.sp,
                ),
              ),
              Text(
                // ctr.toString(),
                (ctr ?? 0).toString(),
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: appBgBlack,
                  fontSize: 16.sp,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Overtime",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: appBgBlack.withOpacity(0.6),
                  fontSize: 12.sp,
                ),
              ),
              Text(
                "0",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: appBgBlack,
                  fontSize: 16.sp,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

buildTimeSheetSkel() {
  return CommonShimmer(
    isLoading: true,
    child: Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: appIconMenuTitle.withOpacity(0.1),
          width: 1,
        ),
        color: appBgBlack.withOpacity(0.2),
        borderRadius: BorderRadius.circular(2),
      ),
      width: double.maxFinite,
      height: 64.h,
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 18.h,
                  width: double.maxFinite,
                  color: appBgBlack.withOpacity(0.5),
                ),
                Container(
                  height: 24.h,
                  width: 24.h,
                  color: appBgBlack.withOpacity(0.5),
                ),
              ],
            ),
          ),
          SizedBox(width: 4.w),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 18.h,
                  width: double.maxFinite,
                  color: appBgBlack.withOpacity(0.5),
                ),
                Container(
                  height: 24.h,
                  width: 24.h,
                  color: appBgBlack.withOpacity(0.5),
                ),
              ],
            ),
          ),
          SizedBox(width: 4.w),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 18.h,
                  width: double.maxFinite,
                  color: appBgBlack.withOpacity(0.5),
                ),
                Container(
                  height: 24.h,
                  width: 24.h,
                  color: appBgBlack.withOpacity(0.5),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

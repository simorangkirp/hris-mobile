import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/themes/colors.dart';

Widget buildTimeSheet() {
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
                '0',
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

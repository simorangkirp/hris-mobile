import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../lib.dart';

Widget noDataWidget() {
  return Padding(
    padding: EdgeInsets.only(bottom: 24.h),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: appDivider.withOpacity(0.6),
      ),
      width: double.maxFinite,
      height: double.maxFinite,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            ConstIconPath.fileCross,
            height: 52.h,
            width: 48.h,
            colorFilter: const ColorFilter.mode(appBgWhite, BlendMode.srcIn),
          ),
          SizedBox(height: 12.h),
          Text(
            'No data found.',
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: appBgWhite,
            ),
          ),
        ],
      ),
    ),
  );
}
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../config/themes/colors.dart';

Widget buildListMenu() {
  return Column(
    children: [
      Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: appIconMenuTitle.withOpacity(0.1),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(2),
        ),
        width: double.maxFinite,
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: appImperialRed.withOpacity(0.2),
              ),
              padding: EdgeInsets.all(8.w),
              child: SvgPicture.asset(
                'assets/icons/profile.svg',
                fit: BoxFit.contain,
                height: 12.w,
                colorFilter: const ColorFilter.mode(
                  appImperialRed,
                  BlendMode.srcIn,
                ),
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Text(
                "My Personal Info",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: appBgBlack,
                  fontSize: 14.sp,
                ),
              ),
            ),
            SvgPicture.asset(
              'assets/icons/chevron-right.svg',
              fit: BoxFit.contain,
              height: 8.w,
            ),
          ],
        ),
      ),
      SizedBox(height: 12.h),
      Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: appIconMenuTitle.withOpacity(0.1),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(2),
        ),
        width: double.maxFinite,
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: appNotifAbsIcn.withOpacity(0.2),
              ),
              padding: EdgeInsets.all(8.w),
              child: SvgPicture.asset(
                'assets/icons/setting-cogs.svg',
                fit: BoxFit.contain,
                height: 12.w,
                colorFilter: const ColorFilter.mode(
                  appNotifAbsIcn,
                  BlendMode.srcIn,
                ),
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Text(
                "Settings",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: appBgBlack,
                  fontSize: 14.sp,
                ),
              ),
            ),
            SvgPicture.asset(
              'assets/icons/chevron-right.svg',
              fit: BoxFit.contain,
              height: 8.w,
            ),
          ],
        ),
      ),
      SizedBox(height: 12.h),
      Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: appIconMenuTitle.withOpacity(0.1),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(2),
        ),
        width: double.maxFinite,
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: appNotifCutIcn.withOpacity(0.2),
              ),
              padding: EdgeInsets.all(8.w),
              child: SvgPicture.asset(
                'assets/icons/utils.svg',
                fit: BoxFit.contain,
                height: 12.w,
                colorFilter: const ColorFilter.mode(
                  appNotifCutIcn,
                  BlendMode.srcIn,
                ),
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Text(
                "Others",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: appBgBlack,
                  fontSize: 14.sp,
                ),
              ),
            ),
            SvgPicture.asset(
              'assets/icons/chevron-right.svg',
              fit: BoxFit.contain,
              height: 8.w,
            ),
          ],
        ),
      ),
    ],
  );
}

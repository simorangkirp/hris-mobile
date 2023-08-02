import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/themes/colors.dart';

Widget buildProfileInfo() {
  return Stack(
    clipBehavior: Clip.none,
    children: [
      Container(
        decoration: BoxDecoration(
          color: appText3,
          borderRadius: BorderRadiusDirectional.circular(8),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 1.sw,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(height: 42.h),
                  Text(
                    "Patrick Simorangkir",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: appBgBlack,
                      fontSize: 18.sp,
                    ),
                    maxLines: 2,
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    "Staff Mobile Programmer",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: appBgBlack.withOpacity(0.6),
                      fontSize: 12.sp,
                    ),
                  ),
                  SizedBox(height: 12.h),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: appText5,
                    ),
                    width: double.maxFinite,
                    padding: EdgeInsets.symmetric(vertical: 12.h),
                    child: Center(
                      child: Text(
                        "OWL Head Office",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: appBgWhite,
                          fontSize: 16.sp,
                        ),
                        maxLines: 2,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
          ],
        ),
      ),
      // avaImg == null
      //     ? Positioned(
      //         top: -72,
      //         right: 50,
      //         left: 50,
      //         child: Container(
      //           decoration: BoxDecoration(
      //             border: Border.all(color: appBgBlack, width: 3),
      //             shape: BoxShape.circle,
      //             color: dsplyImg ?? appBgBlack,
      //           ),
      //           padding: const EdgeInsets.all(26),
      //           child: Text(
      //             dsplyNm ?? "",
      //             style: TextStyle(
      //               fontWeight: FontWeight.w600,
      //               fontSize: context.scaleFont(18),
      //               color: appBgWhite,
      //             ),
      //           ),
      //         ),
      //       )
      // :
      Positioned(
        top: -72,
        right: 50,
        left: 50,
        child: Container(
          width: 112.w,
          height: 112.w,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: const DecorationImage(
              image: AssetImage(
                'assets/image/serenia-0363.jpg',
              ),
              fit: BoxFit.scaleDown,
            ),
            border: Border.all(
              color: appBgWhite,
              width: 8,
              strokeAlign: BorderSide.strokeAlignOutside,
            ),
          ),
        ),
      ),
    ],
  );
}

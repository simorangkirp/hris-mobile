import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:owl_hris/lib.dart';

Widget buildProfileInfo(EntityProfile? mod) {
  Uint8List? byteImg;
  if (mod?.photo != null) {
    byteImg = const Base64Decoder().convert(mod!.photo!);
  }
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
                    mod?.namakaryawan ?? "-",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: appBgBlack,
                      fontSize: 18.sp,
                    ),
                    maxLines: 2,
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    mod?.namajabatan ?? '-',
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
                        mod?.lokasitugas ?? 'OWL Head Office',
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
      Positioned(
        top: -72,
        right: 50,
        left: 50,
        child: byteImg != null
            ? Container(
                width: 112.w,
                height: 112.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: MemoryImage(byteImg),
                    fit: BoxFit.contain,
                  ),
                  border: Border.all(
                    color: appBgWhite,
                    width: 8,
                    strokeAlign: BorderSide.strokeAlignOutside,
                  ),
                ),
              )
            : Container(
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

buildProfileInfoSkel() {
  return Stack(
    clipBehavior: Clip.none,
    children: [
      CommonShimmer(
        isLoading: true,
        child: Container(
          decoration: BoxDecoration(
            color: appBgBlack.withOpacity(0.2),
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
                    SizedBox(height: 56.h),
                    Container(
                      height: 24.h,
                      width: 112.sw,
                      color: appBgBlack.withOpacity(0.5),
                    ),
                    SizedBox(height: 4.h),
                    Container(
                      height: 16.h,
                      width: 112.sw,
                      color: appBgBlack.withOpacity(0.5),
                    ),
                    SizedBox(height: 12.h),
                    Container(
                      height: 32.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: appText5,
                      ),
                      width: double.maxFinite,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
      Positioned(
        top: -72,
        right: 50,
        left: 50,
        child: CommonShimmer(
          isLoading: true,
          child: Container(
            height: 112.w,
            width: 112.w,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: appBgBlack,
            ),
          ),
        ),
      ),
    ],
  );
}

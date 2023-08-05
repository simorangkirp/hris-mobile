import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../config/themes/colors.dart';
import '../../../../core/constants/constants.dart';
import '../../data/model/features.model.dart';

List<FeaturesModel> collection = [
  FeaturesModel(
    iconPath: ConstIconPath.file,
    id: 'Daftar\nAbsensi',
    en: 'Absent\nList',
  ),
  FeaturesModel(
    iconPath: ConstIconPath.file,
    id: 'Daftar\nCuti',
    en: 'Paid Leave\nList',
  ),
  FeaturesModel(
    iconPath: ConstIconPath.file,
    id: 'Daftar\nPJD',
    en: 'Office Trip\nList',
  ),
  FeaturesModel(
    iconPath: ConstIconPath.clock,
    id: 'Ajukan\nAbsen',
    en: 'Absent',
  ),
  FeaturesModel(
    iconPath: ConstIconPath.timeOff,
    id: 'Ajukan\nCuti',
    en: 'Paid\nLeave',
  ),
  FeaturesModel(
    iconPath: ConstIconPath.plane,
    id: 'Ajukan\nPJD',
    en: 'Office\nTrip',
  ),
  FeaturesModel(
    iconPath: ConstIconPath.event,
    id: 'Acara',
    en: 'Events',
  ),
  FeaturesModel(
    iconPath: ConstIconPath.receipt,
    id: 'Klaim',
    en: 'Claim',
  ),
];

faturesComponent() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisSize: MainAxisSize.min,
    children: [
      Text(
        'Features',
        style: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w900,
        ),
      ),
      SizedBox(height: 12.h),
      GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: collection.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          childAspectRatio: 4 / 5,
          mainAxisSpacing: 12.w,
          crossAxisSpacing: 12.h,
        ),
        itemBuilder: (context, index) {
          var item = collection[index];
          return SizedBox(
            height: 72.h,
            width: 32.w,
            // padding:
            //     EdgeInsets.symmetric(horizontal: 4.w, vertical: 8.h),
            // color: Colors.red,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: appButtonBlue.withOpacity(0.3),
                  ),
                  height: 32.h,
                  width: 32.h,
                  child: SvgPicture.asset(
                    item.iconPath!,
                    fit: BoxFit.scaleDown,
                    colorFilter:
                        const ColorFilter.mode(appBgBlack, BlendMode.srcIn),
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  item.id!,
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          );
        },
      )
    ],
  );
}
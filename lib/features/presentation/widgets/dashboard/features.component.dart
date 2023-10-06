import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:owl_hris/lib.dart';

List<FeaturesModel> collection = [
  FeaturesModel(
    iconPath: ConstIconPath.file,
    id: 'Daftar\nAbsensi',
    en: 'Absent\nList',
    route: 'AbsentList',
  ),
  FeaturesModel(
    iconPath: ConstIconPath.file,
    id: 'Daftar\nCuti',
    en: 'Paid Leave\nList',
    route: 'PaidLeaveList',
  ),
  FeaturesModel(
    iconPath: ConstIconPath.file,
    id: 'Daftar\nPJD',
    en: 'Office Trip\nList',
    route: 'PJDList',
  ),
  FeaturesModel(
    iconPath: ConstIconPath.clock,
    id: 'Ajukan\nAbsen',
    en: 'Absent',
    route: 'Absent',
  ),
  FeaturesModel(
    iconPath: ConstIconPath.timeOff,
    id: 'Ajukan\nCuti',
    en: 'Paid\nLeave',
    route: 'PaidLeave',
  ),
  FeaturesModel(
    iconPath: ConstIconPath.plane,
    id: 'Ajukan\nPJD',
    en: 'Office\nTrip',
    route: 'PJD',
  ),
  FeaturesModel(
    iconPath: ConstIconPath.event,
    id: 'Acara',
    en: 'Events',
    route: 'Events',
  ),
  FeaturesModel(
    iconPath: ConstIconPath.receipt,
    id: 'Klaim',
    en: 'Claim',
    route: 'Claim',
  ),
];

faturesComponent(BuildContext ctx) {
  onRoute(String menuCd) {
    switch (menuCd) {
      case "AbsentList":
        ctx.router.push(const AbsentHistoryRoute());
        break;
      case "PaidLeaveList":
        ctx.router.push(const PaidLeaveMainRoute());
        break;
      case "PJDList":
        // ctx.router.push();
        break;
      case "Absent":
        ctx.router.push(const AbsentRoute());
        break;
      case "PaidLeave":
        ctx.router.push(PaidLeaveFormRoute());
        break;
      case "PJD":
        // ctx.router.push();
        break;
      case "Events":
        // ctx.router.push();
        break;
      case "Claim":
        // ctx.router.push();
        break;
    }
  }

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
          mainAxisSpacing: 8.w,
          crossAxisSpacing: 8.h,
        ),
        itemBuilder: (context, index) {
          var item = collection[index];
          return SizedBox(
            height: 78.h,
            width: 32.w,
            // padding:
            //     EdgeInsets.symmetric(horizontal: 4.w, vertical: 8.h),
            // color: Colors.red,
            child: InkWell(
              onTap: () => onRoute(item.route ?? ""),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: appNotifCutIcn.withOpacity(0.8),
                    ),
                    height: 38.h,
                    width: 38.h,
                    child: SvgPicture.asset(
                      item.iconPath!,
                      fit: BoxFit.scaleDown,
                      colorFilter:
                          const ColorFilter.mode(appBgWhite, BlendMode.srcIn),
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
            ),
          );
        },
      )
    ],
  );
}

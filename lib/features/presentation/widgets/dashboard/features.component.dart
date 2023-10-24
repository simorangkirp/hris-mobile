import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:owl_hris/lib.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

faturesComponent(BuildContext ctx, ThemeData theme) {
  final l10n = AppLocalizations.of(ctx);

  List<FeaturesModel> collection = [
    FeaturesModel(
      iconPath: ConstIconPath.file,
      text: l10n.absentList,
      route: 'AbsentList',
    ),
    FeaturesModel(
      iconPath: ConstIconPath.file,
      text: l10n.paidLeaveList,
      route: 'PaidLeaveList',
    ),
    FeaturesModel(
      iconPath: ConstIconPath.file,
      text: l10n.listPJD,
      route: 'PJDList',
    ),
    FeaturesModel(
      iconPath: ConstIconPath.clock,
      text: l10n.submitAbsent,
      route: 'Absent',
    ),
    FeaturesModel(
      iconPath: ConstIconPath.timeOff,
      text: l10n.submitPaidLeave,
      route: 'PaidLeave',
    ),
    FeaturesModel(
      iconPath: ConstIconPath.plane,
      text: l10n.submitPJD,
      route: 'PJD',
    ),
    FeaturesModel(
      iconPath: ConstIconPath.event,
      text: l10n.event,
      route: 'Events',
    ),
    FeaturesModel(
      iconPath: ConstIconPath.receipt,
      text: l10n.claim,
      route: 'Claim',
    ),
  ];

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
        ctx.router.push(const PJDMainRoute());
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
        l10n.features,
        style: theme.textTheme.displayMedium,
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
                  Material(
                    elevation: 4,
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        gradient: LinearGradient(
                          begin: Alignment.bottomRight,
                          end: Alignment.topLeft,
                          colors: [
                            appBtnBlue.withOpacity(0.3),
                            appNotifCutIcn.withOpacity(0.8),
                          ],
                          stops: const [0, 0.7],
                        ),
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
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    item.text!,
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

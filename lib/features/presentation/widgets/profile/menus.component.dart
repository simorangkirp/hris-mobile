import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:owl_hris/lib.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Widget buildListMenu(BuildContext ctx) {
  final l10n = AppLocalizations.of(ctx);

  return Column(
    children: [
      GestureDetector(
        onTap: () {
          ctx.router.push(const MyPersonalInfoRoute());
        },
        child: Container(
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
                  l10n.myPersonalInfo,
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
      ),
      SizedBox(height: 12.h),
      GestureDetector(
        onTap: () {
          ctx.router.push(const SettingRoute());
        },
        child: Container(
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
                  l10n.setting,
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
      ),
      // SizedBox(height: 12.h),
      // Container(
      //   decoration: BoxDecoration(
      //     border: Border.all(
      //       color: appIconMenuTitle.withOpacity(0.1),
      //       width: 1,
      //     ),
      //     borderRadius: BorderRadius.circular(2),
      //   ),
      //   width: double.maxFinite,
      //   padding: const EdgeInsets.all(12),
      //   child: Row(
      //     children: [
      //       Container(
      //         decoration: BoxDecoration(
      //           shape: BoxShape.circle,
      //           color: appNotifCutIcn.withOpacity(0.2),
      //         ),
      //         padding: EdgeInsets.all(8.w),
      //         child: SvgPicture.asset(
      //           'assets/icons/utils.svg',
      //           fit: BoxFit.contain,
      //           height: 12.w,
      //           colorFilter: const ColorFilter.mode(
      //             appNotifCutIcn,
      //             BlendMode.srcIn,
      //           ),
      //         ),
      //       ),
      //       SizedBox(width: 12.w),
      //       Expanded(
      //         child: Text(
      //           "Others",
      //           style: TextStyle(
      //             fontWeight: FontWeight.w600,
      //             color: appBgBlack,
      //             fontSize: 14.sp,
      //           ),
      //         ),
      //       ),
      //       SvgPicture.asset(
      //         'assets/icons/chevron-right.svg',
      //         fit: BoxFit.contain,
      //         height: 8.w,
      //       ),
      //     ],
      //   ),
      // ),
    ],
  );
}

Widget buildListMenuSkel() {
  return Column(
    children: [
      CommonShimmer(
        isLoading: true,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: appIconMenuTitle.withOpacity(0.1),
              width: 1,
            ),
            borderRadius: BorderRadius.circular(2),
            color: appBgBlack.withOpacity(0.5),
          ),
          width: double.maxFinite,
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              Container(
                height: 32.w,
                width: 32.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: appBgBlack.withOpacity(0.5),
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Container(
                  height: 14.h,
                  color: appBgBlack.withOpacity(0.5),
                ),
              ),
              SizedBox(width: 12.w),
              SvgPicture.asset(
                'assets/icons/chevron-right.svg',
                fit: BoxFit.contain,
                height: 8.w,
              ),
            ],
          ),
        ),
      ),
      SizedBox(height: 12.h),
      CommonShimmer(
        isLoading: true,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: appIconMenuTitle.withOpacity(0.1),
              width: 1,
            ),
            color: appBgBlack.withOpacity(0.5),
            borderRadius: BorderRadius.circular(2),
          ),
          width: double.maxFinite,
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              Container(
                width: 32.w,
                height: 32.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: appBgBlack.withOpacity(0.5),
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Container(
                  height: 14.h,
                  color: appBgBlack.withOpacity(0.5),
                ),
              ),
              SizedBox(width: 12.w),
              SvgPicture.asset(
                'assets/icons/chevron-right.svg',
                fit: BoxFit.contain,
                height: 8.w,
              ),
            ],
          ),
        ),
      ),
      // SizedBox(height: 12.h),
      // CommonShimmer(
      //   isLoading: true,
      //   child: Container(
      //     decoration: BoxDecoration(
      //       border: Border.all(
      //         color: appIconMenuTitle.withOpacity(0.1),
      //         width: 1,
      //       ),
      //       color: appBgBlack.withOpacity(0.5),
      //       borderRadius: BorderRadius.circular(2),
      //     ),
      //     width: double.maxFinite,
      //     padding: const EdgeInsets.all(12),
      //     child: Row(
      //       children: [
      //         Container(
      //           width: 32.w,
      //           height: 32.w,
      //           decoration: BoxDecoration(
      //             shape: BoxShape.circle,
      //             color: appBgBlack.withOpacity(0.5),
      //           ),
      //         ),
      //         SizedBox(width: 12.w),
      //         Expanded(
      //           child: Container(
      //             height: 14.h,
      //             color: appBgBlack.withOpacity(0.5),
      //           ),
      //         ),
      //         SizedBox(width: 12.w),
      //         SvgPicture.asset(
      //           'assets/icons/chevron-right.svg',
      //           fit: BoxFit.contain,
      //           height: 8.w,
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
    ],
  );
}

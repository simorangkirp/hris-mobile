import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:owl_hris/lib.dart';

Widget emCtcInfo(BuildContext context, EmerContactEntity? model) {
  ScrollController ctrl = ScrollController();
  final l10n = AppLocalizations.of(context)!;
  buildEmCtcItem(EmerContactDetails data) {
    return Column(
      children: [
        IntrinsicHeight(
          child: Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      l10n.name,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12.sp,
                        color: appBgBlack.withOpacity(0.7),
                      ),
                    ),
                    Text(
                      data.nama ?? "-",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 2.w),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      l10n.famRelative,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12.sp,
                        color: appBgBlack.withOpacity(0.7),
                      ),
                    ),
                    Text(
                      data.hubungankeluarga ?? "-",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 12.h),
        IntrinsicHeight(
          child: Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      l10n.telephone,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12.sp,
                        color: appBgBlack.withOpacity(0.7),
                      ),
                    ),
                    Text(
                      data.telp ?? "-",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 2.w),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      l10n.personalEmail,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12.sp,
                        color: appBgBlack.withOpacity(0.7),
                      ),
                    ),
                    Text(
                      data.email ?? "-",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 12.h),
      ],
    );
  }

  return SingleChildScrollView(
    controller: ctrl,
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        children: [
          SizedBox(height: 4.h),
          Text(
            l10n.emerCtc,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 18.sp,
              color: appBgBlack.withOpacity(0.7),
            ),
          ),
          model != null
              ? model.dataDetails!.isNotEmpty
                  ? ListView.builder(
                      controller: ctrl,
                      shrinkWrap: true,
                      itemCount: model.dataDetails!.length,
                      itemBuilder: (context, index) {
                        var item = model.dataDetails![index];
                        return Padding(
                          padding: EdgeInsets.symmetric(vertical: 12.h),
                          child: buildEmCtcItem(item),
                        );
                      },
                    )
                  : const SizedBox()
              : const SizedBox(),
        ],
      ),
    ),
  );
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../../lib.dart';

Widget historyList(BuildContext context, List<ApprovalDetail>? detail,
    Function(ApprovalDetail) ontapItems) {
  ScrollController ctrl = ScrollController();
  final l10n = AppLocalizations.of(context);
  final theme = Theme.of(context);

  return NotificationListener<OverscrollIndicatorNotification>(
    onNotification: (OverscrollIndicatorNotification overScrl) {
      overScrl.disallowIndicator();
      return false;
    },
    child: SingleChildScrollView(
      controller: ctrl,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 12.h),
            Text(
              l10n.history,
              style: theme.textTheme.displayLarge,
            ),
            SizedBox(height: 8.h),
            detail != null
                ? ListView.builder(
                    controller: ctrl,
                    shrinkWrap: true,
                    itemCount: detail.length,
                    itemBuilder: (context, index) {
                      var data = detail[index];
                      return Padding(
                        padding: EdgeInsets.only(bottom: 12.h),
                        child: Material(
                          elevation: 8,
                          borderRadius: BorderRadius.circular(4),
                          shadowColor: data.status == "0"
                              ? appCutiBg
                              : data.status == "1"
                                  ? appNotifAbsIcn
                                  : data.status == "2"
                                      ? appImperialRed
                                      : data.status == "3"
                                          ? appLKBg
                                          : appDivider,
                          child: InkWell(
                            onTap: () => ontapItems(data),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: appBgWhite,
                              ),
                              padding: EdgeInsets.symmetric(
                                  vertical: 8.h, horizontal: 12.w),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          data.namakaryawan ?? "-",
                                          style: theme.textTheme.titleLarge,
                                        ),
                                        SizedBox(height: 2.h),
                                        Text(
                                          data.notransaksi ?? "-",
                                          style: theme.textTheme.bodyMedium,
                                        ),
                                        SizedBox(height: 2.h),
                                        Text(
                                          data.namajenis ?? "-",
                                          style: theme.textTheme.displaySmall,
                                        ),
                                      ],
                                    ),
                                  ),
                                  SvgPicture.asset(
                                    height: 18.h,
                                    data.status == "0"
                                        ? ConstIconPath.questionIcon
                                        : data.status == "1"
                                            ? ConstIconPath.checkIcon
                                            : data.status == "2"
                                                ? ConstIconPath.declineIcon
                                                : data.status == "3"
                                                    ? ConstIconPath.exclamIcon
                                                    : ConstIconPath
                                                        .questionIcon,
                                    colorFilter: ColorFilter.mode(
                                        data.status == "0"
                                            ? appCutiBg
                                            : data.status == "1"
                                                ? appNotifAbsIcn
                                                : data.status == "2"
                                                    ? appImperialRed
                                                    : data.status == "3"
                                                        ? appLKBg
                                                        : appDivider,
                                        BlendMode.srcIn),
                                    fit: BoxFit.fill,
                                  ),
                                  SizedBox(width: 12.w),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  )
                : const SizedBox(),
          ],
        ),
      ),
    ),
  );
}

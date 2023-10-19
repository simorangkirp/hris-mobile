import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../lib.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
Widget approvalHistory(
    BuildContext context, List<ListApprovalDataDetail>? mod) {
  final l10n = AppLocalizations.of(context);
  ScrollController ctrl = ScrollController();

  return NotificationListener<OverscrollIndicatorNotification>(
    onNotification: (OverscrollIndicatorNotification overScrl) {
      overScrl.disallowIndicator();
      return false;
    },
    child: Padding(
      padding: Constant.appPadding,
      child: SingleChildScrollView(
        primary: false,
        controller: ctrl,
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              l10n.timeline,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16.sp,
              ),
            ),
            SizedBox(height: 12.h),
            mod != null
                ? ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    primary: false,
                    shrinkWrap: true,
                    controller: ctrl,
                    itemCount: mod.length,
                    itemBuilder: (context, index) {
                      String lastData = mod.length.toString();
                      var data = mod[index];
                      bool first = false;
                      bool last = false;
                      if (index == 0) {
                        first = true;
                      } else {
                        first = false;
                      }
                      if ((index + 1).toString() == lastData) {
                        last = true;
                      } else {
                        last = false;
                      }
                      return SizedBox(
                        height: 124.h,
                        child: MyTimelineStyle(
                          data: data,
                          isFirst: first,
                          isLast: last,
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

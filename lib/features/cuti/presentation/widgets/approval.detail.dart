import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/core.dart';
import '../../cuti.dart';

Widget paidleaveAppHistory(List<PaidLeaveApproval>? mod) {
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
              'Timeline',
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
                      return PaidLeaveTimelineStyle(
                        data: data,
                        isFirst: first,
                        isLast: last,
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

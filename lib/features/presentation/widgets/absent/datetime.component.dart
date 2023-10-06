import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../../../../config/themes/colors.dart';

class ClockWidget extends StatelessWidget {
  // final DateTime time;
  const ClockWidget({
    // required this.time,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Stream.periodic(const Duration(seconds: 1)),
      builder: (context, snapshot) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  DateFormat('HH:mm').format(DateTime.now()),
                  style: TextStyle(
                    fontSize: 48.sp,
                    fontWeight: FontWeight.w400,
                    color: appBgBlack,
                  ),
                ),
                Text(
                  ':${DateTime.now().second.toString()}',
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    fontSize: 28.sp,
                    fontWeight: FontWeight.w400,
                    color: appBgBlack,
                  ),
                ),
              ],
            ),
            SizedBox(height: 4.h),
            Text(
              DateFormat('EEE, dd MMM yyyy').format(DateTime.now()),
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: appBgBlack.withOpacity(0.3),
              ),
            ),
          ],
        );
      },
    );
  }
}

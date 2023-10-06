import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timeline_tile/timeline_tile.dart';
import '../../../../lib.dart';

class PaidLeaveTimelineStyle extends StatefulWidget {
  const PaidLeaveTimelineStyle({
    this.data,
    this.isFirst,
    this.isLast,
    super.key,
  });
  final PaidLeaveApproval? data;
  final bool? isFirst, isLast;

  @override
  State<PaidLeaveTimelineStyle> createState() => _PaidLeaveTimelineStyleState();
}

class _PaidLeaveTimelineStyleState extends State<PaidLeaveTimelineStyle> {
  bool isApproved = false;
  bool isDeclined = false;
  bool isCorrection = false;
  bool isWaiting = false;

  @override
  void initState() {
    super.initState();
    if (widget.data != null) {
      if (widget.data?.status == "1") {
        isApproved = true;
      } else {
        isApproved = false;
      }
      if (widget.data?.status == "2") {
        isDeclined = true;
      } else {
        isDeclined = false;
      }
      if (widget.data?.status == "3") {
        isCorrection = true;
      } else {
        isCorrection = false;
      }
      if (!isApproved && !isDeclined && !isCorrection) {
        isWaiting = true;
      } else {
        isWaiting = false;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // return const SizedBox();
    return TimelineTile(
      isFirst: widget.isFirst!,
      isLast: widget.isLast!,
      afterLineStyle: widget.isLast!
          ? const LineStyle()
          : LineStyle(
              thickness: 2,
              color: isApproved
                  ? appNotifAbsIcn
                  : isDeclined
                      ? appImperialRed
                      : isCorrection
                          ? appLKBg
                          : appDivider,
            ),
      beforeLineStyle: widget.isFirst!
          ? const LineStyle()
          : LineStyle(
              thickness: 3,
              color: isApproved
                  ? appNotifAbsIcn
                  : isDeclined
                      ? appImperialRed
                      : isCorrection
                          ? appLKBg
                          : appDivider,
            ),
      indicatorStyle: IndicatorStyle(
        color: isApproved
            ? appNotifAbsIcn
            : isDeclined
                ? appImperialRed
                : isCorrection
                    ? appLKBg
                    : appDivider,
        indicatorXY: 0.2,
      ),
      endChild: Padding(
        padding: EdgeInsets.only(bottom: 24.h, left: 12.w),
        child: Card(
          child: Container(
            width: double.maxFinite,
            padding: EdgeInsets.all(8.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  widget.data?.notransaksi ?? "-",
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: appBgBlack.withOpacity(0.6),
                  ),
                ),
                SizedBox(height: 2.h),
                Text(
                  widget.data?.namakaryawan ?? '-',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  widget.data?.tglupdate ?? '-',
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

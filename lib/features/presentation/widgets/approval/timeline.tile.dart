import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:collection/collection.dart';
import '../../../../lib.dart';

class MyTimelineStyle extends StatefulWidget {
  const MyTimelineStyle({
    required this.data,
    required this.isFirst,
    required this.isLast,
    super.key,
  });
  final ListApprovalDataDetail data;
  final bool isFirst, isLast;

  @override
  State<MyTimelineStyle> createState() => _MyTimelineStyleState();
}

class _MyTimelineStyleState extends State<MyTimelineStyle> {
  bool isApproved = false;
  bool isDeclined = false;
  bool isCorrection = false;
  bool isWaiting = false;

  @override
  void initState() {
    super.initState();
    if (widget.data.list != null) {
      if (widget.data.list!.isNotEmpty) {
        final app =
            widget.data.list!.firstWhereOrNull((el) => el.status == '1');
        if (app != null) {
          isApproved = true;
        } else {
          isApproved = false;
        }
        final dec =
            widget.data.list!.firstWhereOrNull((el) => el.status == '2');
        if (dec != null) {
          isDeclined = true;
        } else {
          isDeclined = false;
        }
        final corr =
            widget.data.list!.firstWhereOrNull((el) => el.status == '3');
        if (corr != null) {
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
  }

  @override
  Widget build(BuildContext context) {
    return TimelineTile(
      isFirst: widget.isFirst,
      isLast: widget.isLast,
      afterLineStyle: widget.isLast
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
      beforeLineStyle: widget.isFirst
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: widget.data.list != null
              ? List.generate(
                  growable: false,
                  widget.data.list!.length,
                  (index) => Card(
                    child: Container(
                      width: double.maxFinite,
                      padding: EdgeInsets.all(8.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            widget.data.list![0].notransaksi ?? "-",
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: appBgBlack.withOpacity(0.6),
                            ),
                          ),
                          SizedBox(height: 2.h),
                          Text(
                            widget.data.list![0].namakaryawan ?? '-',
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            widget.data.list![0].namastatus ?? '-',
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Visibility(
                              visible: widget.data.list![0].keterangan != '' &&
                                  widget.data.list![0].keterangan != null,
                              child: SizedBox(height: 2.h)),
                          Visibility(
                            visible: widget.data.list![0].keterangan != '' &&
                                widget.data.list![0].keterangan != null,
                            child: Text(
                              widget.data.list![0].keterangan ?? '-',
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              : [],
        ),
      ),
      // Column(
      //   children: [
      //     Card(
      //       child: Container(
      //         padding: EdgeInsets.all(8),
      //         child: Column(
      //           children: [
      //             Text("-"),
      //             Text("-"),
      //             Text("-"),
      //           ],
      //         ),
      //       ),
      //     )
      //   ],
      // )
      // data.list != null
      //     ? ListView.builder(
      //         shrinkWrap: true,
      //         controller: ctrl,
      //         itemCount: data.list!.length,
      //         itemBuilder: (context, index) {
      //           var item = data.list![index];
      //           return SizedBox(
      //             width: double.maxFinite,
      //             height: 0.2.sh,
      //             child: Card(
      //               child: Column(
      //                 mainAxisSize: MainAxisSize.min,
      //                 crossAxisAlignment:
      //                     CrossAxisAlignment.start,
      //                 children: [
      //                   Text(item.notransaksi ?? "-"),
      //                   Text(item.namapenyetuju ?? "-"),
      //                   Text(item.namastatus ?? "-"),
      //                 ],
      //               ),
      //             ),
      //           );
      //         },
      //       )
      //     : const SizedBox(),
    );
  }
}

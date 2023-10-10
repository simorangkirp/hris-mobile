import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../lib.dart';

// PaidLeaveListData data
Widget buildListItems(BuildContext context, List<PaidLeaveListData>? listdata,
    Function(String id) onTapItem) {
  ScrollController ctrl = ScrollController();
  return listdata == null
      ? const SizedBox()
      : listdata.isNotEmpty
          ? NotificationListener<OverscrollIndicatorNotification>(
              onNotification: (OverscrollIndicatorNotification overScrl) {
                overScrl.disallowIndicator();
                return false;
              },
              child: SingleChildScrollView(
                controller: ctrl,
                child: ListView.builder(
                  controller: ctrl,
                  shrinkWrap: true,
                  itemCount: listdata.length,
                  itemBuilder: (context, index) {
                    var data = listdata[index];
                    var fr = DateTime.parse(data.tgldari ?? "");
                    var to = DateTime.parse(data.tglsampai ?? "");
                    var comb = combineDates(fr, to);
                    return Padding(
                      padding:
                          EdgeInsets.only(bottom: 12.h, left: 4.w, right: 4.w),
                      child: Material(
                        elevation: 8,
                        borderRadius: BorderRadius.circular(4),
                        shadowColor: data.statuspersetujuan == "0"
                            ? appCutiBg
                            : data.statuspersetujuan == "1"
                                ? appNotifAbsIcn
                                : data.statuspersetujuan == "2"
                                    ? appImperialRed
                                    : data.statuspersetujuan == "3"
                                        ? appLKBg
                                        : appDivider,
                        child: InkWell(
                          onTap: () {
                            onTapItem(data.notransaksi ?? "");
                          },
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
                                        data.notransaksi ?? "-",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14.sp,
                                        ),
                                      ),
                                      Text(
                                        comb,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12.sp,
                                          color: appBgBlack.withOpacity(0.7),
                                        ),
                                      ),
                                      Text(
                                        data.namastatus ?? "-",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12.sp,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SvgPicture.asset(
                                  height: 18.h,
                                  data.statuspersetujuan == "0"
                                      ? ConstIconPath.questionIcon
                                      : data.statuspersetujuan == "1"
                                          ? ConstIconPath.checkIcon
                                          : data.statuspersetujuan == "2"
                                              ? ConstIconPath.declineIcon
                                              : data.statuspersetujuan == "3"
                                                  ? ConstIconPath.exclamIcon
                                                  : ConstIconPath.questionIcon,
                                  colorFilter: ColorFilter.mode(
                                      data.statuspersetujuan == "0"
                                          ? appCutiBg
                                          : data.statuspersetujuan == "1"
                                              ? appNotifAbsIcn
                                              : data.statuspersetujuan == "2"
                                                  ? appImperialRed
                                                  : data.statuspersetujuan ==
                                                          "3"
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
                ),
              ),
            )
          : noDataWidget(context);
}

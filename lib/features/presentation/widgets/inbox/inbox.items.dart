import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../../lib.dart';

Widget buildInboxItem(BuildContext context, List<NotifEntity>? listData) {
  final l10n = AppLocalizations.of(context);
  final theme = Theme.of(context);
  List<GroupNotifModel> listModel = [];
  List<String> lstDt = [];
  String dt = "";
  bool isToday = false;
  bool isYest = false;

  if (listData != null) {
    if (listData.isNotEmpty) {
      for (int i = 0; i < listData.length; i++) {
        // var dt = listData[i];
        // var pjd = "PJD";
        // var cuti = "CT";
        // if (dt.kodenotif != null) {
        //   var listNotifCd = dt.kodenotif!.split("-");
        //   for (var e in listNotifCd) {
        //     if (e.contains(pjd)) {
        //       listData[i].notifCd = "PJD";
        //     }
        //     if (e.contains(cuti)) {
        //       listData[i].notifCd = "CUTI";
        //     }
        //   }
        // }
        if (listData[i].tanggal != null) {
          var x = listData[i].tanggal!.split(" ");
          lstDt.add(x[0]);
        }
      }
      lstDt = lstDt.toSet().toList();
      for (var i = 0; i < lstDt.length; i++) {
        dt = lstDt[i];
        // dynamic lstGp;
        List<NotifEntity> listGroup = [];
        // listGroup.clear();
        for (var e in listData) {
          if (e.tanggal != null) {
            var spl = e.tanggal!.split(" ");
            if (dt == spl[0]) {
              listGroup.add(e);
            }
          }
        }
        listModel.add(GroupNotifModel(dt, listGroup));
      }
    }
  }
  void determineTodYes(dt) {
    String now = DateFormat('yyyy-MM-dd').format(DateTime.now()).toString();
    String yes = DateFormat('yyyy-MM-dd')
        .format(DateTime.now().subtract(const Duration(days: 1)))
        .toString();
    log(now.toString());
    log(yes.toString());
    if (dt == now) {
      isToday = true;
      isYest = false;
    } else if (dt == yes) {
      isYest = true;
      isToday = false;
    } else {
      isYest = false;
      isToday = false;
    }
  }

  return listModel.isEmpty
      ? const SizedBox()
      : ListView.builder(
          shrinkWrap: true,
          physics: const ScrollPhysics(),
          itemCount: listModel.length,
          itemBuilder: (context, index) {
            var item = listModel[index];
            determineTodYes(item.date);
            return Padding(
              padding: EdgeInsets.all(8.w),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    isToday
                        ? l10n.today
                        : isYest
                            ? l10n.yesterday
                            : item.date,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 12.h),
                  item.list.isEmpty
                      ? const SizedBox()
                      : ListView.builder(
                          shrinkWrap: true,
                          physics: const ScrollPhysics(),
                          itemCount: item.list.length,
                          itemBuilder: (context, index) {
                            var dets = item.list[index];
                            var x = item.list[index].tanggal!.split(" ");
                            var x1 = x[1].split(":");
                            var hr = "${x1[0]}:${x1[1]}";
                            return Padding(
                              padding: EdgeInsets.all(8.w),
                              child: GestureDetector(
                                onTap: () {},
                                child: Material(
                                  borderRadius: BorderRadius.circular(4),
                                  elevation: 8,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                      color: theme.colorScheme.secondary,
                                    ),
                                    padding: EdgeInsets.all(8.h),
                                    child: IntrinsicHeight(
                                      child: Row(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              color: appCutiBg.withOpacity(0.3),
                                            ),
                                            padding: EdgeInsets.symmetric(
                                                vertical: 8.h,
                                                horizontal: 10.w),
                                            child: SvgPicture.asset(
                                              ConstIconPath.timeOff,
                                              colorFilter: ColorFilter.mode(
                                                  appCutiBg.withOpacity(0.8),
                                                  BlendMode.srcIn),
                                            ),
                                          ),
                                          SizedBox(width: 12.w),
                                          Expanded(
                                            flex: 5,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  // 'Pengajuan cuti baru dengan No. Transaksi: ${dets.noreferensi}',
                                                  dets.detail ?? "",
                                                  maxLines: 4,
                                                  style: theme
                                                      .textTheme.bodyMedium,
                                                ),
                                                Text(
                                                  hr,
                                                  style: theme
                                                      .textTheme.displaySmall,
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        )
                ],
              ),
            );
          },
        );
}

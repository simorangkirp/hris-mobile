import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:owl_hris/features/absen/domain/entities/absent.dart';
import 'package:styled_text/styled_text.dart';

import '../../../../config/themes/colors.dart';

class AbsentItemCard extends StatefulWidget {
  final AbsentEntity item;
  const AbsentItemCard({required this.item, super.key});

  @override
  State<AbsentItemCard> createState() => _AbsentItemCardState();
}

class _AbsentItemCardState extends State<AbsentItemCard> {
  bool isAbsent = false;
  bool isDayOff = false;
  bool isDuty = false;
  bool isClear = false;
  bool isNationalDayOff = false;
  String date = "";
  String day = "";
  String hIn = "-";
  String hOut = "-";
  List<String>? lstDiff;
  DateFormat format = DateFormat('yyyy-MM-dd');
  DateFormat hrFormat = DateFormat('HH:mm');

  @override
  void initState() {
    super.initState();
    if (widget.item.data != null) {
      if (widget.item.data?.kodeIn == "C" || widget.item.data?.kodeOut == "C") {
        isDayOff = true;
      }
      if (widget.item.data?.kodeIn == "I" || widget.item.data?.kodeOut == "I") {
        isClear = true;
      }
      if (widget.item.data?.hrOut != null) {
        var a = hrFormat.parse(widget.item.data!.hrOut!);
        var aForm = DateFormat('HH:mm').format(a);
        hOut = aForm.toString();
      }
      if (widget.item.data?.hrIn != null) {
        var b = hrFormat.parse(widget.item.data!.hrIn!);
        var bForm = DateFormat('HH:mm').format(b);
        hIn = bForm.toString();
      }
      if (widget.item.data?.hrIn != null && widget.item.data?.hrOut != null) {
        var one = hrFormat.parse(widget.item.data!.hrIn!);
        var two = hrFormat.parse(widget.item.data!.hrOut!);
        var diff = two.difference(one).toString();
        lstDiff = diff.split(":");
        isAbsent = true;
      }
    }

    if (widget.item.tanggal != null) {
      DateTime dt = format.parse(widget.item.tanggal!);
      date = DateFormat('dd MMM yyyy').format(dt);
      day = DateFormat('EEE').format(dt);
      if (dt.weekday == 6 || dt.weekday == 7) {
        if (widget.item.data!.absenIdIn != null ||
            widget.item.data!.absenIdOut != null) {
          isAbsent = true;
        } else {
          isAbsent = false;
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return (isDayOff || isClear)
        ? Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              border: Border.all(
                color: isClear
                    ? appIjinBg.withOpacity(0.3)
                    : appCutiBg.withOpacity(0.3),
              ),
              color: isClear
                  ? appIjinBg.withOpacity(0.3)
                  : appCutiBg.withOpacity(0.3),
            ),
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                Column(
                  children: [
                    Text(
                      day,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: appBgBlack,
                        fontSize: 16.sp,
                      ),
                    ),
                    Text(
                      date,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 12.sp,
                        color: appBgBlack,
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 24),
                Expanded(
                    child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: isClear ? appIjinBg : appCutiBg,
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Center(
                    child: Text(
                      isClear ? "Izin / Sakit" : "Cuti",
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        color: appBgBlack,
                      ),
                    ),
                  ),
                )),
              ],
            ),
          )
        : isAbsent
            ? Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    border: Border.all(
                      color: appBgBlack.withOpacity(0.3),
                    )),
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            '$day, $date',
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: appBgBlack.withOpacity(0.5),
                            ),
                          ),
                          Text(
                            '${lstDiff?[0] ?? "0"}:${lstDiff?[1] ?? "00"} total hrs ',
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 24.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Visibility(
                            visible: widget.item.data?.kodeIn == "LK" ||
                                widget.item.data?.kodeOut == "DK",
                            replacement: const SizedBox(),
                            child: Container(
                              width: double.maxFinite,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: widget.item.data?.kodeIn == "LK"
                                        ? appLKBg.withOpacity(0.8)
                                        : appDKBg.withOpacity(0.8)),
                                color: widget.item.data?.kodeIn == "LK"
                                    ? appLKBg
                                    : appDKBg,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              padding: EdgeInsets.symmetric(vertical: 4.h),
                              child: Text(
                                widget.item.data?.kodeIn == "LK"
                                    ? 'Luar Kota'
                                    : 'Dalam Kota',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500,
                                  color: appBgWhite,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 2.h),
                          Text(
                            'in & out',
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              color: appBgBlack.withOpacity(0.5),
                            ),
                          ),
                          Text(
                            '$hIn - $hOut',
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            : Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    border: Border.all(
                      color: appBgBlack.withOpacity(0.3),
                    )),
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    StyledText(
                      text: '<bold>$day</bold>\n$date',
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: appBgBlack.withOpacity(0.5),
                      ),
                      textAlign: TextAlign.center,
                      tags: {
                        'bold': StyledTextTag(
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w700,
                            color: appBgBlack,
                          ),
                        ),
                      },
                    ),
                    SizedBox(width: 24.w),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: appBgBlack.withOpacity(0.7),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 8.h),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Libur',
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                              color: appBgWhite,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
  }
}

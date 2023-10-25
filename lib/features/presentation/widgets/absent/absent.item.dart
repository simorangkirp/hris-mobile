import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:styled_text/styled_text.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '/../lib.dart';

class AbsentItemCard extends StatefulWidget {
  final AbsentEntity item;
  final List<HolidayModel>? holiday;
  final ThemeData theme;
  const AbsentItemCard({
    this.holiday,
    required this.item,
    required this.theme,
    super.key,
  });

  @override
  State<AbsentItemCard> createState() => _AbsentItemCardState();
}

class _AbsentItemCardState extends State<AbsentItemCard> {
  bool isDayOff = false;
  bool isDuty = false;
  bool isClear = false;
  bool isWeekEnd = false;
  bool isNationalDayOff = false;
  bool isexpand = false;
  String date = "";
  String day = "";
  String hIn = "-";
  String hOut = "-";
  String vacNm = '';
  List<String>? lstDiff;
  DateFormat format = DateFormat('yyyy-MM-dd');
  DateFormat hrFormat = DateFormat('HH:mm');

  @override
  void initState() {
    super.initState();
    if (widget.holiday != null) {
      for (var e in widget.holiday!) {
        if (e.tanggal == widget.item.tanggal) {
          isWeekEnd = true;
          vacNm = e.keterangan ?? "-";
        }
      }
    }
    if (widget.item.tanggal != null) {
      if (widget.item.data != null) {
        if (widget.item.data?.kodeIn == "C" ||
            widget.item.data?.kodeOut == "C") {
          isDayOff = true;
        }
        if (widget.item.data?.kodeIn == "I" ||
            widget.item.data?.kodeOut == "I") {
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
        }
        DateTime dt = format.parse(widget.item.tanggal!);
        date = DateFormat('dd MMM yyyy').format(dt);
        day = DateFormat('EEE').format(dt);
        if (dt.weekday == 6 || dt.weekday == 7) {
          if (widget.item.data!.absenIdIn == null &&
              widget.item.data!.absenIdOut == null) {
            isWeekEnd = true;
          } else {
            isWeekEnd = false;
          }
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
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
                      style: widget.theme.textTheme.displayMedium,
                    ),
                    Text(
                      date,
                      style: widget.theme.textTheme.displaySmall,
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
                      isClear ? l10n.sick : l10n.paidLeave,
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
        : isWeekEnd
            ? Container(
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
                      style: widget.theme.textTheme.displaySmall,
                      textAlign: TextAlign.center,
                      tags: {
                        'bold': StyledTextTag(
                          style: widget.theme.textTheme.bodyLarge,
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
                        child: Column(
                          children: [
                            Text(
                              vacNm != '' ? l10n.vacation : l10n.weekEnd,
                              style: widget.theme.textTheme.bodyMedium,
                            ),
                            Visibility(
                                visible: vacNm != '',
                                child: SizedBox(height: 2.h)),
                            Visibility(
                              visible: vacNm != '',
                              child: Text(
                                vacNm,
                                style: widget.theme.textTheme.bodyLarge,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      if (widget.item.data!.absenIdIn != null &&
                          widget.item.data!.absenIdOut == null) {
                        setState(() {
                          isexpand = !isexpand;
                        });
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2),
                          border: Border.all(
                            color: appBgBlack.withOpacity(0.3),
                          )),
                      padding: EdgeInsets.symmetric(
                          horizontal: 12.w, vertical: 12.h),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  '$day, $date',
                                  style: widget.theme.textTheme.bodyLarge,
                                ),
                                Text(
                                  '${lstDiff?[0] ?? "0"}:${lstDiff?[1] ?? "00"} ${l10n.totHrs} ',
                                  style: widget.theme.textTheme.displayMedium,
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
                                          color:
                                              widget.item.data?.kodeIn == "LK"
                                                  ? appLKBg.withOpacity(0.8)
                                                  : appDKBg.withOpacity(0.8)),
                                      color: widget.item.data?.kodeIn == "LK"
                                          ? appLKBg
                                          : appDKBg,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    padding:
                                        EdgeInsets.symmetric(vertical: 4.h),
                                    child: Text(
                                      widget.item.data?.kodeIn == "LK"
                                          ? 'Luar Kota'
                                          : 'Dalam Kota',
                                      textAlign: TextAlign.center,
                                      style:
                                          widget.theme.textTheme.displaySmall,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 2.h),
                                Text(
                                  l10n.inOut,
                                  style: widget.theme.textTheme.displaySmall,
                                ),
                                Text(
                                  '$hIn - $hOut',
                                  style: widget.theme.textTheme.bodyLarge,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  ExpandableWidget(
                    expand: isexpand,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: appWarning,
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
                      child: Text('Submit Absent'),
                    ),
                  ),
                ],
              );
  }
}

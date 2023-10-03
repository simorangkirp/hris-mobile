import 'package:flutter/material.dart';
import '../../../../lib.dart';

Future pickDateRange(BuildContext ctx) async {
  DateTimeRange? newDateRange = await showDateRangePicker(
    builder: (ctx, child) {
      return Theme(
        data: ThemeData.light().copyWith(
          colorScheme: const ColorScheme.dark(
            primary: appBgBlack,
            onPrimary: appBgWhite,
            surface: appBgWhite,
            onSurface: appBgBlack,
            secondary: appBgWhite,
            onSecondary: appBgWhite,
          ),

          // // Here I Chaged the overline to my Custom TextStyle.
          // textTheme: TextTheme(
          //   labelSmall: TextStyle(fontSize: 16, color: appBgBlack),
          // ),
          dialogBackgroundColor: appBgBlack,
        ),
        child: child!,
      );
    },
    context: ctx,
    firstDate: DateTime(1900),
    lastDate: DateTime(2999),
  );
  return newDateRange;

  // if (newDateRange == null) return;
  // DateTime startDt = newDateRange.start;
  // DateTime endDt = newDateRange.end;

  // int nbDays = endDt.difference(startDt).inDays + 1;
  // List<int> days = List.generate(nbDays, (index) {
  //   int weekDay =
  //       DateTime(startDt.year, startDt.month, startDt.day + (index)).weekday;
  //   if (weekDay != DateTime.saturday && weekDay != DateTime.sunday) {
  //     return 1;
  //   }
  //   return 0;
  // });
  // if (endDt.weekday == 5) {
  //   act = DateTime(endDt.year, endDt.month, endDt.day + 3);
  // } else if (endDt.weekday == 6) {
  //   act = DateTime(endDt.year, endDt.month, endDt.day + 2);
  // } else {
  //   act = DateTime(endDt.year, endDt.month, endDt.day + 1);
  // }
  // mod.tgldari = DateFormat('yyyy-MM-dd').format(startDt);
  // mod.tglsampai = DateFormat('yyyy-MM-dd').format(endDt);
  // mod.tglmulaikerja = DateFormat('yyyy-MM-dd').format(act!);
  // if (act != null) {
  //   mod.tglmulaikerja = DateFormat('yyyy-MM-dd').format(act!);
  // }
  // setState(() {
  //   totalDays = days.reduce((a, b) => a + b).toString();
  //   dtRange.text =
  //       "${DateFormat('dd MMM yyyy').format(startDt)} - ${DateFormat('dd MMM yyyy').format(endDt)}";
  //   mod.returnTxtCo!.text =
  //       DateFormat('dd MMM yyyy').format(act ?? DateTime.now());
  //   // dtRange.text =
  //   //     "${days.reduce((a, b) => a + b)}";
  // });
  // mod.jumlahhari = totalDays;
}

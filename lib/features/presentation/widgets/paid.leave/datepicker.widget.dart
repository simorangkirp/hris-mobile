// import 'package:flutter/material.dart';
// import '../../../../lib.dart';

// Future pickDateRange(BuildContext ctx) async {
//   DateTimeRange? newDateRange = await showDateRangePicker(
//     initialEntryMode: DatePickerEntryMode.calendarOnly,
//     builder: (ctx, child) {
//       return Theme(
//         data: ThemeData.light().copyWith(
//           colorScheme: const ColorScheme.dark(
//             primary: appBgBlack,
//             onPrimary: appBgWhite,
//             surface: appBgWhite,
//             onSurface: appBgBlack,
//             secondary: appBgWhite,
//             onSecondary: appBgWhite,
//           ),

//           // // Here I Chaged the overline to my Custom TextStyle.
//           // textTheme: TextTheme(
//           //   labelSmall: TextStyle(fontSize: 16, color: appBgBlack),
//           // ),
//           dialogBackgroundColor: appBgBlack,
//         ),
//         child: child!,
//       );
//     },
//     context: ctx,
//     firstDate: DateTime(1900),
//     lastDate: DateTime(2999),
//   );
//   return newDateRange;
// }

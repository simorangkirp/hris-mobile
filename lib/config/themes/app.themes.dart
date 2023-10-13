import 'package:flutter/material.dart';
import 'package:owl_hris/lib.dart';

enum AppTheme {
  lightMode,
  darkMode,
}

final appThemeData = {
  AppTheme.lightMode: ThemeData(
    brightness: Brightness.light,
    primaryColor: appBgWhite,
  ),
  AppTheme.darkMode: ThemeData(
    brightness: Brightness.dark,
    primaryColor: appBgBlack,
  )
};

// enum AppTheme {
//   light(
//     'Light',
//   ),
//   dark(
//     ThemeData(),
//     'Dark',
//   );

//   final appThemeData = {
//     AppTheme.light: ThemeData(
//       brightness: Brightness.light,
//       primaryColor: appBgWhite,
//     ),
//     AppTheme.dark = ThemeData(
//       brightness: Brightness.dark,
//       primaryColor: appBgBlack,
//     )
//   };

//   /// Add another languages support here
//   const AppTheme(this.value, this.text);

//   final ThemeData value;
//   final String text; // Optional: this properties used for ListTile details
// }

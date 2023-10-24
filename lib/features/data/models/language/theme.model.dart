import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:owl_hris/config/config.dart';

enum AppTheme {
  darkMode,
  lightMode,
}

List<ThemeData> themesData = [
  ThemeData(
    brightness: Brightness.dark,
    primaryColor: appBgBlack,
    scaffoldBackgroundColor: appBgBlack,
    dividerTheme: DividerThemeData(
      color: appDisabledTextField,
      thickness: 1.2.h,
    ),
    dialogTheme: const DialogTheme(
      backgroundColor: appBgBlack,
    ),
    iconTheme: const IconThemeData(
      color: appText5,
    ),
    colorScheme: ColorScheme(
      brightness: Brightness.dark,
      primary: appRichBlack,
      onPrimary: appBgBlack.withOpacity(0.8),
      secondary: appBtnBlue,
      onSecondary: appBtnBlue.withOpacity(0.8),
      error: appImperialRed,
      onError: appImperialRed.withOpacity(0.8),
      background: appBgBlack,
      onBackground: appBgBlack.withOpacity(0.8),
      surface: appWarning,
      onSurface: appWarning.withOpacity(0.8),
    ),
    drawerTheme: const DrawerThemeData(
      backgroundColor: appRichBlack,
      surfaceTintColor: appBgWhite,
      // scrimColor: appBtnBlue,
      // surfaceTintColor: ,
    ),
    expansionTileTheme: const ExpansionTileThemeData(
      backgroundColor: appBgBlack,
      collapsedBackgroundColor: appRichBlack,
      textColor: appBtnBlue,
      collapsedTextColor: appBgWhite,
      iconColor: appBtnBlue,
      collapsedIconColor: appBgWhite,
    ),
    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor: appRichBlack,
      titleTextStyle: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w400,
        color: darkmodeTextColor,
      ),
      toolbarHeight: 56.h,
      iconTheme: const IconThemeData(color: appBgWhite),
    ),
    listTileTheme: const ListTileThemeData(
      selectedColor: appBtnBlue,
      iconColor: appBgWhite,
    ),
    textTheme: TextTheme(
      displayMedium: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w700,
        color: darkmodeTextColor,
      ),
      titleSmall: TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.w500,
        color: appBgWhite,
      ),
      titleMedium: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
        color: appBgWhite,
      ),
      bodyMedium: TextStyle(
        fontWeight: FontWeight.w400,
        color: darkmodeTextColor,
        fontSize: 12.sp,
      ),
      bodyLarge: TextStyle(
        fontWeight: FontWeight.w600,
        color: darkmodeTextColor,
        fontSize: 14.sp,
      ),
    ),
  ),
  ThemeData(
    brightness: Brightness.light,
    primaryColor: appBgWhite,
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: appBgWhite,
      onPrimary: appDivider.withOpacity(0.8),
      secondary: appBtnBlue,
      onSecondary: appBtnBlue.withOpacity(0.8),
      error: appImperialRed,
      onError: appImperialRed.withOpacity(0.8),
      background: appBgBlack,
      onBackground: appBgBlack.withOpacity(0.8),
      surface: appWarning,
      onSurface: appWarning.withOpacity(0.8),
    ),
    iconTheme: const IconThemeData(
      color: appRichBlack,
    ),
    dividerTheme: DividerThemeData(
      color: appDivider,
      thickness: 1.2.h,
    ),
    drawerTheme: const DrawerThemeData(
      backgroundColor: appBgWhite,
      surfaceTintColor: appRichBlack,
      // scrimColor: appBtnBlue,
      // surfaceTintColor: ,
    ),
    expansionTileTheme: const ExpansionTileThemeData(
      backgroundColor: appBgBlack,
      collapsedBackgroundColor: appBgWhite,
      textColor: appBtnBlue,
      collapsedTextColor: appBgBlack,
      iconColor: appBtnBlue,
      collapsedIconColor: appBgBlack,
    ),
    listTileTheme: const ListTileThemeData(
      selectedColor: appBtnBlue,
      iconColor: appRichBlack,
    ),
    appBarTheme: AppBarTheme(
      iconTheme: const IconThemeData(
        color: appBgWhite,
      ),
      centerTitle: true,
      backgroundColor: appBgBlack,
      titleTextStyle: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w400,
        color: appBgWhite,
      ),
      toolbarHeight: 56.h,
    ),
    textTheme: TextTheme(
      displayMedium: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w700,
        color: appBgBlack,
      ),
      titleSmall: TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.w500,
        color: appBgWhite,
      ),
      titleMedium: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
        color: appBgWhite,
      ),
      bodyMedium: TextStyle(
        fontWeight: FontWeight.w400,
        color: appBgBlack,
        fontSize: 12.sp,
      ),
      bodyLarge: TextStyle(
        fontWeight: FontWeight.w600,
        color: appBgBlack,
        fontSize: 14.sp,
      ),
    ),
  ),
];

// final appThemeData = {
//   AppTheme.darkMode: ThemeData(
//     brightness: Brightness.dark,
//     primaryColor: appBgBlack,
//     colorScheme: ColorScheme(
//       brightness: Brightness.dark,
//       primary: appRichBlack,
//       onPrimary: appBgBlack.withOpacity(0.8),
//       secondary: appBtnBlue,
//       onSecondary: appBtnBlue.withOpacity(0.8),
//       error: appImperialRed,
//       onError: appImperialRed.withOpacity(0.8),
//       background: appBgBlack,
//       onBackground: appBgBlack.withOpacity(0.8),
//       surface: appWarning,
//       onSurface: appWarning.withOpacity(0.8),
//     ),
//   ),
//   AppTheme.lightMode: ThemeData(
//     brightness: Brightness.light,
//     primaryColor: appBgWhite,
//     colorScheme: ColorScheme(
//       brightness: Brightness.light,
//       primary: appBgWhite,
//       onPrimary: appDivider.withOpacity(0.8),
//       secondary: appBtnBlue,
//       onSecondary: appBtnBlue.withOpacity(0.8),
//       error: appImperialRed,
//       onError: appImperialRed.withOpacity(0.8),
//       background: appBgBlack,
//       onBackground: appBgBlack.withOpacity(0.8),
//       surface: appWarning,
//       onSurface: appWarning.withOpacity(0.8),
//     ),
//   ),
// };

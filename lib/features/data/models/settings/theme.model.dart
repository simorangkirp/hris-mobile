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

    // inputDecorationTheme: InputDecorationTheme(
    //   focusColor: appBtnBlue,
    //   focusedBorder: UnderlineInputBorder(
    //     borderSide: BorderSide(color: appBtnBlue),
    //   ),
    //   hintStyle: TextStyle(),
    //   labelStyle: TextStyle(),
    //   fillColor: appRichBlack,
    // ),
    dropdownMenuTheme: DropdownMenuThemeData(
      textStyle: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 14.sp,
        color: appBgWhite,
      ),
    ),
    cardTheme: const CardTheme(
      color: appRichBlack,
      surfaceTintColor: appRichBlack,
    ),
    dividerTheme: const DividerThemeData(
      color: appDisabledTextField,
    ),
    dialogTheme: const DialogTheme(
      backgroundColor: appBgBlack,
      surfaceTintColor: appBgBlack,
    ),
    switchTheme: SwitchThemeData(
      thumbColor: MaterialStateColor.resolveWith((states) {
        if(states.contains(MaterialState.selected)){
          return appSnackbarBgSuccess;
        }
        return appText3;
      }),
      trackColor: MaterialStateColor.resolveWith((states) {
        if(states.contains(MaterialState.selected)){
          return appRichBlack;
        }
        return appRichBlack;
      }),
    ),
    iconTheme: const IconThemeData(
      color: appText5,
    ),
    colorScheme: ColorScheme(
      brightness: Brightness.dark,
      primary: appRichBlack,
      onPrimary: appBgBlack.withOpacity(0.8),
      secondary: appRichBlack,
      onSecondary: darkmodeLoginCard,
      error: appImperialRed,
      onError: appImperialRed.withOpacity(0.8),
      background: appRichBlack,
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
      headlineLarge: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 32.sp,
        color: appBgWhite,
      ),
      headlineSmall: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 18.sp,
        color: appBgWhite,
      ),
      displayLarge: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 22.sp,
        color: darkmodeTextColor.withOpacity(0.8),
      ),
      displayMedium: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w700,
        color: darkmodeTextColor,
      ),
      displaySmall: TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.w500,
        color: darkmodeTextColor,
      ),
      titleSmall: TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.w500,
        color: appBgWhite,
      ),
      titleLarge: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
        color: appBgWhite,
      ),
      titleMedium: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
        color: appBgWhite,
      ),
      bodySmall: TextStyle(
        fontWeight: FontWeight.w400,
        color: appRichBlack,
        fontSize: 14.sp,
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
    scaffoldBackgroundColor: appBgWhite,
    dropdownMenuTheme: DropdownMenuThemeData(
      textStyle: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 14.sp,
        color: appRichBlack,
      ),
    ),

    // inputDecorationTheme: InputDecorationTheme(
    //   focusColor: appBtnBlue,
    //   focusedBorder: UnderlineInputBorder(
    //     borderSide: BorderSide(color: appBtnBlue),
    //   ),
    //   hintStyle: TextStyle(),
    //   labelStyle: TextStyle(),
    //   fillColor: appText3,
    // ),
    cardTheme: const CardTheme(
      color: appText3,
      surfaceTintColor: appText3,
    ),
    dialogTheme: const DialogTheme(
      backgroundColor: appBgWhite,
      surfaceTintColor: appBgWhite,
    ),
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: appBgWhite,
      onPrimary: appDivider.withOpacity(0.8),
      secondary: appText3,
      onSecondary: lightmodeLoginCard,
      error: appImperialRed,
      onError: appImperialRed.withOpacity(0.8),
      background: appBgBlack,
      onBackground: appBgBlack.withOpacity(0.8),
      surface: appWarning,
      onSurface: appWarning.withOpacity(0.8),
    ),
    switchTheme: SwitchThemeData(
      thumbColor: MaterialStateColor.resolveWith((states) {
        if(states.contains(MaterialState.selected)){
          return appSnackbarBgSuccess;
        }
        return appRichBlack;
      }),
      trackColor: MaterialStateColor.resolveWith((states) {
        if(states.contains(MaterialState.selected)){
          return appText3;
        }
        return appText3;
      }),
    ),
    iconTheme: const IconThemeData(
      color: appRichBlack,
    ),
    dividerTheme: const DividerThemeData(
      color: appBgWhite,
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
      headlineLarge: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 32.sp,
        color: appBgBlack,
      ),
      headlineSmall: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 18.sp,
        color: appBgBlack,
      ),
      displayLarge: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 22.sp,
        color: appBgBlack.withOpacity(0.8),
      ),
      displayMedium: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w700,
        color: appBgBlack,
      ),
      displaySmall: TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.w500,
        color: appBgBlack,
      ),
      titleSmall: TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.w500,
        color: appBgWhite,
      ),
      titleLarge: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
        color: appRichBlack,
      ),
      titleMedium: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
        color: appBgWhite,
      ),
      bodySmall: TextStyle(
        fontWeight: FontWeight.w400,
        color: appRichBlack,
        fontSize: 14.sp,
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

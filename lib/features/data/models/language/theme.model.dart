import 'package:flutter/material.dart';
import 'package:owl_hris/config/config.dart';

enum AppTheme {
  darkMode,
  lightMode,
}

final appThemeData = {
  AppTheme.darkMode: ThemeData(
    brightness: Brightness.dark,
    primaryColor: appBgBlack,
  ),
  AppTheme.lightMode: ThemeData(
    brightness: Brightness.light,
    primaryColor: appBgWhite,
    // colorScheme: const ColorScheme(
    //   brightness: Brightness.light,
    //   primary: appBgWhite,
    //   onPrimary: appDivider,
    //   secondary: appBtnBlue,
    //   onSecondary: appDKBg,
    //   error: appImperialRed,
    //   onError: appWarning,
    //   background: appBgBlack,
    //   onBackground: appCutiBg,
    //   surface: appIjinBg,
    //   onSurface: appIconMenuTitle,
    // ),
    appBarTheme: AppBarTheme(
      shadowColor: appDivider.withOpacity(0.6),
      centerTitle: true,
      color: appBgWhite,
    ),
    dialogTheme: const DialogTheme(
      backgroundColor: appBgWhite,
    ),
    cardTheme: CardTheme(
      color: appDivider.withOpacity(0.6),
      elevation: 4,
    ),
    drawerTheme: const DrawerThemeData(
      backgroundColor: appBgBlack,
      shadowColor: appBgWhite,
    ),
    listTileTheme: ListTileThemeData(
      textColor: appWarning,
      tileColor: appWarning,
      selectedColor: appImperialRed,
      selectedTileColor: appBgBlack.withOpacity(0.6),
    ),
    expansionTileTheme: ExpansionTileThemeData(
      backgroundColor: appBtnBlue.withOpacity(0.3),
      collapsedBackgroundColor: appBgWhite,
      textColor: appBtnBlue,
      collapsedTextColor: appBgBlack,
    ),
  ),
};

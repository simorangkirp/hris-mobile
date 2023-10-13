import 'package:flutter/material.dart';
import 'package:owl_hris/features/features.dart';

class SettingRepoImpl implements SettingsRepository {
  @override
  Future<ThemeData> changeThemeMode(param) async {
    ThemeData? theme;
    if (param == 'dark') {
      theme = ThemeData.dark().copyWith(
        // Customize dark theme properties
        scaffoldBackgroundColor: Colors.black,
        colorScheme: const ColorScheme.dark(),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
        ),
      );
    } else {
      theme = ThemeData.light().copyWith(
        // Customize dark theme properties
        scaffoldBackgroundColor: Colors.white,
        colorScheme: const ColorScheme.light(),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.blue,
        ),
      );
    }
    return theme;
  }
}

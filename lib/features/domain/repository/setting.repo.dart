import 'package:flutter/material.dart';

abstract class SettingsRepository {
  Future<ThemeData> changeThemeMode(String param);
}

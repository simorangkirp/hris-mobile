import 'package:flutter/material.dart';

abstract class SettingsRepository {
  Future<Locale> changeLanguage();
}

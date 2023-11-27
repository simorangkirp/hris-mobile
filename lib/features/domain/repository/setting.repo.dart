import 'package:flutter/material.dart';

import '../../../lib.dart';

abstract class SettingsRepository {
  Future<ThemeData> changeThemeMode(String param);
  Future<DataState> reqOTP(String pass);
  Future<DataState> changePass(SettingChgPwdModel param);
}

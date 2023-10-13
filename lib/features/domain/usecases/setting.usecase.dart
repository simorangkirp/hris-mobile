import 'package:flutter/material.dart';

import '../../../lib.dart';

class SettingChangeLanguageUsecase extends UseCase<ThemeData, String> {
  final SettingsRepository repos;
  SettingChangeLanguageUsecase(this.repos);
  @override
  Future<ThemeData> call(params) async {
    var res = await repos.changeThemeMode(params);
    return res;
  }
}

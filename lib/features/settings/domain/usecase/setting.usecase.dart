import 'package:flutter/material.dart';

import '../../../../lib.dart';

class SettingChangeLanguageUsecase extends UseCase<Locale, void> {
  final SettingsRepository repos;
  SettingChangeLanguageUsecase(this.repos);
  @override
  Future<Locale> call(params) async {
    var res = await repos.changeLanguage();
    return res;
  }
}

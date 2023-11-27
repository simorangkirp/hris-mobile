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

class SettingReqOtp extends UseCase<DataState, String> {
  final SettingsRepository repos;
  SettingReqOtp(this.repos);
  @override
  Future<DataState> call(params) async {
    var res = await repos.reqOTP(params);
    return res;
  }
}

class SettingChangePwdUseCase extends UseCase<DataState, SettingChgPwdModel> {
  final SettingsRepository repos;
  SettingChangePwdUseCase(this.repos);
  @override
  Future<DataState> call(params) async {
    var res = await repos.changePass(params);
    return res;
  }
}

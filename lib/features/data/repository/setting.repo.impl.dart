import 'dart:convert';
// import 'dart:io';

import 'package:flutter/material.dart';
import 'package:owl_hris/core/resources/data.state.dart';
import 'package:owl_hris/features/features.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingRepoImpl implements SettingsRepository {
  final SettingAPIServices _apiServices;
  SettingRepoImpl(this._apiServices);
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

  @override
  Future<DataState> reqOTP(String pass) async {
    LoginModel? mods;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      String? jsonBody = prefs.getString('LoginInfo');
      if (jsonBody != null) {
        final map = json.decode(jsonBody) as Map<String, dynamic>;
        mods = LoginModel.fromJson(map);
      }
    } catch (e) {
      throw Exception('Session is Expired');
    }

    var header = 'Bearer ${mods?.accesstoken}';
    var params = ReqOTPParams(mods?.uid ?? "-", pass, 'chpass', '1');

    try {
      final httpResp = await _apiServices.reqOTP(params, header);

      if (httpResp.response.statusCode! >= 200 &&
          httpResp.response.statusCode! < 300) {
        return DataSuccess(httpResp.data);
      } else {
        return DataError(DioException(
          error: httpResp.response.statusMessage,
          response: httpResp.response,
          type: DioExceptionType.badResponse,
          requestOptions: httpResp.response.requestOptions,
        ));
      }
    } on DioException catch (e) {
      return DataError(e);
    }
  }

  @override
  Future<DataState> changePass(SettingChgPwdModel param) async {
    LoginModel? mods;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      String? jsonBody = prefs.getString('LoginInfo');
      if (jsonBody != null) {
        final map = json.decode(jsonBody) as Map<String, dynamic>;
        mods = LoginModel.fromJson(map);
      }
    } catch (e) {
      throw Exception('Session is Expired');
    }

    var header = 'Bearer ${mods?.accesstoken}';
    var params =
        ChgPwdParams(mods?.uid ?? "-", param.oldP, param.newP, param.otp, '1');

    try {
      final httpResp = await _apiServices.changePwd(params, header);

      if (httpResp.response.statusCode! >= 200 &&
          httpResp.response.statusCode! < 300) {
        return DataSuccess(httpResp.data);
      } else {
        return DataError(DioException(
          error: httpResp.response.statusMessage,
          response: httpResp.response,
          type: DioExceptionType.badResponse,
          requestOptions: httpResp.response.requestOptions,
        ));
      }
    } on DioException catch (e) {
      return DataError(e);
    }
  }
}

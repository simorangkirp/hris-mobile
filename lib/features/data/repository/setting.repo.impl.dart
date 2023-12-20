import 'package:flutter/material.dart';
import 'package:owl_hris/core/resources/data.state.dart';
import 'package:owl_hris/features/features.dart';
import 'package:dio/dio.dart';

class SettingRepoImpl implements SettingsRepository {
  final RemoteSettingServicesImpl remoteServices;
  SettingRepoImpl(this.remoteServices);
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
    try {
      final httpResp = await remoteServices.reqOTP(pass);

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
    try {
      final httpResp =
          await remoteServices.changePwd(param.oldP, param.newP, param.otp);

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

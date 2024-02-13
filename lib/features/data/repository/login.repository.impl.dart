import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_jailbreak_detection/flutter_jailbreak_detection.dart';
import 'package:intl/intl.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart'
    show TargetPlatform, defaultTargetPlatform;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../lib.dart';

class LoginRepositoryImpl implements UserAuthRepository {
  final RemoteLoginScreenServicesImpl remoteServices;
  final UserAuthDb db;
  LoginRepositoryImpl(this.remoteServices, this.db);
  @override
  Future<DataState> loginUser(userNm, pwd) async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    var version = packageInfo.version;
    var paramVer = version;
    var params = RemoteLoginModel(userNm, pwd, paramVer);
    try {
      final httpResp = await remoteServices.login(params);
      if (httpResp.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResp.data);
      } else {
        return DataError(
          DioException(
            error: httpResp.response.statusMessage,
            response: httpResp.response,
            type: DioExceptionType.badResponse,
            requestOptions: httpResp.response.requestOptions,
          ),
        );
      }
    } on DioException catch (e) {
      return DataError(DioException(
        error: e.response!.statusMessage,
        response: e.response,
        type: DioExceptionType.badResponse,
        requestOptions: e.response!.requestOptions,
      ));
    }
  }

  @override
  Future<DataState<String>> logoutUser() {
    // TODO: implement logoutUser
    throw UnimplementedError();
  }

  @override
  Future<DataState> verifyLocalUsersCredential() async {
    try {
      final resp = await db.getUser();
      return DataSuccess(resp);
    } on DioException catch (e) {
      return DataError(e);
    }
  }

  @override
  Future<DataState> saveUserLoginInfoToLocal() {
    // TODO: implement saveUserLoginInfoToLocal
    throw UnimplementedError();
  }

  @override
  Future<DataState> getProfileDetails(String uid) async {
    // UserAuthDb auth = UserAuthDb();
    var id = uid;
    LoginModel? mods;
    // final res = await auth.getUser();
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

    try {
      final httpResp = await remoteServices.getProfileInfo(id, header);

      if (httpResp.response.statusCode == HttpStatus.ok) {
        log('Response Profile Data : ${httpResp.data}');
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
  Future<DataState> saveActPeriodToLocal() {
    // TODO: implement saveActPeriodToLocal
    throw UnimplementedError();
  }

  @override
  Future<DataState> saveProfileDetailsToLocal() {
    // TODO: implement saveProfileDetailsToLocal
    throw UnimplementedError();
  }

  @override
  Future<DataState> getAuthActPeriod(String dt, String loc) async {
    var params = RemoteLoginActPeriodModel(loc, dt);
    try {
      final httpResp = await remoteServices.getActPeriod(params);

      if (httpResp.response.statusCode == HttpStatus.ok) {
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
  Future<bool> checkTokenExpire() async {
    final user = await db.getUser();
    if (user != null && user.expaccess != null && user.expaccess != "") {
      DateTime now = DateTime.now();
      if (user.expaccess != null) {
        DateTime date =
            DateFormat("yyyy-MM-dd hh:mm:ss").parse(user.expaccess!);
        if ((date.difference(now).inSeconds - 10).isNegative) {
          return false;
        } else {
          return true;
        }
      } else {
        return false;
      }
    } else {
      return false;
    }
  }

  @override
  Future<bool> checkDeviceInfo() async {
    final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    bool? isNotPass;

    if (defaultTargetPlatform == TargetPlatform.android) {
      final androidInfo = await deviceInfo.androidInfo;
      if (isNotPass = !androidInfo.isPhysicalDevice) {
        return isNotPass;
      }
      return false;
    } else if (defaultTargetPlatform == TargetPlatform.iOS) {
      final iosInfo = await deviceInfo.iosInfo;
      if (isNotPass = !iosInfo.isPhysicalDevice &&
          await FlutterJailbreakDetection.jailbroken) {
        return isNotPass;
      }
      return false;
    } else {
      return false;
    }
  }
}

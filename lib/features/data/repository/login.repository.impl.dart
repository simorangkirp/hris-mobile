import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:intl/intl.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../../lib.dart';

class LoginRepositoryImpl implements UserAuthRepository {
  final String userNm, pwd;
  final LoginAPIServices _loginAPIServices;
  final UserAuthDb db;
  LoginRepositoryImpl(this._loginAPIServices, this.userNm, this.pwd, this.db);
  @override
  Future<DataState> loginUser(userNm, pwd) async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    var version = packageInfo.version;
    var build = packageInfo.buildNumber;
    var paramVer = 'v$build($version)';
    var params = LoginParam(userNm, pwd, paramVer, '1');
    try {
      final httpResp = await _loginAPIServices.loginUser(params);
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
    UserAuthDb auth = UserAuthDb();
    var id = uid;
    LoginModel? mods;
    final res = await auth.getUser();
    if (res != null) {
      mods = res;
    }
    var header = 'Bearer ${mods?.accesstoken}';

    try {
      final httpResp = await _loginAPIServices.profileInfo(id, header);

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
    var params = AuthScrnActPeriodParams(dt, loc);
    UserAuthDb auth = UserAuthDb();
    LoginModel? mods;
    final res = await auth.getUser();
    if (res != null) {
      mods = res;
    }
    var header = 'Bearer ${mods?.accesstoken}';
    try {
      final httpResp =
          await _loginAPIServices.profileScrnActPeriod(params, header);

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
        // convertStringToDateFormat(_login.expToken!, "dd-MMM-yyyy HH:mm:ss");
        if ((date.difference(now).inSeconds - 10).isNegative) {
          // await refreshToken(db);
          return false;
        } else {
          return true;
        }
      } else {
        return false;
      }
    } else {
      // throw UnauthorisedException('Session is Expired');
      return false;
    }
  }
}

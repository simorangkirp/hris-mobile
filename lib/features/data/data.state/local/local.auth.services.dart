import 'dart:convert';

// import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../lib.dart';

class UserAuthDb {
  Future saveUserLoginInfo(LoginModel login) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Map loginMap = login.toJson();
    String jsonBody = json.encode(loginMap);
    await prefs.setString('LoginInfo', jsonBody);
  }

  Future saveAuthInfo(AuthModel model) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Map dataMap = model.toMap();
    String jsonBody = json.encode(dataMap);
    await prefs.setString('AuthInfo', jsonBody);
  }

  Future saveIntro() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('intro', true);
  }

  Future getIntro() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.getBool('intro');
  }

  Future<AuthModel?> getAuth() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    AuthModel? log;
    try {
      String? jsonBody = prefs.getString('AuthInfo');
      if (jsonBody != null) {
        final map = json.decode(jsonBody) as Map<String, dynamic>;
        log = AuthModel.fromMap(map);
      }
    } catch (e) {
      throw Exception('Session is Expired');
    }

    return log;
  }

  Future<LoginModel?> getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    LoginModel? log;
    try {
      String? jsonBody = prefs.getString('LoginInfo');
      if (jsonBody != null) {
        final map = json.decode(jsonBody) as Map<String, dynamic>;
        log = LoginModel.fromJson(map);
      }
    } catch (e) {
      throw Exception('Session is Expired');
    }

    return log;
  }

  Future saveActPeriodInfo(ActivePeriodModel login) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Map loginMap = login.toJson();
    String jsonBody = json.encode(loginMap);
    await prefs.setString('ActPeriodInfo', jsonBody);
  }

  Future<ActivePeriodModel?> getActPeriod() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    ActivePeriodModel? log;
    try {
      String? jsonBody = prefs.getString('ActPeriodInfo');
      if (jsonBody != null) {
        final map = json.decode(jsonBody) as Map<String, dynamic>;
        log = ActivePeriodModel.fromJson(map);
      }
    } catch (e) {
      throw Exception('Session is Expired');
    }

    return log;
  }

  Future saveProfileDetailInfo(ProfileModel login) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Map loginMap = login.toJson();
    String jsonBody = json.encode(loginMap);
    await prefs.setString('ProfileDetailInfo', jsonBody);
  }

  Future<ProfileModel?> getProfileDetail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    ProfileModel? log;
    try {
      String? jsonBody = prefs.getString('ProfileDetailInfo');
      if (jsonBody != null) {
        final map = json.decode(jsonBody) as Map<String, dynamic>;
        log = ProfileModel.fromJson(map);
      }
    } catch (e) {
      throw Exception('Session is Expired');
    }

    return log;
  }

  // Future<Either<String, LoginModel?>> getUserLoginInfo() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   LoginModel? mod;
  //   try {
  //     String? jsonBody = prefs.getString('Login');
  //     if (jsonBody != null) {
  //       final map = json.decode(jsonBody) as Map<String, dynamic>;
  //       mod = LoginModel.fromJson(map);
  //     }
  //   } catch (e) {
  //     throw Left(e);
  //   }

  //   return Right(mod);
  // }

  Future onLogout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('LoginInfo');
  }

  Future dbClear() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}

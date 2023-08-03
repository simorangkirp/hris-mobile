import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:owl_hris/features/auth/data/models/login.model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserAuthDb {
  Future saveUserLoginInfo(LoginModel login) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Map loginMap = login.toJson();
    String jsonBody = json.encode(loginMap);

    await prefs.setString('LoginInfo', jsonBody);
  }

  Future<Either<String, LoginModel?>> getUserLoginInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    LoginModel? mod;
    try {
      String? jsonBody = prefs.getString('Login');
      if (jsonBody != null) {
        final map = json.decode(jsonBody) as Map<String, dynamic>;
        mod = LoginModel.fromJson(map);
      }
    } catch (e) {
      throw Left(e);
    }

    return Right(mod);
  }

  // Future saveUserInfo(UserModel user) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   Map userMap = user.toJson();
  //   String jsonBody = json.encode(userMap);

  //   await prefs.setString('UserInfo', jsonBody);
  // }

  // Future<Login?> getUser() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   Login? log;
  //   try {
  //     String? jsonBody = prefs.getString('Login');
  //     if (jsonBody != null) {
  //       final map = json.decode(jsonBody) as Map<String, dynamic>;
  //       log = Login.fromJson(map);
  //     }
  //   } catch (e) {
  //     throw InvalidSessionExpression('Session is Expired');
  //   }

  //   return log;
  // }

  // Future<UserModel?> getUserInfo() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   UserModel? log;
  //   try {
  //     String? jsonBody = prefs.getString('UserInfo');
  //     if (jsonBody != null) {
  //       final map = json.decode(jsonBody) as Map<String, dynamic>;
  //       log = UserModel.fromJson(map);
  //     }
  //   } catch (e) {
  //     throw InvalidSessionExpression('Session is Expired');
  //   }

  //   return log;
  // }

  Future dbClear() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}

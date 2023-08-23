import 'dart:convert';

// import 'package:dartz/dartz.dart';
import 'package:owl_hris/features/auth/data/models/login.model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserAuthDb {
  Future saveUserLoginInfo(LoginModel login) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Map loginMap = login.toJson();
    String jsonBody = json.encode(loginMap);
    await prefs.setString('LoginInfo', jsonBody);
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

  Future dbClear() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}

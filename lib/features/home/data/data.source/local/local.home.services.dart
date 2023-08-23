import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:owl_hris/lib.dart';

class ProfileInfoDb {
  Future saveUserInfo(ProfileModel login) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Map loginMap = login.toJson();
    String jsonBody = json.encode(loginMap);
    await prefs.setString('ProfileInfo', jsonBody);
  }

  Future<Either<String, ProfileModel?>> getUserInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    ProfileModel? mod;
    try {
      String? jsonBody = prefs.getString('Profile');
      if (jsonBody != null) {
        final map = json.decode(jsonBody) as Map<String, dynamic>;
        mod = ProfileModel.fromJson(map);
      }
    } catch (e) {
      throw Left(e);
    }

    return Right(mod);
  }

  Future dbClear() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
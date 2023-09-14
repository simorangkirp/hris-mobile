import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../lib.dart';

class AbsentDb {

  Future saveUserFace(MLUser user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Map faceMap = user.toJson();
    String jsonBody = json.encode(faceMap);
    await prefs.setString('LoginInfo', jsonBody);
  }


  Future<MLUser?> getUserFace() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    MLUser? model;
    try {
      String? jsonBody = prefs.getString('LoginInfo');
      if (jsonBody != null) {
        final map = json.decode(jsonBody) as Map<String, dynamic>;
        model = MLUser.fromJson(map);
      }
    } catch (e) {
      throw Exception('Session is Expired');
    }

    return model;
  }

  Future dbClear() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}

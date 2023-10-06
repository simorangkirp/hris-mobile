import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
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

class LocalAuthAPI {
  static final _auth = LocalAuthentication();

  static Future<bool> _canAuth() async =>
      await _auth.canCheckBiometrics || await _auth.isDeviceSupported();

  // static Future<bool> hasBiometrics() async {
  //   try {
  //     return await _auth.canCheckBiometrics;
  //   } on PlatformException catch (_) {
  //     return false;
  //   }
  // }

  static Future<bool> authenticate() async {
    try {
      if (!await _canAuth()) return false;
      return await _auth.authenticate(
          localizedReason: 'Scan fingerprint to authenticate.',
          options: const AuthenticationOptions(
            sensitiveTransaction: true,
            stickyAuth: true,
            useErrorDialogs: true,
          ));
    } on PlatformException catch (_) {
      return false;
    }
    // final isAvailable = await hasBiometrics();
    // if (!isAvailable) return false;
    // try {
    //   return await _auth.authenticate(
    //     localizedReason: 'Scan fingerprint to authenticate.',
    //     options: const AuthenticationOptions(
    //       stickyAuth: true,
    //       useErrorDialogs: true,
    //     ),
    //   );
    // } on PlatformException catch (_) {
    //   return false;
    // }
  }
}

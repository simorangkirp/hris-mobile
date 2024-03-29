import '../../../../lib.dart';

class AuthModel {
  String? unm;
  String? pw;

  AuthModel({
    this.unm,
    this.pw,
  });

  AuthModel.fromMap(Map<String, dynamic> json) {
    unm = json["unm"];
    pw = json["pw"];
  }

  Map<String, dynamic> toMap() => {
        "unm": unm,
        "pw": pw,
      };
}

class LoginModel extends LoginEntity {
  const LoginModel({
    required String userid,
    required String uid,
    required String ipuser,
    required String expaccess,
    required String accesstoken,
    required String refreshtoken,
    required String activeVersion,
  });

  LoginModel.fromJson(Map<String, dynamic> map)
      : super(
          userid: map['userid'] ?? "",
          uid: map['uid'] ?? "",
          ipuser: map['ipuser'] ?? "",
          expaccess: map['exp_access'] ?? "",
          accesstoken: map['access_token'] ?? "",
          refreshtoken: map['refresh_token'] ?? "",
          activeVersion: map['activeVersion'] ?? "",
        );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['userid'] = userid ?? "";
    data['uid'] = uid ?? "";
    data['ipuser'] = ipuser ?? "";
    data['exp_access'] = expaccess ?? "";
    data['access_token'] = accesstoken ?? "";
    data['refresh_token'] = refreshtoken ?? "";
    data['activeVersion'] = activeVersion ?? "";
    return data;
  }
  // factory LoginModel.fromJson(Map<String, dynamic> map) {
  //   return LoginModel(
  //     userid: map['userid'] ?? "",
  //     uid: map['uid'] ?? "",
  //     ipuser: map['ipuser'] ?? "",
  //     expaccess: map['exp_access'] ?? "",
  //     accesstoken: map['access_token'] ?? "",
  //     refreshtoken: map['refresh_token'] ?? "",
  //   );
  // }
}

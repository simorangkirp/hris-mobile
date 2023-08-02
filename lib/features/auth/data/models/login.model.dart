import 'package:owl_hris/features/auth/domain/entities/login.dart';

class LoginModel extends LoginEntity {
  const LoginModel({
    String? userid,
    String? uid,
    String? ipuser,
    String? expaccess,
    String? accesstoken,
    String? refreshtoken,
  });

  factory LoginModel.fromJson(Map<String, dynamic> map) {
    return LoginModel(
      userid: map['userid'] ?? "",
      uid: map['uid'] ?? "",
      ipuser: map['ipuser'] ?? "",
      expaccess: map['exp_access'] ?? "",
      accesstoken: map['access_token'] ?? "",
      refreshtoken: map['refresh_token'] ?? "",
    );
  }
}

// class LoginSubmit {
//   const LoginSubmit({
//     String? id,
//     String? pw,
//   });
//   factory LoginSubmit.fromJson(Map<String, dynamic> map) {
//     return LoginSubmit(
//       id: map['username'] ?? "",
//       pw: map['password'] ?? "",
//     );
//   }
// }

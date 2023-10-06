import 'package:equatable/equatable.dart';

class LoginEntity extends Equatable {
  final String? userid;
  final String? uid;
  final String? ipuser;
  final String? expaccess;
  final String? accesstoken;
  final String? refreshtoken;

  const LoginEntity({
    this.userid,
    this.uid,
    this.ipuser,
    this.expaccess,
    this.accesstoken,
    this.refreshtoken,
  });

  @override
  List<Object?> get props {
    return [
      userid,
      uid,
      ipuser,
      expaccess,
      accesstoken,
      refreshtoken,
    ];
  }
}

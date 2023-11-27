import 'package:equatable/equatable.dart';

abstract class PasswordEvent {
  const PasswordEvent();
}

class InitPassword extends PasswordEvent {}

class SettingReqOTP extends PasswordEvent {
  String param;
  SettingReqOTP(this.param);
}

class SettingChangePwd extends PasswordEvent {
  String oldP;
  String newP;
  String otp;
  SettingChangePwd(this.oldP, this.newP, this.otp);
}

class SettingChgPwdModel extends Equatable {
  final String oldP;
  final String newP;
  final String otp;
  const SettingChgPwdModel(this.oldP, this.newP, this.otp);

  @override
  List<Object?> get props => [oldP, newP, otp];
}

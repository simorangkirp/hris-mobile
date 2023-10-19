import '../../../domain/usecases/login.usecase.dart';

abstract class AuthEvent {
  const AuthEvent();
}

class InitAuth extends AuthEvent {}

class SubmitLogin extends AuthEvent {
  LoginParams model;
  SubmitLogin(this.model);
}

class AuthGetProfileDetail extends AuthEvent {}

class AuthCheckToken extends AuthEvent {}

class AuthGetActPeriod extends AuthEvent {
  String dt;
  String lokasiTugas;
  AuthGetActPeriod(this.dt, this.lokasiTugas);
}

class OnLogOut extends AuthEvent {}

class DisplayLogoutDialog extends AuthEvent {
  String nm;
  DisplayLogoutDialog(this.nm);
}

class AuthCancelLogout extends AuthEvent {}

class AuthCheckDeviceInfo extends AuthEvent {}

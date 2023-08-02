import '../../domain/usecases/login.usecase.dart';

abstract class AuthEvent {
  const AuthEvent();
}

class InitAuth extends AuthEvent {}

class SubmitLogin extends AuthEvent {
  LoginParams model;
  SubmitLogin(this.model);
}

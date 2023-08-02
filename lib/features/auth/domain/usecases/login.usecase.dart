// import 'package:dartz/dartz.dart';
// import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:owl_hris/core/resources/data.state.dart';
import 'package:owl_hris/core/usecases/usecases.dart';
import 'package:owl_hris/features/auth/domain/repository/login.repository.dart';

// import '../../../../core/error/failures.dart';

class LoginUserUseCase extends UseCase<DataState, LoginParams> {
  final UserAuthRepository _loginRepo;
  LoginUserUseCase(this._loginRepo);
  @override
  Future<DataState> call(LoginParams params) async {
    var res = await _loginRepo.loginUser(params.unm, params.pw);
    return res;
  }
}

class LoginParams extends Equatable {
  final String unm;
  final String pw;

  const LoginParams({required this.unm, required this.pw});

  @override
  List<Object> get props => [unm, pw];
}

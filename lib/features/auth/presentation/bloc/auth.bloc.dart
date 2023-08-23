import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../lib.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUserUseCase _loginUseCase;

  AuthBloc(this._loginUseCase) : super(const AuthLoading()) {
    on<InitAuth>(onInit);
    on<SubmitLogin>(onLoginUser);
  }

  void onLoginUser(SubmitLogin event, Emitter<AuthState> emit) async {
    emit(const AuthLoading());
    final dataState = await _loginUseCase.call(event.model);
    if (dataState is DataSuccess) {
      var data = LoginModel.fromJson(dataState.data);
      log('Data Auth: $data');
      //! Add Process To Save Data Locally
      // await Future.delayed(const Duration(seconds: 3));
      log('Saving User Credential');
      sl<UserAuthDb>().saveUserLoginInfo(data);
      log('Saving Successfully');
      emit(ProccessDone(data));
    }
    if (dataState is DataError) {
      var err = ErrMsg.fromJson(dataState.error!.response!.data);
      emit(AuthError(err));
    }
  }

  void onInit(InitAuth event, Emitter<AuthState> emit) async {
    emit(AuthInitiallized());
  }
}

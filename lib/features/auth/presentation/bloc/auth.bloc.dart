import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:owl_hris/core/resources/data.state.dart';
import 'package:owl_hris/features/auth/presentation/bloc/auth.event.dart';
import 'package:owl_hris/features/auth/presentation/bloc/auth.state.dart';

import '../../domain/usecases/login.usecase.dart';

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
      //! Add Process To Save Data Locally
      // await
      await Future.delayed(const Duration(seconds: 3));
      emit(ProccessDone(dataState.data!));
    }
    if (dataState is DataError) {
      emit(AuthError(dataState.error!));
    }
  }

  void onInit(InitAuth event, Emitter<AuthState> emit) async {
    emit(AuthInitiallized());
  }
}

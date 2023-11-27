import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../lib.dart';

class PasswordBloc extends Bloc<PasswordEvent, PasswordState> {
  final SettingReqOtp _reqOTPUsecase;
  final SettingChangePwdUseCase _chgPwdUsecase;

  PasswordBloc(
    this._reqOTPUsecase,
    this._chgPwdUsecase,
  ) : super(const PasswordLoading()) {
    on<InitPassword>(onInit);
    on<SettingReqOTP>(onReqOTP);
    on<SettingChangePwd>(onChgPwd);
  }

  void onInit(InitPassword event, Emitter<PasswordState> emit) async {
    emit(PasswordInitiallized());
  }

  void onReqOTP(SettingReqOTP event, Emitter<PasswordState> emit) async {
    emit(const OTPLoading());
    final dataState = await _reqOTPUsecase.call(event.param);
    if (dataState is DataSuccess) {
      if (dataState.data != null) {
        var data = '';
        emit(PasswordOTPResponed(data));
      }
    }
    if (dataState is DataError) {
      var msg = '';
      if (dataState.error != null &&
          dataState.error!.response != null &&
          dataState.error!.response!.data != null) {
        msg = dataState.error!.response!.data['messages']['error'];
      } else {
        msg = 'Error';
      }
      emit(PasswordError(msg));
    }
  }

  void onChgPwd(SettingChangePwd event, Emitter<PasswordState> emit) async {
    emit(const PasswordLoading());
    final dataState = await _chgPwdUsecase
        .call(SettingChgPwdModel(event.oldP, event.newP, event.otp));
    if (dataState is DataSuccess) {
      if (dataState.data != null) {
        var data = '';
        emit(PasswordSuccessReset(data));
      }
    }
    if (dataState is DataError) {
      var msg = '';
      if (dataState.error != null &&
          dataState.error!.response != null &&
          dataState.error!.response!.data != null) {
        msg = dataState.error!.response!.data['messages']['error'];
      } else {
        msg = 'Error';
      }
      emit(PasswordError(msg));
    }
  }
}

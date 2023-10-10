import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../lib.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUserUseCase _loginUseCase;
  final AuthGetProfileDataDetails _profileDetailUseCase;
  final AuthGetActPeriodUseCase _actPeriodUseCase;
  final AuthCheckTokenExp _tokenUsecase;

  AuthBloc(
    this._loginUseCase,
    this._profileDetailUseCase,
    this._actPeriodUseCase,
    this._tokenUsecase,
  ) : super(const AuthLoading()) {
    on<InitAuth>(onInit);
    on<SubmitLogin>(onLoginUser);
    on<AuthGetProfileDetail>(onGetProfileDataDetail);
    on<AuthGetActPeriod>(onGetActPeriodData);
    on<AuthCheckToken>(checkToken);
    on<OnLogOut>(onLogOut);
    on<DisplayLogoutDialog>(onDisplayDialog);
    on<AuthCancelLogout>(onCancel);
  }

  void onLoginUser(SubmitLogin event, Emitter<AuthState> emit) async {
    emit(const AuthLoading());
    final dataState = await _loginUseCase.call(event.model);
    String unm = event.model.unm;
    String pw = event.model.pw;
    if (dataState is DataSuccess) {
      var data = LoginModel.fromJson(dataState.data);
      log('Data Auth: $data');
      //! Add Process To Save Data Locally
      // await Future.delayed(const Duration(seconds: 3));
      log('Saving User Credential');
      sl<UserAuthDb>().saveUserLoginInfo(data);
      sl<UserAuthDb>().saveAuthInfo(AuthModel(unm: unm, pw: pw));
      log('Saving Successfully');
      emit(UserAuthGranted());
    }
    if (dataState is DataError) {
      var err = ErrMsg.fromJson(dataState.error!.response!.data);
      emit(AuthError(err));
    }
  }

  void onInit(InitAuth event, Emitter<AuthState> emit) async {
    emit(AuthInitiallized());
  }

  void onGetProfileDataDetail(
      AuthGetProfileDetail event, Emitter<AuthState> emit) async {
    emit(const AuthLoading());
    var uid = '';
    UserAuthDb auth = UserAuthDb();
    final res = await auth.getUser();
    if (res != null) {
      uid = res.uid!;
    }
    final dataState = await _profileDetailUseCase.call(GetProfileParams(uid));
    if (dataState is DataSuccess) {
      if (dataState.data != null) {
        var begin = dataState.data['data'] as Map<String, dynamic>;
        log('$begin');
        var data = ProfileModel.fromJson(begin);
        log('Profile Data: $data');
        log('========================');
        log('Saving Profile Data Details');
        sl<UserAuthDb>().saveProfileDetailInfo(data);
        log('saving done');
        log('========================');
        emit(AuthDetailProfileLoaded(data));
      }
    }
    if (dataState is DataError) {
      emit(const AuthStrMsg('Error'));
    }
  }

  void onGetActPeriodData(
      AuthGetActPeriod event, Emitter<AuthState> emit) async {
    emit(const AuthLoading());
    final dataState = await _actPeriodUseCase
        .call(GetActPeriodParams(event.dt, event.lokasiTugas));
    if (dataState is DataSuccess) {
      if (dataState.data != null) {
        var begin = dataState.data['data'] as Map<String, dynamic>;
        log('$begin');
        var data = ActivePeriodModel.fromJson(begin);
        log('Active Period: $data');
        log('Profile Data: $data');
        log('========================');
        log('Saving Active Period');
        sl<UserAuthDb>().saveActPeriodInfo(data);
        log('saving done');
        log('========================');
        emit(AuthActPeriodLoaded(data));
      }
    }
    if (dataState is DataError) {
      emit(const AuthStrMsg('Error'));
    }
  }

  void checkToken(AuthCheckToken event, Emitter<AuthState> emit) async {
    final state = await _tokenUsecase(NoParams());
    UserAuthDb auth = UserAuthDb();
    var authInfo = await auth.getAuth();
    emit(AuthTokenChecked(state, authInfo ?? AuthModel()));
  }

  void onLogOut(OnLogOut event, Emitter<AuthState> emit) async {
    sl<UserAuthDb>().dbClear();
    emit(OnLogOutSuccess());
  }

  void onDisplayDialog(DisplayLogoutDialog event, Emitter<AuthState> emit) {
    emit(ShowLogoutDialog());
  }

  void onCancel(AuthCancelLogout event, Emitter<AuthState> emit) {
    emit(AuthCancelSuccess());
  }
}

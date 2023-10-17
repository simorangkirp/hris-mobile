import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../lib.dart';

class AbsentBloc extends Bloc<AbsentEvent, AbsentState> {
  final AbsentUsecaseGetActPeriod actPeriod;
  final GetUserCurrentPeriodAbsentList getCurrPeriodAbsnt;
  final GetListCameraClockIn getCameraList;
  final GetUserAssignLocationUseCase userAssignLocUsecase;
  final SubmitUserAbsentUseCase submitUserAbsent;
  final AbsentUsecaseGetUserInfo getUserInfoUsecase;
  final AbsentCheckPINUseCase checkPINUsecase;
  final GetHolidayListUsecase getHolidayUsecase;

  AbsentBloc(
    this.getCurrPeriodAbsnt,
    this.getCameraList,
    this.actPeriod,
    this.submitUserAbsent,
    this.userAssignLocUsecase,
    this.getUserInfoUsecase,
    this.checkPINUsecase,
    this.getHolidayUsecase,
  ) : super(AbsentLoading()) {
    on<InitAbsent>(onInit);
    on<InitCamera>(initClockInCamera);
    on<GetAbsentPeriod>(getAbsentListPeriod);
    on<AbsentScrnActPeriod>(getActPeriod);
    on<SubmitUserAbsent>(submitAbsent);
    on<GetUserAssignLocation>(getUserAssignLoc);
    on<AbsentGetUserInfo>(getUserInfo);
    on<AbsentCheckPin>(checkUserPIN);
    on<AbsentHolidayList>(getHoliday);
    // on<SubmitLogin>(onLoginUser);
  }

  void onInit(InitAbsent event, Emitter<AbsentState> emit) async {
    emit(AbsentInitiallized());
  }

  void initClockInCamera(InitCamera event, Emitter<AbsentState> emit) async {
    emit(AbsentLoading());
    final listCamera = await getCameraList.call(NoParams());
    if (listCamera.isNotEmpty) {
      emit(ClockInCameraInitiallized(listCamera));
    } else {
      emit(const AbsentError('Error'));
    }
  }

  void getAbsentListPeriod(
      GetAbsentPeriod event, Emitter<AbsentState> emit) async {
    emit(AbsentLoading());
    UserAuthDb auth = UserAuthDb();
    final res = await auth.getUser();

    final dataState = await getCurrPeriodAbsnt.call(
        ListAbsentParam(uid: res?.uid ?? '', period: event.dt, onmobile: '1'));
    if (dataState is DataSuccess) {
      List<AbsentListModel> list = [];
      var listAbsent = dataState.data['data'];
      if (dataState.data['data'] is List) {
        for (var i in (listAbsent as List)) {
          list.add(AbsentListModel.fromJson(i));
        }
      }
      if (list.isNotEmpty) {
        emit(AbsentPeriodLoaded(list));
      } else {
        emit(DataStateError(dataState.error!));
      }
    }
  }

  void getActPeriod(
      AbsentScrnActPeriod event, Emitter<AbsentState> emit) async {
    // String errMsg = '';
    emit(AbsentLoading());
    final dataState = await actPeriod.call(NoParams());
    if (dataState is DataSuccess) {
      if (dataState.data != null) {
        emit(AbsentScrnActPeriodLoaded(dataState.data));
      }
    }
  }

  void submitAbsent(SubmitUserAbsent event, Emitter<AbsentState> emit) async {
    emit(AbsentLoading());
    String msg = '';
    final dataState = await submitUserAbsent.call(SubmitUserAbsentParams(
      event.params.date,
      event.params.period,
      event.params.absent,
      event.params.inoutmode,
      event.params.hr,
      event.params.coordinate,
      event.params.photo,
      event.params.desc,
      event.params.source,
      event.params.coorphoto,
    ));
    if (dataState is DataSuccess) {
      if (dataState.data != null) {
        log(dataState.data.toString());
        msg = dataState.data['messages'];
        log(msg);
        emit(UserAbsentSubmitted(msg));
      }
    }
    if (dataState is DataError) {
      if (dataState.error != null) {
        if (dataState.error!.message == 'Lokasi di luar wilayah HO.') {
          msg = dataState.error!.message!;
        } else if (dataState.error!.response != null) {
          if (dataState.error!.response!.data != null) {
            var data = dataState.error!.response!.data as Map<String, dynamic>;
            msg = data['messages']['error'];
            log(msg);
          }
        }
      } else {
        msg = "The request returned an invalid status code of 400.";
      }
      emit(AbsentSubmitAbsentError(msg));
    }
  }

  void getUserAssignLoc(
      GetUserAssignLocation event, Emitter<AbsentState> emit) async {
    emit(AbsentLoading());
    String errMsg = '';
    final dataState = await userAssignLocUsecase.call(NoParams());
    if (dataState is DataSuccess) {
      if (dataState.data != null) {
        var begin = dataState.data['data'] as Map<String, dynamic>;
        var data = UserAssignLocationModel.fromMap(begin);
        emit(UserAssignLocLoaded(data));
      }
    }
    if (dataState is DataError) {
      if (dataState.error != null) {
        if (dataState.error!.response != null) {
          if (dataState.error!.response!.data != null) {
            errMsg = dataState.error!.response!.data['messages'];
          }
        }
      } else {
        errMsg = "The request returned an invalid status code of 400.";
      }
      emit(AbsentUserAssignLocError(errMsg));
    }
  }

  void getUserInfo(AbsentGetUserInfo event, Emitter<AbsentState> emit) async {
    emit(AbsentLoading());
    final dataState = await getUserInfoUsecase.call(NoParams());
    if (dataState is DataSuccess) {
      if (dataState.data != null) {
        emit(AbsentUserInfoLoaded(dataState.data));
      }
    }
  }

  void checkUserPIN(AbsentCheckPin event, Emitter<AbsentState> emit) async {
    String errMsg = '';
    final dataState = await checkPINUsecase.call(event.pin);
    if (dataState is DataSuccess) {
      if (dataState.data != null) {
        errMsg = dataState.data['messages'];
        emit(AbsentPINChecked(errMsg));
      }
    }
    if (dataState is DataError) {
      if (dataState.error != null) {
        if (dataState.error!.response != null) {
          if (dataState.error!.response!.data != null) {
            errMsg = dataState.error!.response!.data['messages']['error'];
          }
        }
      } else {
        errMsg = "The request returned an invalid status code of 400.";
      }
      emit(AbsentPINChecked(errMsg));
    }
  }

  void getHoliday(AbsentHolidayList event, Emitter<AbsentState> emit) async {
    String errMsg = '';
    final dataState = await getHolidayUsecase.call(NoParams());
    if (dataState is DataSuccess) {
      List<HolidayModel> list = [];
      var listAbsent = dataState.data['data'];
      if (dataState.data['data'] is List) {
        for (var i in (listAbsent as List)) {
          list.add(HolidayModel.fromMap(i));
        }
      }
      emit(AbsentListHolidayLoaded(list));
    }
    if (dataState is DataError) {
      if (dataState.error != null) {
        if (dataState.error!.response != null) {
          if (dataState.error!.response!.data != null) {
            errMsg = dataState.error!.response!.data['messages']['error'];
          }
        }
      } else {
        errMsg = "The request returned an invalid status code of 400.";
      }
      emit(AbsentError(errMsg));
    }
  }
}

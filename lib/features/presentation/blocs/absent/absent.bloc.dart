import 'dart:convert';
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../../lib.dart';

class AbsentBloc extends Bloc<AbsentEvent, AbsentState> {
  final AuthGetActPeriodUseCase actPeriod;
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
    on<AbsentAddComment>(addComment);
    on<AbsentRemoveComment>(removeComment);
  }

  void addComment(AbsentAddComment event, Emitter<AbsentState> emit) async {
    emit(AbsentCommentAdded());
  }

  void removeComment(
      AbsentRemoveComment event, Emitter<AbsentState> emit) async {
    emit(AbsentCommentRemoved());
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
        return;
      } else {
        emit(DataStateError(dataState.error!));
        return;
      }
    }
    if (dataState is DataError) {
      var msg = '';
      if (dataState.error != null) {
        if (dataState.error!.response != null) {
          if (dataState.error!.response!.data != null) {
            var data = dataState.error!.response!.data as Map<String, dynamic>;
            if (data['status'] == 401) {
              msg = data['messages'];
              emit(AbsentInvalidVersion(msg));
              return;
            } else {
              msg = data['messages'];
              log(msg);
            }
          }
        }
      } else {
        msg = "The request returned an invalid status code of 400.";
        emit(AbsentError(msg));
        return;
      }
    }
  }

  void getActPeriod(
      AbsentScrnActPeriod event, Emitter<AbsentState> emit) async {
    // String errMsg = '';
    emit(AbsentLoading());
    var dt = DateFormat('yyyy-MM-dd').format(DateTime.now()).toString();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? jsonBody = prefs.getString('ProfileDetailInfo');
    ProfileModel? log;
    if (jsonBody != null) {
      final map = json.decode(jsonBody) as Map<String, dynamic>;
      log = ProfileModel.fromJson(map);
    }
    final dataState =
        await actPeriod.call(GetActPeriodParams(dt, log?.lokasitugas ?? "-"));
    if (dataState is DataSuccess) {
      if (dataState.data != null) {
        var begin = dataState.data['data'] as Map<String, dynamic>;
        var data = ActivePeriodModel.fromJson(begin);
        emit(AbsentScrnActPeriodLoaded(data));
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
        return;
      }
    }
    if (dataState is DataError) {
      if (dataState.error != null) {
        if (dataState.error!.message == 'Lokasi di luar wilayah HO.') {
          msg = dataState.error!.message!;
        } else if (dataState.error!.response != null) {
          if (dataState.error!.response!.data != null) {
            var data = dataState.error!.response!.data as Map<String, dynamic>;
            if (data['status'] == 401) {
              msg = data['messages'];
              emit(AbsentInvalidVersion(msg));
              return;
            } else {
              msg = data['messages']['error'];
              log(msg);
            }
          }
        }
      } else {
        msg = "The request returned an invalid status code of 400.";
      }
      emit(AbsentSubmitAbsentError(msg));
      return;
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
        return;
      }
    }
    if (dataState is DataError) {
      if (dataState.error != null) {
        if (dataState.error!.response != null) {
          if (dataState.error!.response!.data != null) {
            var data = dataState.error!.response!.data as Map<String, dynamic>;
            if (data['status'] == 401) {
              errMsg = data['messages'];
              emit(AbsentInvalidVersion(errMsg));
              return;
            } else {
              errMsg = dataState.error!.response!.data['message'];
              log(errMsg);
            }
          }
        }
      } else {
        errMsg = "The request returned an invalid status code of 400.";
      }
      emit(AbsentUserAssignLocError(errMsg));
      return;
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
        return;
      }
    }
    if (dataState is DataError) {
      if (dataState.error != null) {
        if (dataState.error!.response != null) {
          if (dataState.error!.response!.data != null) {
            var data = dataState.error!.response!.data as Map<String, dynamic>;
            if (data['status'] == 401) {
              errMsg = data['messages'];
              emit(AbsentInvalidVersion(errMsg));
              return;
            } else {
              errMsg = dataState.error!.response!.data['messages']['error'];
              log(errMsg);
            }
          }
        }
      } else {
        errMsg = "The request returned an invalid status code of 400.";
      }
      emit(AbsentPINChecked(errMsg));
      return;
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
      return;
    }
    if (dataState is DataError) {
      if (dataState.error != null) {
        if (dataState.error!.response != null) {
          if (dataState.error!.response!.data != null) {
            var data = dataState.error!.response!.data as Map<String, dynamic>;
            if (data['status'] == 401) {
              errMsg = data['messages'];
              emit(AbsentInvalidVersion(errMsg));
              return;
            } else {
              errMsg = dataState.error!.response!.data['messages']['error'];
              log(errMsg);
            }
          }
        }
      } else {
        errMsg = "The request returned an invalid status code of 400.";
      }
      emit(AbsentError(errMsg));
      return;
    }
  }
}

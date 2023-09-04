import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../lib.dart';

class AbsentBloc extends Bloc<AbsentEvent, AbsentState> {
  final GetProfileScreenActPeriod actPeriod;
  final GetUserCurrentPeriodAbsentList getCurrPeriodAbsnt;
  final GetListCameraClockIn getCameraList;

  AbsentBloc(
    this.getCurrPeriodAbsnt,
    this.getCameraList,
    this.actPeriod,
  ) : super(AbsentLoading()) {
    on<InitAbsent>(onInit);
    on<InitCamera>(initClockInCamera);
    on<GetAbsentPeriod>(getAbsentListPeriod);
    on<AbsentScrnActPeriod>(getActPeriod);
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

    final dataState = await getCurrPeriodAbsnt
        .call(ListAbsentParam(uid: res?.uid ?? '', period: event.dt, onmobile: '1'));
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
         final dataState = await actPeriod.call(GetActPeriodParams(event.dt, event.lokasiTugas));
    if (dataState is DataSuccess) {
      if (dataState.data != null) {
        var begin = dataState.data['data'] as Map<String, dynamic>;
        log('$begin');
        var data = ActivePeriodModel.fromJson(begin);
        log('Absent Active Period: $data');
        emit(AbsentScrnActPeriodLoaded(data));
      }
    }
    if (dataState is DataError) {
      emit(const AbsentError('Error'));
    }

      }
}

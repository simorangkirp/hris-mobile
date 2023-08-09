import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:owl_hris/core/resources/data.state.dart';
import 'package:owl_hris/core/usecases/usecases.dart';
import 'package:owl_hris/features/absen/presentation/bloc/absent.event.dart';
import 'package:owl_hris/features/absen/presentation/bloc/absent.state.dart';

import '../../data/models/absent.list.model.dart';
import '../../domain/usecases/absent.usecases.dart';

class AbsentBloc extends Bloc<AbsentEvent, AbsentState> {
  final GetUserCurrentPeriodAbsentList getCurrPeriodAbsnt;
  final GetListCameraClockIn getCameraList;

  AbsentBloc(
    this.getCurrPeriodAbsnt,
    this.getCameraList,
  ) : super(AbsentLoading()) {
    on<InitAbsent>(onInit);
    on<InitCamera>(initClockInCamera);
    on<GetAbsentPeriod>(getAbsentListPeriod);
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
    final dataState = await getCurrPeriodAbsnt.call(ListAbsentParam(
        uid: event.uid, period: event.dt, onmobile: event.onmobile));
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
}

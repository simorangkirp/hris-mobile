import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:owl_hris/core/usecases/usecases.dart';
import 'package:owl_hris/features/absen/presentation/bloc/absent.event.dart';
import 'package:owl_hris/features/absen/presentation/bloc/absent.state.dart';

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
      emit(AbsentError('Error'));
    }
  }
}

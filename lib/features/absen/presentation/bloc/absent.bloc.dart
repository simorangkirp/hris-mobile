import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:owl_hris/features/absen/presentation/bloc/absent.event.dart';
import 'package:owl_hris/features/absen/presentation/bloc/absent.state.dart';

import '../../domain/usecases/absent.usecases.dart';

class AbsentBloc extends Bloc<AbsentEvent, AbsentState> {
  final GetUserCurrenPeriodAbsentList getCurrPeriodAbsnt;

  AbsentBloc(this.getCurrPeriodAbsnt) : super(AbsentLoading()) {
    on<InitAbsent>(onInit);
    // on<SubmitLogin>(onLoginUser);
  }

  // void onLoginUser(SubmitLogin event, Emitter<AbsentState> emit) async {
  //   emit(const AuthLoading());
  //   final dataState = await _loginUseCase.call(event.model);
  //   if (dataState is DataSuccess) {
  //     //! Add Process To Save Data Locally
  //     // await
  //     await Future.delayed(const Duration(seconds: 3));
  //     emit(ProccessDone(dataState.data!));
  //   }
  //   if (dataState is DataError) {
  //     emit(AuthError(dataState.error!));
  //   }
  // }

  void onInit(InitAbsent event, Emitter<AbsentState> emit) async {
    emit(AbsentInitiallized());
  }
}

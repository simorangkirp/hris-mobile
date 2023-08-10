// import 'package:equatable/equatable.dart';

// abstract class AbsentState extends Equatable {
//   final LoginEntity? user;
//   final DioException? error;
//   const AbsentState({this.user, this.error});
//   @override
//   List<Object> get props => [user!, error!];
// }
import 'package:camera/camera.dart';
import 'package:equatable/equatable.dart';
import 'package:dio/dio.dart';

import '../../domain/entities/absent.dart';

abstract class AbsentState extends Equatable {
  final DioException? error;
  final List<AbsentEntity>? listAbsent;
  final List<CameraDescription>? listCamera;
  final String? errMsg;
  const AbsentState(
      {this.error, this.listAbsent, this.listCamera, this.errMsg});

  @override
  List<Object> get props => [error!, listAbsent!, listCamera!, errMsg!];
}

class AbsentLoading extends AbsentState {
  // const AbsentLoading();
}

class AbsentInitiallized extends AbsentState {}

class AbsentProccessDone extends AbsentState {
  // const ProccessDone(LoginEntity usr) : super(user: usr);
}

class DataStateError extends AbsentState {
  const DataStateError(DioException err) : super(error: err);
}

class AbsentError extends AbsentState {
  const AbsentError(String err) : super(errMsg: err);
  // const AbsentError(DioException err) : super(error: err);
}

class ClockInCameraInitiallized extends AbsentState {
  const ClockInCameraInitiallized(List<CameraDescription> listCamera)
      : super(listCamera: listCamera);
}

class AbsentPeriodLoaded extends AbsentState {
  const AbsentPeriodLoaded(List<AbsentEntity> list) : super(listAbsent: list);
}

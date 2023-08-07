// import 'package:equatable/equatable.dart';

// abstract class AbsentState extends Equatable {
//   final LoginEntity? user;
//   final DioException? error;
//   const AbsentState({this.user, this.error});
//   @override
//   List<Object> get props => [user!, error!];
// }
import 'package:camera/camera.dart';

class AbsentState {}

class AbsentLoading extends AbsentState {
  // const AbsentLoading();
}

class AbsentInitiallized extends AbsentState {}

class ProccessDone extends AbsentState {
  // const ProccessDone(LoginEntity usr) : super(user: usr);
}

class AbsentError extends AbsentState {
  String err;
  AbsentError(this.err);
  // const AbsentError(DioException err) : super(error: err);
}

class ClockInCameraInitiallized extends AbsentState {
  List<CameraDescription> listCamera;
  ClockInCameraInitiallized(this.listCamera);
}

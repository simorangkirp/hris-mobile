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

import '../../../../../lib.dart';

abstract class AbsentState extends Equatable {
  final DioException? error;
  final List<AbsentEntity>? listAbsent;
  final List<CameraDescription>? listCamera;
  final ActivePeriodEntity? period;
  final UserAssignLocationModel? assignLoc;
  final ProfileModel? profileModel;
  final String? errMsg, msg;
  final List<HolidayModel>? listHoliday;
  final String? invalidVerMsg;
  // final bool? comment;
  const AbsentState({
    this.error,
    this.listAbsent,
    this.listCamera,
    this.errMsg,
    this.msg,
    this.period,
    this.assignLoc,
    this.profileModel,
    this.listHoliday,
    this.invalidVerMsg,
    // this.comment,
  });

  @override
  List<Object> get props => [
        // error!,
        // listAbsent!,
        // listCamera!,
        // errMsg!,
        // assignLoc!,
      ];
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

class AbsentActPeriodError extends AbsentState {
  const AbsentActPeriodError(String err) : super(errMsg: err);
}

class AbsentSubmitAbsentError extends AbsentState {
  const AbsentSubmitAbsentError(String err) : super(errMsg: err);
}

class AbsentUserAssignLocError extends AbsentState {
  const AbsentUserAssignLocError(String err) : super(errMsg: err);
}

class ClockInCameraInitiallized extends AbsentState {
  const ClockInCameraInitiallized(List<CameraDescription> listCamera)
      : super(listCamera: listCamera);
}

class AbsentPeriodLoaded extends AbsentState {
  const AbsentPeriodLoaded(List<AbsentEntity> list) : super(listAbsent: list);
}

class AbsentScrnActPeriodLoaded extends AbsentState {
  const AbsentScrnActPeriodLoaded(ActivePeriodEntity data)
      : super(period: data);
}

class UserAssignLocLoaded extends AbsentState {
  const UserAssignLocLoaded(UserAssignLocationModel data)
      : super(assignLoc: data);
}

class UserAbsentSubmitted extends AbsentState {
  const UserAbsentSubmitted(String data) : super(msg: data);
}

class AbsentUserInfoLoaded extends AbsentState {
  const AbsentUserInfoLoaded(ProfileModel data) : super(profileModel: data);
}

class AbsentPINChecked extends AbsentState {
  const AbsentPINChecked(String data) : super(msg: data);
}

class AbsentListHolidayLoaded extends AbsentState {
  const AbsentListHolidayLoaded(List<HolidayModel> data)
      : super(listHoliday: data);
}

class AbsentCommentAdded extends AbsentState {}

class AbsentCommentRemoved extends AbsentState {}

class AbsentInvalidVersion extends AbsentState {
  const AbsentInvalidVersion(String data) : super(invalidVerMsg: data);
}

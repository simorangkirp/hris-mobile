// import 'package:equatable/equatable.dart';

// abstract class AbsentState extends Equatable {
//   final LoginEntity? user;
//   final DioException? error;
//   const AbsentState({this.user, this.error});
//   @override
//   List<Object> get props => [user!, error!];
// }
class AbsentState {}

class AbsentLoading extends AbsentState {
  // const AbsentLoading();
}

class AbsentInitiallized extends AbsentState {}

class ProccessDone extends AbsentState {
  // const ProccessDone(LoginEntity usr) : super(user: usr);
}

class AbsentError extends AbsentState {
  // const AbsentError(DioException err) : super(error: err);
}

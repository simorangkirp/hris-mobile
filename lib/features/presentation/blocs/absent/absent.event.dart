import '../../../../lib.dart';

abstract class AbsentEvent {
  const AbsentEvent();
}

class InitAbsent extends AbsentEvent {}

// class SubmitLogin extends AbsentEvent {
//   LoginParams model;
//   SubmitLogin(this.model);
// }

class InitCamera extends AbsentEvent {}

class GetAbsentPeriod extends AbsentEvent {
  String dt;
  GetAbsentPeriod(this.dt);
}

class GetUserAssignLocation extends AbsentEvent {}

class SubmitUserAbsent extends AbsentEvent {
  SubmitUserAbsentParams params;
  SubmitUserAbsent(this.params);
}

class AbsentHolidayList extends AbsentEvent {}

class AbsentGetUserInfo extends AbsentEvent {}

class AbsentScrnActPeriod extends AbsentEvent {}

class AbsentCheckPin extends AbsentEvent {
  String pin;
  AbsentCheckPin(this.pin);
}

class AbsentAddComment extends AbsentEvent {}

class AbsentRemoveComment extends AbsentEvent {}

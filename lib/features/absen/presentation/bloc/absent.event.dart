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

class AbsentScrnActPeriod extends AbsentEvent{}

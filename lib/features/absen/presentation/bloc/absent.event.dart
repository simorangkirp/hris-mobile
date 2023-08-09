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
  String uid;
  String dt;
  String onmobile;
  GetAbsentPeriod(this.uid, this.dt, this.onmobile);
}

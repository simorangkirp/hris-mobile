abstract class PaidLeaveEvent {
  const PaidLeaveEvent();
}

class PaidLeaveInit extends PaidLeaveEvent {}

class PaidLeaveGetPlafond extends PaidLeaveEvent {}

class PaidLeaveGetListData extends PaidLeaveEvent {}

class PaidLeaveGetDataDetail extends PaidLeaveEvent {}

class PaidLeaveSubmitData extends PaidLeaveEvent {}

class PaidLeaveGetCategory extends PaidLeaveEvent {}

class PaidLeaveGetCatDetail extends PaidLeaveEvent {}

class PaidLeaveGetUserData extends PaidLeaveEvent {}

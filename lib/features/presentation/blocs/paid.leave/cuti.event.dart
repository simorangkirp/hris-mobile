import '../../../../lib.dart';

abstract class PaidLeaveEvent {
  const PaidLeaveEvent();
}

class PaidLeaveInit extends PaidLeaveEvent {}

class PaidLeaveGetPlafond extends PaidLeaveEvent {}

class PaidLeaveGetListData extends PaidLeaveEvent {
  String period;
  PaidLeaveGetListData(this.period);
}

class PaidLeaveGetDataDetail extends PaidLeaveEvent {
  String noTxn;
  PaidLeaveGetDataDetail(this.noTxn);
}

class PaidLeaveSubmitData extends PaidLeaveEvent {
  PaidLeaveSubmitModel data;
  PaidLeaveSubmitData(this.data);
}

class PaidLeaveGetCategory extends PaidLeaveEvent {}

class PaidLeaveGetCatDetail extends PaidLeaveEvent {
  String id;
  PaidLeaveGetCatDetail(this.id);
}

class PaidLeaveGetUserData extends PaidLeaveEvent {}

import '../../../../lib.dart';

class PaidLeaveImplement implements PaidLeaveRepository {
  // final String userNm, pwd;
  final PaidLeaveAPIService _paidLeaveAPIService;
  // final UserAuthDb db;
  PaidLeaveImplement(this._paidLeaveAPIService);

  @override
  Future<DataState> getPaidLeaveCat() {
    // TODO: implement getPaidLeaveCat
    throw UnimplementedError();
  }

  @override
  Future<DataState> getPaidLeaveCatDetail() {
    // TODO: implement getPaidLeaveCatDetail
    throw UnimplementedError();
  }

  @override
  Future<DataState> getPaidLeaveDetail() {
    // TODO: implement getPaidLeaveDetail
    throw UnimplementedError();
  }

  @override
  Future<DataState> getPaidLeaveList() {
    // TODO: implement getPaidLeaveList
    throw UnimplementedError();
  }

  @override
  Future<DataState> getPaidLeavePlafond() {
    // TODO: implement getPaidLeavePlafond
    throw UnimplementedError();
  }

  @override
  Future<DataState> getUserInfo() {
    // TODO: implement getUserInfo
    throw UnimplementedError();
  }

  @override
  Future<DataState> submitPaidLeave() {
    // TODO: implement submitPaidLeave
    throw UnimplementedError();
  }
}

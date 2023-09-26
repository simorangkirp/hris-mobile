import '../../../../core/core.dart';
import '../../cuti.dart';

class GetPersonalInfoPaidLeave extends UseCase<DataState, void> {
  final PaidLeaveRepository repos;
  GetPersonalInfoPaidLeave(this.repos);
  @override
  Future<DataState> call(params) async {
    var res = await repos.getUserInfo();
    return res;
  }
}

class PaidLeaveGetPlafond extends UseCase<DataState, void> {
  final PaidLeaveRepository repos;
  PaidLeaveGetPlafond(this.repos);
  @override
  Future<DataState> call(params) async {
    var res = await repos.getPaidLeavePlafond();
    return res;
  }
}

class PaidLeaveGetListData extends UseCase<DataState, void> {
  final PaidLeaveRepository repos;
  PaidLeaveGetListData(this.repos);
  @override
  Future<DataState> call(params) async {
    var res = await repos.getPaidLeaveList();
    return res;
  }
}

class PaidLeaveGetDataDetail extends UseCase<DataState, void> {
  final PaidLeaveRepository repos;
  PaidLeaveGetDataDetail(this.repos);
  @override
  Future<DataState> call(params) async {
    var res = await repos.getPaidLeaveDetail();
    return res;
  }
}

class PaidLeaveSubmitData extends UseCase<DataState, void> {
  final PaidLeaveRepository repos;
  PaidLeaveSubmitData(this.repos);
  @override
  Future<DataState> call(params) async {
    var res = await repos.submitPaidLeave();
    return res;
  }
}

class PaidLeaveGetCategory extends UseCase<DataState, void> {
  final PaidLeaveRepository repos;
  PaidLeaveGetCategory(this.repos);
  @override
  Future<DataState> call(params) async {
    var res = await repos.getPaidLeaveCat();
    return res;
  }
}

class PaidLeaveGetCategoryDetail extends UseCase<DataState, void> {
  final PaidLeaveRepository repos;
  PaidLeaveGetCategoryDetail(this.repos);
  @override
  Future<DataState> call(params) async {
    var res = await repos.getPaidLeaveCatDetail();
    return res;
  }
}

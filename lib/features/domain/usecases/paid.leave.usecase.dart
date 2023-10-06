import 'package:equatable/equatable.dart';

import '../../../lib.dart';

class GetPersonalInfoPaidLeave extends UseCase<DataState, NoParams> {
  final PaidLeaveRepository repos;
  GetPersonalInfoPaidLeave(this.repos);
  @override
  Future<DataState> call(params) async {
    var res = await repos.getUserInfo();
    return res;
  }
}

class PaidLeaveGetPlafondUseCase extends UseCase<DataState, NoParams> {
  final PaidLeaveRepository repos;
  PaidLeaveGetPlafondUseCase(this.repos);
  @override
  Future<DataState> call(params) async {
    var res = await repos.getPaidLeavePlafond();
    return res;
  }
}

class PaidLeaveGetListDataUseCase extends UseCase<DataState, String> {
  final PaidLeaveRepository repos;
  PaidLeaveGetListDataUseCase(this.repos);
  @override
  Future<DataState> call(params) async {
    var res = await repos.getPaidLeaveList(params);
    return res;
  }
}

class PaidLeaveGetDataDetailUseCase extends UseCase<DataState, String> {
  final PaidLeaveRepository repos;
  PaidLeaveGetDataDetailUseCase(this.repos);
  @override
  Future<DataState> call(params) async {
    var res = await repos.getPaidLeaveDetail(params);
    return res;
  }
}

class PaidLeaveSubmitDataUseCase
    extends UseCase<DataState, PaidLeaveSubmitModel> {
  final PaidLeaveRepository repos;
  PaidLeaveSubmitDataUseCase(this.repos);
  @override
  Future<DataState> call(params) async {
    var res = await repos.submitPaidLeave(params);
    return res;
  }
}

class PaidLeaveGetCategoryUseCase extends UseCase<DataState, NoParams> {
  final PaidLeaveRepository repos;
  PaidLeaveGetCategoryUseCase(this.repos);
  @override
  Future<DataState> call(params) async {
    var res = await repos.getPaidLeaveCat();
    return res;
  }
}

class PaidLeaveGetCategoryDetailUseCase extends UseCase<DataState, String> {
  final PaidLeaveRepository repos;
  PaidLeaveGetCategoryDetailUseCase(this.repos);
  @override
  Future<DataState> call(params) async {
    var res = await repos.getPaidLeaveCatDetail(params);
    return res;
  }
}

class PaidLeaveSubmitParams extends Equatable {
  final String date;
  final String desc;
  final String dtFr;
  final String dtTo;
  final String idType;
  final String totalDay;
  final String returnDay;
  final String fileupload;
  final String typefile;
  const PaidLeaveSubmitParams(
    this.date,
    this.desc,
    this.dtFr,
    this.dtTo,
    this.idType,
    this.totalDay,
    this.returnDay,
    this.fileupload,
    this.typefile,
  );

  @override
  List<Object?> get props => [
        date,
        desc,
        dtFr,
        dtTo,
        idType,
        totalDay,
        returnDay,
        fileupload,
        typefile,
      ];
}

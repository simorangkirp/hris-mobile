import 'package:equatable/equatable.dart';
import 'package:owl_hris/core/core.dart';
import 'package:owl_hris/features/approval/approval.dart';

class GetApprovalListDataUsecase
    extends UseCase<DataState, ApprvListDataParams> {
  final ApprovalRepository _repos;
  GetApprovalListDataUsecase(this._repos);

  @override
  Future<DataState> call(ApprvListDataParams params) async {
    var res = await _repos.getListApproval(params.kodejenis);
    return res;
  }
}

class GetApprovalDataDetail extends UseCase<DataState, ApprvDataDetailParams> {
  final ApprovalRepository _repos;
  GetApprovalDataDetail(this._repos);

  @override
  Future<DataState> call(ApprvDataDetailParams params) async {
    var res = await _repos.getApprovalDataDetail(params);
    return res;
  }
}

class SubmitApprovalDataResponse
    extends UseCase<DataState, ApprvSubmitResponseParams> {
  final ApprovalRepository _repos;
  SubmitApprovalDataResponse(this._repos);

  @override
  Future<DataState> call(ApprvSubmitResponseParams params) async {
    var res = await _repos.submitApprovalData(params);
    return res;
  }
}

class ApprvListDataParams extends Equatable {
  final String uid;
  final String kodejenis;
  final String onmobile;
  const ApprvListDataParams(this.uid, this.kodejenis, this.onmobile);

  @override
  List<Object?> get props => [uid, kodejenis, onmobile];
}

class ApprvDataDetailParams extends Equatable {
  final String id;
  final String notxn;
  const ApprvDataDetailParams(
    this.id,
    this.notxn,
  );

  @override
  List<Object?> get props => [
        id,
        notxn,
      ];
}

class ApprvSubmitResponseParams extends Equatable {
  final String id;
  final String sts;
  final String desc;
  const ApprvSubmitResponseParams(
    this.id,
    this.sts,
    this.desc,
  );

  @override
  List<Object?> get props => [
        id,
        sts,
        desc,
      ];
}

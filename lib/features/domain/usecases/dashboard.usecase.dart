import 'package:equatable/equatable.dart';

import '../../../lib.dart';

class GetProfileInfoUseCase extends UseCase<DataState, Params> {
  final HomeRepository _repos;
  GetProfileInfoUseCase(this._repos);

  @override
  Future<DataState> call(Params params) async {
    var res = await _repos.getProfileInfo(params.uid);
    return res;
  }
}

class DashboardGetListApprovalMsg extends UseCase<DataState, NoParams> {
  final HomeRepository _repos;
  DashboardGetListApprovalMsg(this._repos);

  @override
  Future<DataState> call(NoParams params) async {
    var res = await _repos.getListApprvMsg();
    return res;
  }
}

class Params extends Equatable {
  final String uid;
  const Params(this.uid);

  @override
  List<Object?> get props => [uid];
}

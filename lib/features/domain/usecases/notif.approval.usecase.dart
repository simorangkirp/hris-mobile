import '../../../lib.dart';

class NotifScreenGetDataList extends UseCase<DataState, NoParams> {
  final NotificationRepository _repos;
  NotifScreenGetDataList(this._repos);

  @override
  Future<DataState> call(NoParams params) async {
    var res = await _repos.getListNotif();
    return res;
  }
}

class NotifScreenGetApprovalList extends UseCase<DataState, NoParams> {
  final NotificationRepository _repos;
  NotifScreenGetApprovalList(this._repos);

  @override
  Future<DataState> call(NoParams params) async {
    var res = await _repos.getListApproval();
    return res;
  }
}

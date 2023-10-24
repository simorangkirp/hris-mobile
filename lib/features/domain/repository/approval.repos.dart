import '../../../lib.dart';

abstract class ApprovalRepository {
  Future<DataState> getListApproval(String type);
  Future<DataState> getApprovalDataDetail(ApprvDataDetailParams params);
  Future<DataState> submitApprovalData(ApprvSubmitResponseParams params);
  Future<DataState> getAppProfile();
}

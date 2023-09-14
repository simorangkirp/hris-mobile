import 'package:owl_hris/core/core.dart';
import 'package:owl_hris/features/approval/approval.dart';

abstract class ApprovalRepository {
  Future<DataState> getListApproval(String type);
  Future<DataState> getApprovalDataDetail(ApprvDataDetailParams params);
  Future<DataState> submitApprovalData(ApprvSubmitResponseParams params);
}

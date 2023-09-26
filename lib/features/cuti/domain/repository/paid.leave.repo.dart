import 'package:owl_hris/core/core.dart';

abstract class PaidLeaveRepository {
  Future<DataState> getUserInfo();
  Future<DataState> getPaidLeavePlafond();
  Future<DataState> getPaidLeaveList();
  Future<DataState> getPaidLeaveDetail();
  Future<DataState> submitPaidLeave();
  Future<DataState> getPaidLeaveCat();
  Future<DataState> getPaidLeaveCatDetail();
}

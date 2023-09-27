import 'package:owl_hris/core/core.dart';

import '../../cuti.dart';

abstract class PaidLeaveRepository {
  Future<DataState> getUserInfo();
  Future<DataState> getPaidLeavePlafond();
  Future<DataState> getPaidLeaveList(String period);
  Future<DataState> getPaidLeaveDetail(String noTxn);
  Future<DataState> submitPaidLeave(PaidLeaveSubmitParams params);
  Future<DataState> getPaidLeaveCat();
  Future<DataState> getPaidLeaveCatDetail(String id);
}

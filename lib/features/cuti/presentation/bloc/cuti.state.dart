import 'package:equatable/equatable.dart';
import 'package:dio/dio.dart';

import '../../cuti.dart';

abstract class PaidLeaveState extends Equatable {
  final DioException? error;
  final String? errMsg, msg;
  final PaidLeavePlafond? plafond;
  final PaidLeaveDataDetail? detail;
  final PaidLeaveCatDetail? catDetail;
  const PaidLeaveState({
    this.error,
    this.catDetail,
    this.plafond,
    this.detail,
    this.errMsg,
    this.msg,
  });

  @override
  List<Object> get props => [
        error!,
        errMsg!,
        msg!,
      ];
}

class PaidLeaveLoading extends PaidLeaveState {}

class PaidLeaveInitiallized extends PaidLeaveState {}

class PaidLeavePlafondLoaded extends PaidLeaveState {
  const PaidLeavePlafondLoaded(PaidLeavePlafond data) : super(plafond: data);
}

class PaidLeaveErrCall extends PaidLeaveState {
  const PaidLeaveErrCall(String data) : super(errMsg: data);
}

class PaidLeaveDetailLoaded extends PaidLeaveState {
  const PaidLeaveDetailLoaded(PaidLeaveDataDetail data) : super(detail: data);
}

class PaidLeaveCatDetailLoaded extends PaidLeaveState {
  const PaidLeaveCatDetailLoaded(PaidLeaveCatDetail data)
      : super(catDetail: data);
}

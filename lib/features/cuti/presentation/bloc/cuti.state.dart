import 'package:equatable/equatable.dart';
import 'package:dio/dio.dart';

import '../../../../lib.dart';

abstract class PaidLeaveState extends Equatable {
  final DioException? error;
  final String? errMsg, msg;
  final PaidLeavePlafond? plafond;
  final PaidLeaveDataDetail? detail;
  final List<PaidLeaveCatDetail>? catDetail;
  final List<PaidLeaveListData>? listData;
  final ProfileModel? profile;
  final List<PaidLeaveCategory>? cat;
  const PaidLeaveState({
    this.error,
    this.catDetail,
    this.plafond,
    this.detail,
    this.listData,
    this.errMsg,
    this.msg,
    this.profile,
    this.cat,
  });

  @override
  List<Object> get props => [];
}

class PaidLeaveLoading extends PaidLeaveState {}

class PaidLeaveSearchLoading extends PaidLeaveState {}

class PaidLeaveSubmitFormLoading extends PaidLeaveState {}

class PaidLeaveSubmitFormSuccess extends PaidLeaveState {
  const PaidLeaveSubmitFormSuccess(String data) : super(msg: data);
}

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
  const PaidLeaveCatDetailLoaded(List<PaidLeaveCatDetail> data)
      : super(catDetail: data);
}

class PaidLeaveCatLoaded extends PaidLeaveState {
  const PaidLeaveCatLoaded(List<PaidLeaveCategory> data) : super(cat: data);
}

class PaidLeaveListDataLoaded extends PaidLeaveState {
  const PaidLeaveListDataLoaded(List<PaidLeaveListData> data)
      : super(listData: data);
}

class PaidLeaveProfileLoaded extends PaidLeaveState {
  const PaidLeaveProfileLoaded(ProfileModel data) : super(profile: data);
}

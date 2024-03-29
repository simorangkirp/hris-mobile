import 'package:equatable/equatable.dart';
import 'package:dio/dio.dart';
import '../../../../lib.dart';

abstract class ApprovalState extends Equatable {
  final DioException? error;
  final String? errMsg;
  final String? msg;
  final ApprovalDetailEntity? apprvDetail;
  final List<ApprovalEntity>? listApprv;
  const ApprovalState({
    this.error,
    this.errMsg,
    this.msg,
    this.apprvDetail,
    this.listApprv,
  });
  @override
  List<Object> get props => [error!, errMsg!, apprvDetail!, listApprv!];
}

class ApprovalScrnDataErr extends ApprovalState {
  const ApprovalScrnDataErr(DioException err) : super(error: err);
}

class ApprovalScrnLoading extends ApprovalState {}

class ApprovalScrnInitiallized extends ApprovalState {}

class ApprovalListLoaded extends ApprovalState {
  const ApprovalListLoaded(List<ApprovalEntity> data) : super(listApprv: data);
}

class ApprovalDataDetailLoaded extends ApprovalState {
  const ApprovalDataDetailLoaded(ApprovalDetailEntity data)
      : super(apprvDetail: data);
}

class ApprovalResponseSubmited extends ApprovalState {
  const ApprovalResponseSubmited(String data) : super(msg: data);
}

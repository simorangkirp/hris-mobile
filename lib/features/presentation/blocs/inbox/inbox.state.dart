import 'package:equatable/equatable.dart';
import 'package:dio/dio.dart';
import '../../../../lib.dart';

abstract class InboxState extends Equatable {
  final DioException? error;
  final String? errMsg;
  final List<NotifEntity>? listNotif;
  final List<ApprovalCountEntity>? listApprv;
  final String? invalidErrMsg;
  const InboxState({
    this.error,
    this.errMsg,
    this.listNotif,
    this.listApprv,
    this.invalidErrMsg,
  });
  @override
  List<Object> get props => [];
}

class InboxScrnInitiallized extends InboxState {}

class InboxScrnLoading extends InboxState {}

class InboxError extends InboxState {
  const InboxError(String data) : super(errMsg: data);
}

class InboxScrnDataStateErr extends InboxState {
  const InboxScrnDataStateErr(DioException err) : super(error: err);
}

class InboxScrnListNotifLoaded extends InboxState {
  const InboxScrnListNotifLoaded(List<NotifEntity> data)
      : super(listNotif: data);
}

class InboxScrnApprvDataLoaded extends InboxState {
  const InboxScrnApprvDataLoaded(List<ApprovalCountEntity> data)
      : super(listApprv: data);
}

class InboxInvalidVersion extends InboxState {
  const InboxInvalidVersion(String data) : super(invalidErrMsg: data);
}

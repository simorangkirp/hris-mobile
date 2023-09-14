import 'package:equatable/equatable.dart';
import 'package:dio/dio.dart';
import 'package:owl_hris/features/inbox/inbox.dart';

abstract class InboxState extends Equatable {
  final DioException? error;
  final String? errMsg;
  final List<NotifEntity>? listNotif;
  final List<ApprovalCountEntity>? listApprv;
  const InboxState({
    this.error,
    this.errMsg,
    this.listNotif,
    this.listApprv,
  });
  @override
  List<Object> get props => [error!, errMsg!, listNotif!, listApprv!];
}

class InboxScrnInitiallized extends InboxState {}

class InboxScrnLoading extends InboxState {}

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

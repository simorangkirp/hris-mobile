import 'package:owl_hris/features/approval/approval.dart';

abstract class ApprovalEvent {
  const ApprovalEvent();
}

class ApprovalScrnInit extends ApprovalEvent {}

class ApprovalScrnGetApproval extends ApprovalEvent {
  final String type;
  ApprovalScrnGetApproval(this.type);
}

class ApprovalScrnGetApprovalDataDetail extends ApprovalEvent {
  final ApprvDataDetailParams param;
  ApprovalScrnGetApprovalDataDetail(this.param);
}

class ApprovalScrnSubmitResponse extends ApprovalEvent {
  final ApprvSubmitResponseParams param;
  ApprovalScrnSubmitResponse(this.param);
}

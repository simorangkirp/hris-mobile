import 'package:equatable/equatable.dart';
import 'package:dio/dio.dart';

import '../../../../../lib.dart';

abstract class ProfileScreenState extends Equatable {
  final DioException? error;
  final EmerContactEntity? emerCtcEntity;
  final JobEntity? jobEntity;
  final AddressEntity? address;
  final EducationEntity? eduEntity;
  final FamilyEntity? familyEntity;
  final PayrollEntity? payroll;
  final EntityProfile? profile;
  final ActivePeriodEntity? period;
  final String? errMsg;
  final List<AbsentEntity>? listAbsent;
  const ProfileScreenState({
    this.error,
    this.profile,
    this.errMsg,
    this.listAbsent,
    this.period,
    this.jobEntity,
    this.emerCtcEntity,
    this.familyEntity,
    this.eduEntity,
    this.payroll,
    this.address,
  });
  @override
  List<Object> get props => [error!, profile!, errMsg!];
}

class ProfileScreenInitiallized extends ProfileScreenState {}

class ProfileScreenLoading extends ProfileScreenState {}

class ProfileScreenDataStateErr extends ProfileScreenState {
  const ProfileScreenDataStateErr(DioException err) : super(error: err);
}

class ProfileInfoLoaded extends ProfileScreenState {
  const ProfileInfoLoaded(EntityProfile res) : super(profile: res);
}

class AbsentDataLoaded extends ProfileScreenState {
  const AbsentDataLoaded(List<AbsentEntity> list) : super(listAbsent: list);
}

class ProfileScrErrMsg extends ProfileScreenState {
  const ProfileScrErrMsg(String msg) : super(errMsg: msg);
}

class ProfileScrnActPeriodLoaded extends ProfileScreenState {
  const ProfileScrnActPeriodLoaded(ActivePeriodEntity data)
      : super(period: data);
}

class ProfileScrnPersonalDataLoaded extends ProfileScreenState {}

class ProfileScrnGetJobHistoryLoaded extends ProfileScreenState {
  const ProfileScrnGetJobHistoryLoaded(JobEntity data) : super(jobEntity: data);
}

class ProfileScrnGetEmerCtcLoaded extends ProfileScreenState {
  const ProfileScrnGetEmerCtcLoaded(EmerContactEntity data)
      : super(emerCtcEntity: data);
}

class ProfileScrnGetFamilyLoaded extends ProfileScreenState {
  const ProfileScrnGetFamilyLoaded(FamilyEntity data)
      : super(familyEntity: data);
}

class ProfileScrnGetEduLoaded extends ProfileScreenState {
  const ProfileScrnGetEduLoaded(EducationEntity data) : super(eduEntity: data);
}

class ProfileScrnGetPayrollLoaded extends ProfileScreenState {
  const ProfileScrnGetPayrollLoaded(PayrollEntity data) : super(payroll: data);
}

class ProfileScrnGetAddressLoaded extends ProfileScreenState {
  const ProfileScrnGetAddressLoaded(AddressEntity data) : super(address: data);
}

import 'package:equatable/equatable.dart';
import 'package:dio/dio.dart';

import '../../../../lib.dart';

abstract class ProfileScreenState extends Equatable {
  final DioException? error;
  final EntityProfile? profile;
  final String? errMsg;
  final List<AbsentEntity>? listAbsent;
  const ProfileScreenState({this.error, this.profile, this.errMsg, this.listAbsent});
  @override
  List<Object> get props => [error!, profile!, errMsg!];
}

class ProfileScreenInitiallized extends ProfileScreenState{}

class ProfileScreenLoading extends ProfileScreenState{}

class ProfileScreenDataStateErr extends ProfileScreenState {
  const ProfileScreenDataStateErr(DioException err) : super(error: err);
}

class ProfileInfoLoaded extends ProfileScreenState{
  const ProfileInfoLoaded(EntityProfile res) : super(profile: res);
}

class AbsentDataLoaded extends ProfileScreenState{
  const AbsentDataLoaded(List<AbsentEntity> list) : super(listAbsent: list);
}

class ProfileScrErrMsg extends ProfileScreenState{
  const ProfileScrErrMsg(String msg) : super(errMsg: msg);
}
import 'package:equatable/equatable.dart';
import 'package:dio/dio.dart';
import '../../../../lib.dart';

abstract class HomeState extends Equatable {
  final DioException? error;
  final EntityProfile? profile;
  final String? errMsg;
  const HomeState({this.error, this.profile, this.errMsg});
  @override
  List<Object> get props => [error!, profile!, errMsg!];
}

class HomeLoading extends HomeState {}

class HomeInitiallized extends HomeState {}

class ProfileDataLoaded extends HomeState {
  const ProfileDataLoaded(EntityProfile model) : super(profile: model);
}

class ProfileDataError extends HomeState {
  const ProfileDataError(DioException err) : super(error: err);
}

class ErrorMessage extends HomeState {
  const ErrorMessage(String msg) : super(errMsg: msg);
}

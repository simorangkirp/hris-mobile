import 'package:equatable/equatable.dart';
// import 'package:dio/dio.dart';

abstract class IntrodState extends Equatable {
  final bool? intro;
  const IntrodState({
    this.intro,
  });
  @override
  List<Object> get props => [];
}

class IntrodLoading extends IntrodState {
  const IntrodLoading();
}

class IntrodInitiallized extends IntrodState {}

class IntrodInfoLoaded extends IntrodState {
  const IntrodInfoLoaded(bool data) : super(intro: data);
}

class IntrodInfoSubmited extends IntrodState {}

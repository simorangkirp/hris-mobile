import 'package:equatable/equatable.dart';

abstract class UseCase<Type, Params> {
  Future<Type> call(Params params);
  // Future<Type> callNoParams();
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}

abstract class HomeUseCases<Type, Params> {
  Future<Type> getProfile(Params param);
}

class HomeNoParams extends Equatable {
  @override
  List<Object> get props => [];
}

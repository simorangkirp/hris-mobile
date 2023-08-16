import 'package:equatable/equatable.dart';

abstract class UseCase<Type, Params> {
  Future<Type> call(Params params);
  // Future<Type> callNoParams();
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}
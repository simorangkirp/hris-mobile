import 'package:equatable/equatable.dart';

abstract class AppFailure extends Equatable {
  @override
  List<Object> get props => [];
}

class ServerFailure extends AppFailure {}

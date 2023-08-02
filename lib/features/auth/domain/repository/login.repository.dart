// import 'package:dartz/dartz.dart';
// import 'package:owl_hris/core/error/failures.dart';
import 'package:owl_hris/core/resources/data.state.dart';
// import 'package:owl_hris/core/resources/data.state.dart';

abstract class UserAuthRepository {
  Future<DataState> loginUser(String userNm, String pwd);
  Future<DataState<String>> logoutUser();
}

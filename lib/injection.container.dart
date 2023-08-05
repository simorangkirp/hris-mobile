import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:owl_hris/features/auth/data/data.source/remote/login.services.dart';
import 'package:owl_hris/features/auth/data/repository/login.repository.dart';

import 'features/auth/data/data.source/local/local.auth.services.dart';
import 'features/auth/domain/repository/login.repository.dart';
import 'features/auth/domain/usecases/login.usecase.dart';
import 'features/auth/presentation/bloc/auth.bloc.dart';
import 'features/auth/presentation/bloc/auth.event.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  // Dio
  sl.registerSingleton<Dio>(Dio());
  // Dependencies
  sl.registerSingleton(LoginAPIServices(sl()));
  sl.registerSingleton(UserAuthDb());
  sl.registerSingleton<UserAuthRepository>(
      LoginRepositoryImpl(sl(), '', '', sl()));
  // Usecase
  sl.registerSingleton<LoginUserUseCase>(LoginUserUseCase(sl()));
  // BLoCs
  sl.registerFactory<AuthBloc>(() => AuthBloc(sl())..add(InitAuth()));
}

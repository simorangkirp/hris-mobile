import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:owl_hris/features/absen/presentation/bloc/absent.bloc.dart';
import 'package:owl_hris/features/absen/presentation/bloc/absent.event.dart';
import 'package:owl_hris/features/auth/data/data.source/remote/login.services.dart';
import 'package:owl_hris/features/auth/data/repository/login.repository.dart';

import 'features/absen/data/repository/absent.repo.impl.dart';
import 'features/absen/domain/repository/absent.repository.dart';
import 'features/absen/domain/usecases/absent.usecases.dart';
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
  sl.registerSingleton<AbsentRepository>(AbsentReposImplement());
  // Usecase
  sl.registerSingleton<LoginUserUseCase>(LoginUserUseCase(sl()));
  sl.registerSingleton<GetUserCurrentPeriodAbsentList>(
      GetUserCurrentPeriodAbsentList(sl()));
  sl.registerSingleton<GetListCameraClockIn>(GetListCameraClockIn(sl()));
  // BLoCs
  sl.registerFactory<AuthBloc>(() => AuthBloc(sl())..add(InitAuth()));
  sl.registerFactory<AbsentBloc>(
      () => AbsentBloc(sl(), sl())..add(InitAbsent()));
}

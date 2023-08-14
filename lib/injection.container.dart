import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'features/features.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  // Dio
  sl.registerSingleton<Dio>(Dio());

  // Services
  sl.registerSingleton(LoginAPIServices(sl()));
  sl.registerSingleton(AbsentAPIServices(sl()));
  sl.registerSingleton(UserAuthDb());
  sl.registerSingleton(HomeApiServices(sl()));

  // Repository
  sl.registerSingleton<UserAuthRepository>(
      LoginRepositoryImpl(sl(), '', '', sl()));
  sl.registerSingleton<AbsentRepository>(AbsentReposImplement(sl()));
  sl.registerSingleton<HomeRepository>(HomeReposImpl(sl()));

  // Usecase
  sl.registerSingleton<LoginUserUseCase>(LoginUserUseCase(sl()));
  sl.registerSingleton<GetUserCurrentPeriodAbsentList>(
      GetUserCurrentPeriodAbsentList(sl()));
  sl.registerSingleton<GetListCameraClockIn>(GetListCameraClockIn(sl()));
  sl.registerSingleton<HomeUseCasesImpl>(HomeUseCasesImpl(sl<HomeRepository>()));

  // BLoCs
  sl.registerFactory<AuthBloc>(() => AuthBloc(sl())..add(InitAuth()));
  sl.registerFactory<AbsentBloc>(
      () => AbsentBloc(sl(), sl())..add(InitAbsent()));
  sl.registerFactory<HomeBloc>(() => HomeBloc(sl())..add(InitHome()));
}

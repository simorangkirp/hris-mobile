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
  sl.registerSingleton(ProfileInfoDb());
  sl.registerSingleton(HomeApiServices(sl()));
  sl.registerSingleton(ProfileAPIServices(sl()));

  // Repository
  sl.registerSingleton<UserAuthRepository>(
      LoginRepositoryImpl(sl(), '', '', sl()));
  sl.registerSingleton<AbsentRepository>(AbsentReposImplement(sl()));
  sl.registerSingleton<HomeRepository>(HomeReposImpl(sl()));
  sl.registerSingleton<ProfileRepository>(ProfileRepoImpl(sl()));

  // Usecase
  sl.registerSingleton<LoginUserUseCase>(LoginUserUseCase(sl()));
  sl.registerSingleton<GetUserCurrentPeriodAbsentList>(
      GetUserCurrentPeriodAbsentList(sl()));
  sl.registerSingleton<GetListCameraClockIn>(GetListCameraClockIn(sl()));
  sl.registerSingleton<GetProfileInfoUseCase>(
      GetProfileInfoUseCase(sl<HomeRepository>()));
  sl.registerSingleton<GetProfileScreenProfileInfo>(GetProfileScreenProfileInfo(sl()));
  sl.registerSingleton<GetProfileScreenJobInfo>(GetProfileScreenJobInfo(sl()));
  sl.registerSingleton<GetProfileScreenAbsentInfo>(GetProfileScreenAbsentInfo(sl()));
  sl.registerSingleton<GetProfileScreenEmerContactInfo>(GetProfileScreenEmerContactInfo(sl()));
  sl.registerSingleton<GetProfileScreenFamilyInfo>(GetProfileScreenFamilyInfo(sl()));
  sl.registerSingleton<GetProfileScreenEducationInfo>(GetProfileScreenEducationInfo(sl()));
  sl.registerSingleton<GetProfileScreenPayrollInfo>(GetProfileScreenPayrollInfo(sl()));
  sl.registerSingleton<GetProfileScreenAddressInfo>(GetProfileScreenAddressInfo(sl()));

  
  // BLoCs
  sl.registerFactory<AuthBloc>(() => AuthBloc(sl())..add(InitAuth()));
  sl.registerFactory<AbsentBloc>(
      () => AbsentBloc(sl(), sl())..add(InitAbsent()));
  sl.registerFactory<HomeBloc>(() => HomeBloc(sl())..add(InitHome()));
  sl.registerFactory<ProfileScreenBloc>(() => ProfileScreenBloc(sl(),sl())..add(InitProfileScreen()));
}

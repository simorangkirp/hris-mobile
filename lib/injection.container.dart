import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'features/features.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  // Dio
  sl.registerSingleton<Dio>(Dio());

  // Services
  sl.registerSingleton(RemoteLoginScreenServicesImpl(dio: sl()));
  sl.registerSingleton(RemoteAbsentServicesImpl(dio: sl()));
  sl.registerSingleton(UserAuthDb());
  sl.registerSingleton(ProfileInfoDb());
  sl.registerSingleton(RemoteDashboardServicesImpl(dio: sl()));
  sl.registerSingleton(RemoteProfileServicesImpl(dio: sl()));
  sl.registerSingleton(RemoteNotifServicesImpl(dio: sl()));
  sl.registerSingleton(RemoteApprovalServicesImpl(dio: sl()));
  sl.registerSingleton(RemotePaidLeaveServicesImpl(dio: sl()));
  sl.registerSingleton(RemoteSettingServicesImpl(dio: sl()));

  // Repository
  sl.registerSingleton<UserAuthRepository>(LoginRepositoryImpl(sl(), sl()));
  sl.registerSingleton<AbsentRepository>(AbsentReposImplement(sl()));
  sl.registerSingleton<HomeRepository>(HomeReposImpl(sl()));
  sl.registerSingleton<ProfileRepository>(ProfileRepoImpl(sl()));
  sl.registerSingleton<NotificationRepository>(NotifRepoImpl(sl()));
  sl.registerSingleton<ApprovalRepository>(ApprovalRepoImpl(sl()));
  sl.registerSingleton<PaidLeaveRepository>(PaidLeaveImplement(sl()));
  sl.registerSingleton<SettingsRepository>(SettingRepoImpl(sl()));

  // Usecase
  sl.registerSingleton<LoginUserUseCase>(LoginUserUseCase(sl()));
  sl.registerSingleton<SettingReqOtp>(SettingReqOtp(sl()));
  sl.registerSingleton<SettingChangePwdUseCase>(SettingChangePwdUseCase(sl()));
  sl.registerSingleton<SettingChangeLanguageUsecase>(
      SettingChangeLanguageUsecase(sl()));
  sl.registerSingleton<DashboardGetListApprovalMsg>(
      DashboardGetListApprovalMsg(sl()));
  sl.registerSingleton<ApprvGetProfileUseCase>(ApprvGetProfileUseCase(sl()));
  sl.registerSingleton<GetHolidayListUsecase>(GetHolidayListUsecase(sl()));
  sl.registerSingleton<AuthCheckDeviceInfoUsecase>(
      AuthCheckDeviceInfoUsecase(sl()));
  sl.registerSingleton<AbsentCheckPINUseCase>(AbsentCheckPINUseCase(sl()));
  sl.registerSingleton<AuthCheckTokenExp>(AuthCheckTokenExp(sl()));
  sl.registerSingleton<NotifScreenGetDataList>(NotifScreenGetDataList(sl()));
  sl.registerSingleton<NotifScreenGetApprovalList>(
      NotifScreenGetApprovalList(sl()));
  sl.registerSingleton<GetUserCurrentPeriodAbsentList>(
      GetUserCurrentPeriodAbsentList(sl()));
  sl.registerSingleton<GetListCameraClockIn>(GetListCameraClockIn(sl()));
  sl.registerSingleton<GetProfileInfoUseCase>(
      GetProfileInfoUseCase(sl<HomeRepository>()));
  sl.registerSingleton<GetProfileScreenProfileInfo>(
      GetProfileScreenProfileInfo(sl()));
  sl.registerSingleton<GetProfileScreenJobInfo>(GetProfileScreenJobInfo(sl()));
  sl.registerSingleton<GetProfileScreenAbsentInfo>(
      GetProfileScreenAbsentInfo(sl()));
  sl.registerSingleton<GetProfileScreenEmerContactInfo>(
      GetProfileScreenEmerContactInfo(sl()));
  sl.registerSingleton<GetProfileScreenFamilyInfo>(
      GetProfileScreenFamilyInfo(sl()));
  sl.registerSingleton<GetProfileScreenEducationInfo>(
      GetProfileScreenEducationInfo(sl()));
  sl.registerSingleton<GetProfileScreenPayrollInfo>(
      GetProfileScreenPayrollInfo(sl()));
  sl.registerSingleton<GetProfileScreenAddressInfo>(
      GetProfileScreenAddressInfo(sl()));
  sl.registerSingleton<GetProfileScreenActPeriod>(
      GetProfileScreenActPeriod(sl()));
  sl.registerSingleton<AuthGetProfileDataDetails>(
      AuthGetProfileDataDetails(sl()));
  sl.registerSingleton<AuthGetActPeriodUseCase>(AuthGetActPeriodUseCase(sl()));
  sl.registerSingleton<GetPersonalData>(GetPersonalData(sl()));
  sl.registerSingleton<GetApprovalListDataUsecase>(
      GetApprovalListDataUsecase(sl()));
  sl.registerSingleton<GetApprovalDataDetail>(GetApprovalDataDetail(sl()));
  sl.registerSingleton<SubmitApprovalDataResponse>(
      SubmitApprovalDataResponse(sl()));
  sl.registerSingleton<SubmitUserAbsentUseCase>(SubmitUserAbsentUseCase(sl()));
  sl.registerSingleton<AbsentUsecaseGetUserInfo>(
      AbsentUsecaseGetUserInfo(sl()));
  sl.registerSingleton<AbsentUsecaseGetActPeriod>(
      AbsentUsecaseGetActPeriod(sl()));
  sl.registerSingleton<GetUserAssignLocationUseCase>(
      GetUserAssignLocationUseCase(sl()));
  sl.registerSingleton<GetPersonalInfoPaidLeave>(
      GetPersonalInfoPaidLeave(sl()));
  sl.registerSingleton<PaidLeaveGetPlafondUseCase>(
      PaidLeaveGetPlafondUseCase(sl()));
  sl.registerSingleton<PaidLeaveGetListDataUseCase>(
      PaidLeaveGetListDataUseCase(sl()));
  sl.registerSingleton<PaidLeaveGetDataDetailUseCase>(
      PaidLeaveGetDataDetailUseCase(sl()));
  sl.registerSingleton<PaidLeaveSubmitDataUseCase>(
      PaidLeaveSubmitDataUseCase(sl()));
  sl.registerSingleton<PaidLeaveGetCategoryUseCase>(
      PaidLeaveGetCategoryUseCase(sl()));
  sl.registerSingleton<PaidLeaveGetCategoryDetailUseCase>(
      PaidLeaveGetCategoryDetailUseCase(sl()));

  // BLoCs
  sl.registerFactory<AuthBloc>(
      () => AuthBloc(sl(), sl(), sl(), sl(), sl())..add(InitAuth()));
  sl.registerFactory<AbsentBloc>(() =>
      AbsentBloc(sl(), sl(), sl(), sl(), sl(), sl(), sl(), sl())
        ..add(InitAbsent()));
  sl.registerFactory<HomeBloc>(() => HomeBloc(sl(), sl())..add(InitHome()));
  sl.registerFactory<SettingBloc>(() => SettingBloc()..add(GetLanguage()));
  sl.registerFactory<IntrodBloc>(() => IntrodBloc()..add(InitIntrod()));
  sl.registerFactory<PasswordBloc>(
      () => PasswordBloc(sl(), sl())..add(InitPassword()));
  // sl.registerFactory<ThemeBloc>(() => ThemeBloc()..add(GetTheme()));
  // sl.registerFactory<SettingBloc>(() => SettingBloc()
  //   ..add(GetTheme())
  //   ..add(GetLanguage()));
  sl.registerFactory<ProfileScreenBloc>(() =>
      ProfileScreenBloc(sl(), sl(), sl(), sl(), sl(), sl(), sl(), sl(), sl())
        ..add(InitProfileScreen()));
  sl.registerFactory<InboxScrnBloc>(
      () => InboxScrnBloc(sl(), sl())..add(InitInboxScreen()));
  sl.registerFactory<ApprovalScrnBloc>(
      () => ApprovalScrnBloc(sl(), sl(), sl(), sl())..add(ApprovalScrnInit()));
  sl.registerFactory<PaidLeaveBloc>(() =>
      PaidLeaveBloc(sl(), sl(), sl(), sl(), sl(), sl(), sl())
        ..add(PaidLeaveInit()));
}

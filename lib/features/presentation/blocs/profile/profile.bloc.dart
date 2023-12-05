import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../lib.dart';

class ProfileScreenBloc extends Bloc<ProfileEvent, ProfileScreenState> {
  final GetProfileScreenProfileInfo usecase;
  final GetProfileScreenAbsentInfo absentUsecase;
  final GetProfileScreenActPeriod actPeriodUsecase;
  final GetProfileScreenJobInfo jobInfoUsecase;
  final GetProfileScreenEmerContactInfo emerCtcUsecase;
  final GetProfileScreenFamilyInfo familyUsecase;
  final GetProfileScreenEducationInfo eduUsecase;
  final GetProfileScreenPayrollInfo payrollUsecase;
  final GetProfileScreenAddressInfo addressUsecase;
  ProfileScreenBloc(
    this.usecase,
    this.absentUsecase,
    this.actPeriodUsecase,
    this.jobInfoUsecase,
    this.emerCtcUsecase,
    this.familyUsecase,
    this.eduUsecase,
    this.payrollUsecase,
    this.addressUsecase,
  ) : super(ProfileScreenLoading()) {
    on<InitProfileScreen>(init);
    on<GetProfileInfoProfileScreen>(getProfile);
    on<GetAbsentInfo>(getAbsentData);
    on<ProfileScrnGetActPeriod>(getActPeriod);
    on<ProfileScrnGetJobHistory>(getJobHistory);
    on<ProfileScrnGetEmerCtc>(getEmerCtc);
    on<ProfileScrnGetFamily>(getFamily);
    on<ProfileScrnGetEdu>(getEducation);
    on<ProfileScrnGetPayroll>(getPayroll);
    on<ProfileScrnGetAddress>(getAddress);
  }

  void init(InitProfileScreen event, Emitter<ProfileScreenState> emit) async {
    emit(ProfileScreenInitiallized());
  }

  void getActPeriod(
      ProfileScrnGetActPeriod event, Emitter<ProfileScreenState> emit) async {
    final dataState = await actPeriodUsecase
        .call(GetActPeriodParams(event.date, event.lokasiTugas));
    if (dataState is DataSuccess) {
      if (dataState.data != null) {
        var begin = dataState.data['data'] as Map<String, dynamic>;
        log('$begin');
        var data = ActivePeriodModel.fromJson(begin);
        log('Active Period: $data');
        emit(ProfileScrnActPeriodLoaded(data));
      }
    }
    if (dataState is DataError) {
      emit(const ProfileScrErrMsg('Error'));
    }
  }

  void getProfile(GetProfileInfoProfileScreen event,
      Emitter<ProfileScreenState> emit) async {
    emit(ProfileScreenLoading());
    var uid = '';
    UserAuthDb auth = UserAuthDb();
    final res = await auth.getUser();
    if (res != null) {
      uid = res.uid!;
    }
    final dataState = await usecase.call(GetProfileParams(uid));
    if (dataState is DataSuccess) {
      if (dataState.data != null) {
        var begin = dataState.data['data'] as Map<String, dynamic>;
        log('$begin');
        var data = ProfileModel.fromJson(begin);
        log('Profile Data: $data');
        emit(ProfileInfoLoaded(data));
      }
    }
    if (dataState is DataError) {
      var msg = '';
      if (dataState.error != null) {
        if (dataState.error!.response != null) {
          if (dataState.error!.response!.data != null) {
            var data = dataState.error!.response!.data as Map<String, dynamic>;
            if (data['status'] == 401) {
              msg = data['messages'];
              emit(ProfileInvalidVersion(msg));
              return;
            } else {
              msg = data['messages'];
              log(msg);
            }
          }
        }
      } else {
        msg = "The request returned an invalid status code of 400.";
      }
      emit(ProfileScrErrMsg(msg));
    }
  }

  void getAbsentData(
      GetAbsentInfo event, Emitter<ProfileScreenState> emit) async {
    emit(ProfileScreenLoading());
    var uid = '';
    UserAuthDb auth = UserAuthDb();
    final res = await auth.getUser();
    if (res != null) {
      uid = res.uid!;
    }

    //! Get Period from State of Get Active Period
    var now = event.period;

    final dataState = await absentUsecase.call(GetAbsentParams(uid, now, '1'));
    if (dataState is DataSuccess) {
      List<AbsentListModel> list = [];
      var listAbsent = dataState.data['data'];
      if (dataState.data['data'] is List) {
        for (var i in (listAbsent as List)) {
          list.add(AbsentListModel.fromJson(i));
        }
      }
      if (list.isNotEmpty) {
        emit(AbsentDataLoaded(list));
      } else {
        emit(ProfileScreenDataStateErr(dataState.error!));
      }
    }
    // if (dataState is DataError) {
    //   emit(const ProfileScrErrMsg('Error'));
    // }
  }

  void getJobHistory(
      ProfileScrnGetJobHistory event, Emitter<ProfileScreenState> emit) async {
    final dataState = await jobInfoUsecase.call(NoParams());
    if (dataState is DataSuccess) {
      if (dataState.data != null) {
        var begin = dataState.data['data'] as Map<String, dynamic>;
        var data = JobModels.fromJson(begin);
        emit(ProfileScrnGetJobHistoryLoaded(data));
      }
    }
    if (dataState is DataError) {
      emit(const ProfileScrErrMsg('Error'));
    }
  }

  void getEmerCtc(
      ProfileScrnGetEmerCtc event, Emitter<ProfileScreenState> emit) async {
    final dataState = await emerCtcUsecase.call(NoParams());
    if (dataState is DataSuccess) {
      if (dataState.data != null) {
        var begin = dataState.data['data'] as Map<String, dynamic>;
        var data = EmergencyContactModel.fromJson(begin);
        emit(ProfileScrnGetEmerCtcLoaded(data));
      }
    }
    if (dataState is DataError) {
      emit(const ProfileScrErrMsg('Error'));
    }
  }

  void getFamily(
      ProfileScrnGetFamily event, Emitter<ProfileScreenState> emit) async {
    final dataState = await familyUsecase.call(NoParams());
    if (dataState is DataSuccess) {
      if (dataState.data != null) {
        var begin = dataState.data['data'] as Map<String, dynamic>;
        var data = FamilyModel.fromJson(begin);
        emit(ProfileScrnGetFamilyLoaded(data));
      }
    }
    if (dataState is DataError) {
      emit(const ProfileScrErrMsg('Error'));
    }
  }

  void getEducation(
      ProfileScrnGetEdu event, Emitter<ProfileScreenState> emit) async {
    final dataState = await eduUsecase.call(NoParams());
    if (dataState is DataSuccess) {
      if (dataState.data != null) {
        var begin = dataState.data['data'] as Map<String, dynamic>;
        var data = EducationModel.fromJson(begin);
        emit(ProfileScrnGetEduLoaded(data));
      }
    }
    if (dataState is DataError) {
      emit(const ProfileScrErrMsg('Error'));
    }
  }

  void getPayroll(
      ProfileScrnGetPayroll event, Emitter<ProfileScreenState> emit) async {
    final dataState = await payrollUsecase.call(NoParams());
    if (dataState is DataSuccess) {
      if (dataState.data != null) {
        var begin = dataState.data['data'] as Map<String, dynamic>;
        var data = PayrollModel.fromJson(begin);
        emit(ProfileScrnGetPayrollLoaded(data));
      }
    }
    if (dataState is DataError) {
      emit(const ProfileScrErrMsg('Error'));
    }
  }

  void getAddress(
      ProfileScrnGetAddress event, Emitter<ProfileScreenState> emit) async {
    final dataState = await addressUsecase.call(NoParams());
    if (dataState is DataSuccess) {
      if (dataState.data != null) {
        var begin = dataState.data['data'] as Map<String, dynamic>;
        var data = AddressModel.fromJson(begin);
        emit(ProfileScrnGetAddressLoaded(data));
      }
    }
    if (dataState is DataError) {
      emit(const ProfileScrErrMsg('Error'));
    }
  }
}

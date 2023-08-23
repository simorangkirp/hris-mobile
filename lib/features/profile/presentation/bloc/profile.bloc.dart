import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../lib.dart';

class ProfileScreenBloc extends Bloc<ProfileEvent, ProfileScreenState> {
  final GetProfileScreenProfileInfo usecase;
  final GetProfileScreenAbsentInfo absentUsecase;
  final GetProfileScreenActPeriod actPeriodUsecase;
  ProfileScreenBloc(this.usecase, this.absentUsecase, this.actPeriodUsecase)
      : super(ProfileScreenLoading()) {
    on<InitProfileScreen>(init);
    on<GetProfileInfoProfileScreen>(getProfile);
    on<GetAbsentInfo>(getAbsentData);
    on<ProfileScrnGetActPeriod>(getActPeriod);
  }

  void init(InitProfileScreen event, Emitter<ProfileScreenState> emit) async {
    emit(ProfileScreenInitiallized());
  }

  void getActPeriod(
      ProfileScrnGetActPeriod event, Emitter<ProfileScreenState> emit) async {
    final dataState = await actPeriodUsecase.call(GetActPeriodParams(event.date, event.lokasiTugas));
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
      emit(const ProfileScrErrMsg('Error'));
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
}

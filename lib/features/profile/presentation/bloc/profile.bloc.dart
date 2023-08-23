import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../core/core.dart';
import '../../../../lib.dart';
import '../../../auth/auth.dart';
import '../../../home/data/model/model.dart';
import '../../domain/domain.dart';
import '../presentation.dart';

class ProfileScreenBloc extends Bloc<ProfileEvent, ProfileScreenState> {
  final GetProfileScreenProfileInfo usecase;
  final GetProfileScreenAbsentInfo absentUsecase;
  ProfileScreenBloc(this.usecase, this.absentUsecase)
      : super(ProfileScreenLoading()) {
    on<InitProfileScreen>(init);
    on<GetProfileInfoProfileScreen>(getProfile);
    on<GetAbsentInfo>(getAbsentData);
  }

  void init(InitProfileScreen event, Emitter<ProfileScreenState> emit) async {
    emit(ProfileScreenInitiallized());
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
    var now = DateFormat('MMM yyyy').format(DateTime.now()).toString();

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

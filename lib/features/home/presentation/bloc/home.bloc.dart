import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../lib.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetProfileInfoUseCase usecase;
  HomeBloc(this.usecase) : super(HomeLoading()) {
    on<InitHome>(init);
    on<GetProfileInfo>(getProfile);
  }

  void init(InitHome event, Emitter<HomeState> emit) async {
    emit(HomeInitiallized());
  }

  void getProfile(GetProfileInfo event, Emitter<HomeState> emit) async {
    emit(HomeLoading());
    var uid = '';
    UserAuthDb auth = UserAuthDb();
    final res = await auth.getUser();
    if (res != null) {
      uid = res.uid!;
    }
    final dataState = await usecase.call(Params(uid));
    if (dataState is DataSuccess) {
      if (dataState.data != null) {
        var begin = dataState.data['data'] as Map<String, dynamic>;
        log('$begin');
        var data = ProfileModel.fromJson(begin);
        log('Profile Data: $data');
        emit(ProfileDataLoaded(data));
      }
    }
    if (dataState is DataError) {
      emit(const ErrorMessage('Error'));
    }
  }
}

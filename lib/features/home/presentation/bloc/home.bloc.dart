import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:owl_hris/core/core.dart';
import 'package:owl_hris/features/home/data/model/profile.model.dart';

import '../../home.dart';

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
    var uid = 'SZQKN-N3G7C-X9RDC';
    final dataState = await usecase.call(GetProfileParams(uid));
    if (dataState is DataSuccess) {
      if (dataState.data != null) {
        var data = ProfileModel.fromJson(dataState.data);
        emit(ProfileDataLoaded(data));
      }
    }
    if (dataState is DataError) {
      emit(const ErrorMessage('Error'));
    }
  }
}

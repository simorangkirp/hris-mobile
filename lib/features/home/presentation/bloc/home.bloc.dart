import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:owl_hris/core/core.dart';

import '../../home.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeUseCases usecase;
  HomeBloc(this.usecase) : super(HomeLoading()) {
    on<InitHome>(init);
    on<GetProfileInfo>(getProfile);
  }

  void init(InitHome event, Emitter<HomeState> emit) async {}

  void getProfile(GetProfileInfo event, Emitter<HomeState> emit) async {
    emit(HomeLoading());
    var uid = 'SZQKN-N3G7C-X9RDC';
    final dataState = await usecase.getProfile(uid);
    if (dataState is DataSuccess) {}
    if (dataState is DataError) {}
  }
}

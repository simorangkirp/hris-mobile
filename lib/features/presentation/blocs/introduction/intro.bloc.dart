import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:owl_hris/features/presentation/blocs/introduction/intro.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IntrodBloc extends Bloc<IntrodEvent, IntrodState> {
  IntrodBloc() : super(const IntrodLoading()) {
    on<InitIntrod>(onInit);
    on<IntrodGetIntroInfo>(onCheckIntro);
    on<IntrodSubmitIntro>(onSubmitIntrod);
    on<IntrodRedirect>(onRedirect);
  }

  void onInit(InitIntrod event, Emitter<IntrodState> emit) async {
    emit(IntrodInitiallized());
  }

  void onCheckIntro(IntrodGetIntroInfo event, Emitter<IntrodState> emit) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final state = prefs.getBool('intro');
    emit(IntrodInfoLoaded(state ?? false));
  }

  void onSubmitIntrod(
      IntrodSubmitIntro event, Emitter<IntrodState> emit) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('intro', true);
    emit(IntrodInfoSubmited());
  }

  void onRedirect(IntrodRedirect event, Emitter<IntrodState> emit) async {
    emit(IntrodRedirected());
  }
}

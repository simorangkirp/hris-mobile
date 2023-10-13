import 'package:bloc/bloc.dart';
// import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../lib.dart';

const languagePrefsKey = 'languagePrefs';
// const themePrefsKey = 'themePrefs';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  LanguageBloc() : super(const LanguageState()) {
    on<ChangeLanguage>(onChangeLanguage);
    on<GetLanguage>(onGetLanguage);
    // on<GetTheme>(onGetTheme);
    // on<ChangeTheme>(onChangeTheme);
  }

  onChangeLanguage(ChangeLanguage event, Emitter<LanguageState> emit) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(
      languagePrefsKey,
      event.selectedLanguage.value.languageCode,
    );
    emit(state.copyWith(selectedLanguage: event.selectedLanguage));
  }

  onGetLanguage(GetLanguage event, Emitter<LanguageState> emit) async {
    final prefs = await SharedPreferences.getInstance();
    final selectedLanguage = prefs.getString(languagePrefsKey);
    emit(state.copyWith(
      selectedLanguage: selectedLanguage != null
          ? Language.values
              .where((item) => item.value.languageCode == selectedLanguage)
              .first
          : Language.english,
    ));
  }

  // onChangeTheme(ChangeTheme event, Emitter<LanguageState> emit) async {
  //   ThemeData? selectedTheme;
  //   final prefs = await SharedPreferences.getInstance();
  //   await prefs.setString(
  //     themePrefsKey,
  //     event.selectedTheme.toString(),
  //   );
  //   appThemeData.forEach(
  //     (key, value) {
  //       if (event.selectedTheme == key) {
  //         selectedTheme = value;
  //       }
  //     },
  //   );
  //   selectedTheme ??= ThemeData.light();
  //   emit(state.copyWithTheme(selectedTheme: selectedTheme));
  // }

  // onGetTheme(GetTheme event, Emitter<LanguageState> emit) async {
  //   ThemeData? selectedTheme;
  //   final prefs = await SharedPreferences.getInstance();
  //   final getTheme = prefs.getString(themePrefsKey);
  //   if (getTheme != null) {}
  //   selectedTheme = ThemeData.light();
  //   emit(state.copyWithTheme(selectedTheme: selectedTheme));
  //   // if(getTheme){}

  //   // appThemeData.forEach(
  //   //   (key, value) {
  //   //     if ( == key) {
  //   //       selectedTheme = value;
  //   //     }
  //   //   },
  //   // );
  //   // emit(state.copyWithTheme(
  //   //   selectedTheme: selectedTheme != null
  //   //       ? Language.values
  //   //           .where((item) => item.value.languageCode == selectedLanguage)
  //   //           .first
  //   //       : Language.english,
  //   // ));
  // }
}

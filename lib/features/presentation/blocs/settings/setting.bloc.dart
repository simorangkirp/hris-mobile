import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../lib.dart';
import '../../../data/models/settings/theme.model.dart';

const languagePrefsKey = 'languagePrefs';
const themePrefsKey = 'themePrefs';

class SettingBloc extends Bloc<SettingEvent, SettingState> {
  SettingBloc() : super(SettingState()) {
    on<ChangeLanguage>(onChangeSettings);
    on<GetLanguage>(onGetSettings);
    // on<GetTheme>(onGetTheme);
    // on<ChangeTheme>(onChangeTheme);
  }

  onChangeSettings(ChangeLanguage event, Emitter<SettingState> emit) async {
    ThemeData? theme;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(
      languagePrefsKey,
      event.selectedLanguage.value.languageCode,
    );
    await prefs.setString(themePrefsKey, event.selectedTheme);
    if (event.selectedTheme == "dark") {
      // final apptheme = AppTheme.values[1];
      // theme = appThemeData[apptheme];
      theme = themesData[0];
    } else {
      // final apptheme = AppTheme.values[0];
      // theme = appThemeData[apptheme];
      theme = themesData[1];
    }
    emit(state.copyWith(
        selectedLanguage: event.selectedLanguage, selectedTheme: theme));
  }

  onGetSettings(GetLanguage event, Emitter<SettingState> emit) async {
    ThemeData? theme;
    final prefs = await SharedPreferences.getInstance();
    final selectedLanguage = prefs.getString(languagePrefsKey);
    final selectedTheme = prefs.getString(themePrefsKey);
    if (selectedTheme == "dark") {
      // final apptheme = AppTheme.values[1];
      theme = themesData[0];
    } else {
      // final apptheme = AppTheme.values[0];
      theme = themesData[1];
    }
    emit(state.copyWith(
      selectedLanguage: selectedLanguage != null
          ? Language.values
              .where((item) => item.value.languageCode == selectedLanguage)
              .first
          : Language.english,
      selectedTheme: theme,
    ));
  }

  // onChangeTheme(ChangeTheme event, Emitter<SettingState> emit) async {
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

  // onGetTheme(GetTheme event, Emitter<SettingState> emit) async {
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

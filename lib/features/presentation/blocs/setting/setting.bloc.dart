// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// import '../../../../../lib.dart';

// const languagePrefsKey = 'languagePrefs';
// const themePrefsKey = 'themePrefs';

// class SettingBloc extends Bloc<SettingsEvent, SettingState> {
//   SettingBloc() : super(const SettingState()) {
//     on<ChangeTheme>(onChangeTheme);
//     on<GetTheme>(onGetTheme);
//     on<ChangeLanguage>(onChangeLanguage);
//     on<GetLanguage>(onGetLanguage);
//   }

//   onChangeLanguage(ChangeLanguage event, Emitter<SettingState> emit) async {
//     // emit(SettingLoading());
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.setString(
//       languagePrefsKey,
//       event.selectedLanguage.value.languageCode,
//     );
//     emit(LanguageLoaded(event.selectedLanguage));
//   }

//   onGetLanguage(GetLanguage event, Emitter<SettingState> emit) async {
//     // emit(SettingLoading());
//     final prefs = await SharedPreferences.getInstance();
//     final selectedLanguage = prefs.getString(languagePrefsKey);
//     emit(GetLanguageLoaded(
//       selectedLanguage != null
//           ? Language.values
//               .where((item) => item.value.languageCode == selectedLanguage)
//               .first
//           : Language.english,
//     ));
//   }

//   onChangeTheme(ChangeTheme event, Emitter<SettingState> emit) async {
//     // emit(SettingLoading());
//     ThemeData? selectedTheme;
//     AppTheme? appTheme;
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.setString(
//       themePrefsKey,
//       event.selectedTheme.toString(),
//     );
//     if (event.selectedTheme.toString() == "lightMode") {
//       appTheme = AppTheme.lightMode;
//     } else {
//       appTheme = AppTheme.darkMode;
//     }
//     appThemeData.forEach(
//       (key, value) {
//         if (appTheme == key) {
//           selectedTheme = value;
//         }
//       },
//     );
//     selectedTheme ??= ThemeData.light();
//     emit(ThemeLoaded(selectedTheme!));
//   }

//   onGetTheme(GetTheme event, Emitter<SettingState> emit) async {
//     // emit(SettingLoading());
//     ThemeData? selectedTheme;
//     AppTheme? appTheme;
//     final prefs = await SharedPreferences.getInstance();
//     final getTheme = prefs.getString(themePrefsKey);
//     var splt = getTheme?.split('.');
//     if (splt != null && splt.length > 1) {
//       var mode = splt[1];
//       if (mode == "lightMode") {
//         appTheme = AppTheme.lightMode;
//       } else {
//         appTheme = AppTheme.darkMode;
//       }
//     }
//     appThemeData.forEach(
//       (key, value) {
//         if (appTheme == key) {
//           selectedTheme = value;
//         }
//       },
//     );
//     selectedTheme ??= ThemeData.light();
//     emit(GetThemeLoaded(selectedTheme!));
//     // if(getTheme){}

//     // appThemeData.forEach(
//     //   (key, value) {
//     //     if ( == key) {
//     //       selectedTheme = value;
//     //     }
//     //   },
//     // );
//     // emit(state.copyWithTheme(
//     //   selectedTheme: selectedTheme != null
//     //       ? Language.values
//     //           .where((item) => item.value.languageCode == selectedLanguage)
//     //           .first
//     //       : Language.english,
//     // ));
//   }
// }

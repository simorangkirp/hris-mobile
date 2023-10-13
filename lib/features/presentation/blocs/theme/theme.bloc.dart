// import 'package:bloc/bloc.dart';
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// import '../../../../lib.dart';

// // const languagePrefsKey = 'languagePrefs';
// const themePrefsKey = 'themePrefs';

// class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
//   ThemeBloc() : super(ThemeState()) {
//     on<ChangeTheme>(onChangeTheme);
//     on<GetTheme>(onGetTheme);
//   }

//   onChangeTheme(ChangeTheme event, Emitter<ThemeState> emit) async {
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
//     emit(state.copyWith(selectedTheme: selectedTheme));
//   }

//   onGetTheme(GetTheme event, Emitter<ThemeState> emit) async {
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
//     emit(state.copyWith(selectedTheme: selectedTheme));
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

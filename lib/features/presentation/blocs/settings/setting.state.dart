import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/material.dart';

import '../../../../lib.dart';

class SettingState extends Equatable {
  SettingState({
    Language? selectedLanguage,
    ThemeData? selectedTheme,
  })  : selectedLanguage = selectedLanguage ?? Language.english,
        selectedTheme = selectedTheme ?? ThemeData.light();

  final Language selectedLanguage;
  final ThemeData selectedTheme;

  @override
  List<Object> get props => [
        selectedLanguage,
        selectedTheme,
      ];

  SettingState copyWith(
      {Language? selectedLanguage, ThemeData? selectedTheme}) {
    return SettingState(
        selectedLanguage: selectedLanguage ?? this.selectedLanguage,
        selectedTheme: selectedTheme ?? this.selectedTheme);
  }

  // SettingState copyWithTheme({ThemeData? selectedTheme}) {
  //   return SettingState(
  //     selectedTheme: selectedTheme ?? this.selectedTheme,
  //   );
  // }
}

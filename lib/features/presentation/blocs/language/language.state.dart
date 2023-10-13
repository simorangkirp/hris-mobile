import 'package:equatable/equatable.dart';
// import 'package:flutter/material.dart';

import '../../../../lib.dart';

class LanguageState extends Equatable {
  const LanguageState({
    Language? selectedLanguage,
    // ThemeData? selectedTheme,
  }) : selectedLanguage = selectedLanguage ?? Language.english;
  // selectedTheme = selectedTheme ?? ThemeData.light();

  final Language selectedLanguage;
  // final ThemeData selectedTheme;

  @override
  List<Object> get props => [
        selectedLanguage,
        // selectedTheme,
      ];

  LanguageState copyWith({Language? selectedLanguage}) {
    return LanguageState(
      selectedLanguage: selectedLanguage ?? this.selectedLanguage,
    );
  }

  // LanguageState copyWithTheme({ThemeData? selectedTheme}) {
  //   return LanguageState(
  //     selectedTheme: selectedTheme ?? this.selectedTheme,
  //   );
  // }
}

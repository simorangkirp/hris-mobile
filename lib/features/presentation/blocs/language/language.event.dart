import 'package:equatable/equatable.dart';

import '../../../../lib.dart';

abstract class LanguageEvent extends Equatable {
  const LanguageEvent();

  @override
  List<Object> get props => [];
}

class ChangeLanguage extends LanguageEvent {
  const ChangeLanguage({required this.selectedLanguage});
  final Language selectedLanguage;

  @override
  List<Object> get props => [selectedLanguage];
}

// class ChangeTheme extends LanguageEvent {
//   const ChangeTheme({required this.selectedTheme});
//   final AppTheme selectedTheme;

//   @override
//   List<Object> get props => [selectedTheme];
// }

class GetLanguage extends LanguageEvent {}

// class GetTheme extends LanguageEvent {}

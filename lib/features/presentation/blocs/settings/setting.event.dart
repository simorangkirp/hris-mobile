import 'package:equatable/equatable.dart';
import '../../../../lib.dart';

abstract class SettingEvent extends Equatable {
  const SettingEvent();

  @override
  List<Object> get props => [];
}

class ChangeLanguage extends SettingEvent {
  const ChangeLanguage(
      {required this.selectedLanguage, required this.selectedTheme});
  final Language selectedLanguage;
  final String selectedTheme;

  @override
  List<Object> get props => [
        selectedLanguage,
        selectedTheme,
      ];
}

// class ChangeTheme extends SettingEvent {
//   const ChangeTheme({required this.selectedTheme});
//   final AppTheme selectedTheme;

//   @override
//   List<Object> get props => [selectedTheme];
// }

class GetLanguage extends SettingEvent {}

// class GetTheme extends SettingEvent {}

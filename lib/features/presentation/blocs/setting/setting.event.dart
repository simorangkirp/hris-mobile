import '../../../../lib.dart';

abstract class SettingsEvent {
  const SettingsEvent();
}

class SettingsInit extends SettingsEvent {}

class SettingsChangeLang extends SettingsEvent {
  final LanguageEntity lang;
  SettingsChangeLang(this.lang);
}

// import 'dart:ui';

// import 'package:owl_hris/features/features.dart';

// class SettingRepoImpl implements SettingsRepository {
//   @override
//   Future<Locale> changeLanguage() async {
//     UserAuthDb auth = UserAuthDb();
//     setLocale(Locale.fromSubtags(languageCode: 'de'));
//     ProfileModel? mods;
//     final res = await auth.getProfileDetail();
//     if (res != null) {
//       mods = res;
//     }
//     return DataSuccess(mods);
//   }
// }

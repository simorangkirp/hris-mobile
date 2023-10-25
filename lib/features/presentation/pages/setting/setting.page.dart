import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:owl_hris/lib.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

@RoutePage()
class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  void dispatchChangeLanguage(String lang) {
    Language? stdLang;
    for (var el in Language.values) {
      if (lang == el.text) {
        stdLang = el;
      } else {
        stdLang = Language.english;
      }
    }
    context.read<SettingBloc>().add(
          ChangeLanguage(
            selectedTheme: isDarkmode ? 'dark' : 'light',
            selectedLanguage: stdLang!,
          ),
        );
  }

  bool expandLang = false;
  bool isDarkmode = false;
  String ddVal = '';
  String ver = '';
  String appBuild = '';

  getCurrTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final selectedTheme = prefs.getString(themePrefsKey);
    if (selectedTheme == "dark") {
      isDarkmode = true;
    } else {
      isDarkmode = false;
    }
  }

  getAppVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    ver = packageInfo.version;
    appBuild = packageInfo.buildNumber;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getAppVersion();
    getCurrTheme();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final ThemeData theme = Theme.of(context);
    Locale myLocale = Localizations.localeOf(context);
    Locale? stdLoc;
    if (myLocale.toString() == 'en') {
      stdLoc = const Locale('en', 'US');
    } else {
      stdLoc = const Locale('id', 'ID');
    }

    Language? stdLang;
    for (var el in Language.values) {
      if (stdLoc == el.value) {
        stdLang = el;
      } else {
        stdLang = Language.english;
      }
    }

    ddVal = stdLang?.text ?? "-";

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(l10n.setting),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: [
              SizedBox(height: 24.h),
              Material(
                elevation: 4,
                borderRadius: BorderRadius.circular(16),
                child: GestureDetector(
                  onTap: () {
                    context.router.push(const PasswordRoute());
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: appBgBlack.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    padding:
                        EdgeInsets.symmetric(horizontal: 8.w, vertical: 16.h),
                    child: Row(
                      children: [
                        Expanded(
                          child: SvgPicture.asset(ConstIconPath.passLock),
                        ),
                        SizedBox(width: 12.w),
                        Expanded(
                          flex: 6,
                          child: Text(
                            l10n.pass,
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 12.h),
              Material(
                elevation: 4,
                borderRadius: BorderRadius.circular(16),
                child: GestureDetector(
                  onTap: () {
                    context.router.push(const PINRoute());
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: appBgBlack.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    padding:
                        EdgeInsets.symmetric(horizontal: 8.w, vertical: 16.h),
                    child: Row(
                      children: [
                        Expanded(
                          child: SvgPicture.asset(ConstIconPath.pinLock),
                        ),
                        SizedBox(width: 12.w),
                        Expanded(
                          flex: 6,
                          child: Text(
                            l10n.pin,
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 12.h),
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        expandLang = !expandLang;
                      });
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 8.w, vertical: 16.h),
                      child: Row(
                        children: [
                          Expanded(
                            child: SvgPicture.asset(ConstIconPath.textIcon),
                          ),
                          SizedBox(width: 12.w),
                          Expanded(
                            flex: 6,
                            child: Text(
                              l10n.language,
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  ExpandableWidget(
                    expand: expandLang,
                    child: SizedBox(
                      width: double.maxFinite,
                      // color: appBgBlack.withOpacity(0.2),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            l10n.selectLang,
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 12.sp,
                            ),
                          ),
                          const Spacer(),
                          DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              value: ddVal,
                              items: [
                                DropdownMenuItem<String>(
                                  value: 'English',
                                  child: Text(
                                    'English',
                                    style: theme.textTheme.bodyMedium,
                                  ),
                                ),
                                DropdownMenuItem<String>(
                                  value: 'Bahasa Indonesia',
                                  child: Text(
                                    'Bahasa Indonesia',
                                    style: theme.textTheme.bodyMedium,
                                  ),
                                ),
                              ],
                              onChanged: (value) {
                                setState(() {
                                  ddVal = value ?? "";
                                });
                                dispatchChangeLanguage(value!);
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12.h),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Row(
                  children: [
                    const Expanded(
                      child: Icon(Icons.dark_mode_rounded),
                    ),
                    SizedBox(width: 12.w),
                    Expanded(
                      flex: 5,
                      child: Text(
                        l10n.darkMode,
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Switch(
                        value: isDarkmode,
                        onChanged: (value) {
                          setState(() {
                            isDarkmode = !isDarkmode;
                          });
                          dispatchChangeLanguage(ddVal);
                        },
                      ),
                    ),
                  ],
                ),
              ),

              const Spacer(),
              Text(
                l10n.appVersion(ver, appBuild),
                style: TextStyle(
                  fontSize: 14.sp,
                  color: appDivider.withOpacity(0.8),
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 48.h),
              // SizedBox(height: 12.h),
              // Material(
              //   elevation: 4,
              //   borderRadius: BorderRadius.circular(16),
              //   child: GestureDetector(
              //     onTap: () {
              //       context.router.push(const NotificationRoute());
              //     },
              //     child: Container(
              //       decoration: BoxDecoration(
              //         color: appBgBlack.withOpacity(0.1),
              //         borderRadius: BorderRadius.circular(16),
              //       ),
              //       padding:
              //           EdgeInsets.symmetric(horizontal: 8.w, vertical: 16.h),
              //       child: Row(
              //         children: [
              //           Expanded(
              //             child: SvgPicture.asset(ConstIconPath.notification),
              //           ),
              //           SizedBox(width: 12.w),
              //           Expanded(
              //             flex: 6,
              //             child: Text(
              //               'Notifications settings',
              //               style: TextStyle(
              //                 fontSize: 14.sp,
              //                 fontWeight: FontWeight.w500,
              //               ),
              //             ),
              //           ),
              //         ],
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

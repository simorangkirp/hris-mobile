import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_portal/flutter_portal.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:owl_hris/lib.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
// import 'features/home/presentation/pages/home.screen.dart';

Future<void> main() async {
  await initializeDependencies();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<AuthBloc>(),
        ),
        BlocProvider(
          create: (context) => sl<AbsentBloc>(),
        ),
        BlocProvider(
          create: (context) => sl<HomeBloc>(),
        ),
        BlocProvider(
          create: (context) => sl<ProfileScreenBloc>(),
        ),
        BlocProvider(
          create: (context) => sl<InboxScrnBloc>(),
        ),
        BlocProvider(
          create: (context) => sl<ApprovalScrnBloc>(),
        ),
        BlocProvider(
          create: (context) => sl<PaidLeaveBloc>(),
        ),
        // BlocProvider(
        //   create: (context) => sl<SettingBloc>(),
        // ),
        BlocProvider(
          create: (context) => sl<SettingBloc>(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void dispatchLogout() {
    BlocProvider.of<AuthBloc>(context).add(OnLogOut());
  }

  void dispatchCancel() {
    BlocProvider.of<AuthBloc>(context).add(AuthCancelLogout());
  }

  @override
  Widget build(BuildContext context) {
    // ThemeData? theme;
    // Locale? locale;

    // buildTheme() {
    //   return theme ?? ThemeData.light();
    // }

    // buildLocale() {
    //   return locale ?? Language.english.value;
    // }

    final appRouter = AppRouter();
    return MultiBlocListener(
      listeners: [
        BlocListener<AuthBloc, AuthState>(
          listener: (authCtx, authState) {
            if (authState is ShowLogoutDialog) {
              onLogOutDialog(
                authCtx,
                () => dispatchLogout(),
                () => dispatchCancel(),
              );
            }
            if (authState is OnLogOutSuccess) {
              authCtx.router.replaceAll([const SplashRoute()]);
            }
            if (authState is AuthCancelSuccess) {
              // setState(() {});
            }
          },
        ),
      ],
      child: BlocBuilder<SettingBloc, SettingState>(
        builder: (settingCtx, state) {
          return ScreenUtilInit(
            builder: (settingCtx, child) => Portal(
              child: MaterialApp.router(
                builder: (settingCtx, child) {
                  final mediaQueryData = MediaQuery.of(settingCtx);
                  final scale = mediaQueryData.textScaleFactor.clamp(1.0, 1.0);
                  return MediaQuery(
                      data: MediaQuery.of(settingCtx)
                          .copyWith(textScaleFactor: scale, boldText: false),
                      child: child!);
                },
                routerConfig: appRouter.config(),
                // routerDelegate: appRouter.delegate(),
                // routeInformationParser: appRouter.defaultRouteParser(),
                debugShowCheckedModeBanner: false,
                // title: 'Flutter Demo',
                locale: state.selectedLanguage.value,
                // state.locale?.value ?? Language.english.value,
                localizationsDelegates: AppLocalizations.localizationsDelegates,
                supportedLocales: AppLocalizations.supportedLocales,
                theme: state.selectedTheme,
                // state.theme ?? ThemeData.light(),
                // buildTheme(),
                //     ThemeData(
                //   colorScheme: ColorScheme.fromSeed(seedColor: appBgWhite),
                //   useMaterial3: true,
                // ),
                // state.theme

                // home: HomeScreen(),
              ),
            ),
            designSize: const Size(360, 640),
          );
        },
      ),
    );
  }
}

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_portal/flutter_portal.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:owl_hris/firebase_options.dart';
import 'package:owl_hris/lib.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// import 'features/home/presentation/pages/home.screen.dart';

Future<void> main() async {
  await initializeDependencies();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
        BlocProvider(
          create: (context) => sl<IntrodBloc>(),
        )
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = AppRouter();
    return BlocBuilder<SettingBloc, SettingState>(
      builder: (context, state) {
        return ScreenUtilInit(
          builder: (context, child) => Portal(
            child: MaterialApp.router(
              builder: (context, child) {
                final mediaQueryData = MediaQuery.of(context);
                final scale = mediaQueryData.textScaleFactor.clamp(1.0, 1.0);
                return MediaQuery(
                  data: MediaQuery.of(context)
                      .copyWith(textScaleFactor: scale, boldText: false),
                  child: Builder(
                    builder: (context) {
                      return Theme(
                        data: state.selectedTheme,
                        child: child!,
                      );
                    },
                  ),
                );
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
              darkTheme: state.selectedTheme,
              // state.theme ?? ThemeData.light(),
              // buildTheme(),
              // theme: ThemeData(
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
    );
  }
}

// class MyAppChildWidget extends StatelessWidget {
//   const MyAppChildWidget({
//     required this.child,
//     super.key,
//   });
//   final Widget child;
//   @override
//   Widget build(BuildContext context) {
//     return child;
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_portal/flutter_portal.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:owl_hris/lib.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Future<Widget> initializeApp(AppConfig config) async {
  return MyApp(
    config: config,
  );
}

class MyApp extends StatelessWidget {
  final AppConfig config;
  const MyApp({
    super.key,
    required this.config,
  });

  @override
  Widget build(BuildContext context) {
    final appRouter = AppRouter();
    return MultiBlocProvider(
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
        BlocProvider(
          create: (context) => sl<PasswordBloc>(),
        ),
        BlocProvider(
          create: (context) => sl<SettingBloc>(),
        ),
        BlocProvider(
          create: (context) => sl<IntrodBloc>(),
        ),
      ],
      child: BlocBuilder<SettingBloc, SettingState>(
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
                debugShowCheckedModeBanner: false,
                locale: state.selectedLanguage.value,
                localizationsDelegates: AppLocalizations.localizationsDelegates,
                supportedLocales: AppLocalizations.supportedLocales,
                theme: state.selectedTheme,
                darkTheme: state.selectedTheme,
              ),
            ),
            designSize: const Size(360, 640),
          );
        },
      ),
    );
  }
}

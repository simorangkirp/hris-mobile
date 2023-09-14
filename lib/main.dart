import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:owl_hris/config/routes/app.routes.dart';
import 'package:owl_hris/features/features.dart';
import 'package:owl_hris/injection.container.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    return ScreenUtilInit(
      builder: (context, child) => MaterialApp.router(
        routerConfig: appRouter.config(),
        // routerDelegate: appRouter.delegate(),
        // routeInformationParser: appRouter.defaultRouteParser(),
        debugShowCheckedModeBanner: false,
        // title: 'Flutter Demo',
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en'),
          Locale('id'),
        ],
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        // home: HomeScreen(),
      ),
      designSize: const Size(360, 640),
    );
  }
}

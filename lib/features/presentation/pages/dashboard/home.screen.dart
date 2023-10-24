import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../lib.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

@RoutePage()
class HomeScreen extends StatefulWidget implements AutoRouteWrapper {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<HomeBloc>(),
      child: this,
    );
  }
}

class _HomeScreenState extends State<HomeScreen> {
  ScrollController sCtrl = ScrollController();
  EntityProfile? model;

  void dispatchGetProfileList() {
    BlocProvider.of<HomeBloc>(context).add(GetProfileInfo());
  }

  void dispatchLogout() {
    BlocProvider.of<AuthBloc>(context).add(OnLogOut());
  }

  void dispatchCancel() {
    BlocProvider.of<AuthBloc>(context).add(AuthCancelLogout());
  }

  @override
  void initState() {
    super.initState();
    dispatchGetProfileList();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final l10n = AppLocalizations.of(context);
    buildHome(EntityProfile? mods) {
      String pgNm = Constant.dashboardPgNm;
      String scMst = l10n.home;
      String scSub = l10n.dashboard;
      return Scaffold(
        appBar: buildAppBar(context, mods, themeData),
        endDrawer: AppNavigationDrawer(
          ctx: context,
          scrNm: pgNm,
          scrMst: scMst,
          scrSub: scSub,
        ),
        body: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: NotificationListener<OverscrollIndicatorNotification>(
                  onNotification: (OverscrollIndicatorNotification overScrl) {
                    overScrl.disallowIndicator();
                    return false;
                  },
                  child: SingleChildScrollView(
                    controller: sCtrl,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(height: 12.h),
                          faturesComponent(context, themeData),
                          const Divider(),
                          SizedBox(height: 8.h),
                          const HomePengumumanWidget(),
                          SizedBox(height: 8.h),
                          const Divider(),
                          SizedBox(height: 8.h),
                          const HomeTaskWidget(),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      );
    }

    return MultiBlocListener(
      listeners: [
        BlocListener<HomeBloc, HomeState>(
          listener: (context, state) {
            if (state is ProfileDataLoaded) {
              model = state.profile;
            }
          },
        ),
        BlocListener<AuthBloc, AuthState>(
          listener: (authContext, state) {
            if (state is ShowLogoutDialog &&
                state.pgNm == Constant.dashboardPgNm) {
              onLogOutDialog(
                authContext,
                () => dispatchLogout(),
                () => dispatchCancel(),
              );
            }
            if (state is OnLogOutSuccess) {
              authContext.router.replaceAll([const SplashRoute()]);
            }
            if (state is AuthCancelSuccess) {
              setState(() {});
            }
          },
        ),
      ],
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          // return const HomeScreenSkeleton();
          if (state is HomeLoading) {
            return const HomeScreenSkeleton();
          } else {
            return buildHome(model);
          }
        },
      ),
    );
  }
}

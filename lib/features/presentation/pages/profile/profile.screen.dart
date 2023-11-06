import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:owl_hris/lib.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

@RoutePage()
class ProfileScreen extends StatefulWidget implements AutoRouteWrapper {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<ProfileScreenBloc>(),
      child: this,
    );
  }
}

class _ProfileScreenState extends State<ProfileScreen> {
  EntityProfile? model;
  late int absCtr;
  String? now;
  String? currPeriod;
  String pgNm = Constant.profilePgNm;
  void dispatchGetProfileInfo() {
    BlocProvider.of<ProfileScreenBloc>(context)
        .add(GetProfileInfoProfileScreen());
  }

  void dispatchGetAbsentInfo() {
    BlocProvider.of<ProfileScreenBloc>(context)
        .add(GetAbsentInfo(currPeriod ?? '-'));
  }

  void dispatchGetActPeriod() {
    BlocProvider.of<ProfileScreenBloc>(context).add(ProfileScrnGetActPeriod(
      model?.lokasitugas ?? "-",
      now ?? "-",
    ));
  }

  // void dispatchLogout() {
  //   BlocProvider.of<AuthBloc>(context).add(OnLogOut());
  // }

  // void dispatchCancel() {
  //   BlocProvider.of<AuthBloc>(context).add(AuthCancelLogout());
  // }

  @override
  void initState() {
    absCtr = 0;
    dispatchGetProfileInfo();
    super.initState();
  }

  buildProfileScreen(BuildContext ctx, EntityProfile? data, int? aCtr) {
    final l10n = AppLocalizations.of(ctx);
    final theme = Theme.of(ctx);
    String scrMst = l10n.profile;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          l10n.profile,
          style: theme.appBarTheme.titleTextStyle,
        ),
        // centerTitle: true,
        // title: Text(
        //   'Profile',
        //   style: TextStyle(
        //     fontSize: 16.sp,
        //     fontWeight: FontWeight.w400,
        //   ),
        // ),
      ),
      endDrawer: AppNavigationDrawer(
        scrNm: pgNm,
        ctx: ctx,
        scrMst: scrMst,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildProfileInfo(data, context),
            SizedBox(height: 12.h),
            buildTimeSheet(context, aCtr),
            SizedBox(height: 12.h),
            buildListMenu(ctx),
          ],
        ),
      ),
    );
  }

  buildProfileSkeleton() {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 72.h),
            buildProfileInfoSkel(),
            SizedBox(height: 18.h),
            buildTimeSheetSkel(),
            SizedBox(height: 18.h),
            buildListMenuSkel(),
          ],
        ),
      ),
    );
  }

  void dispatchLogout() {
    BlocProvider.of<AuthBloc>(context).add(OnLogOut());
  }

  void dispatchCancel() {
    BlocProvider.of<AuthBloc>(context).add(AuthCancelLogout());
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<ProfileScreenBloc, ProfileScreenState>(
          listener: (context, state) {
            if (state is ProfileInfoLoaded) {
              model = state.profile;
              now = DateFormat('yyyy-MM-dd').format(DateTime.now()).toString();
              dispatchGetActPeriod();
            }
            if (state is ProfileScrnActPeriodLoaded) {
              currPeriod = state.period?.periode ?? '-';
              dispatchGetAbsentInfo();
            }
            if (state is AbsentDataLoaded) {
              if (state.listAbsent!.isNotEmpty) {
                for (var e in state.listAbsent!) {
                  if (e.data?.absenIdIn != null || e.data?.absenIdOut != null) {
                    absCtr = absCtr + 1;
                    // log("${e.tanggal} $absCtr");
                  }
                }
              }
            }
          },
        ),
        BlocListener<AuthBloc, AuthState>(
          listener: (logOutContext, authState) {
            if (authState is ShowLogoutDialog &&
                authState.pgNm == Constant.profilePgNm) {
              onLogOutDialog(
                logOutContext,
                () => dispatchLogout(),
                () => dispatchCancel(),
              );
            }
            if (authState is OnLogOutSuccess) {
              logOutContext.router.replaceAll([const SplashRoute()]);
            }
            if (authState is AuthCancelSuccess) {
              setState(() {});
            }
          },
        ),
      ],
      child: BlocBuilder<ProfileScreenBloc, ProfileScreenState>(
        builder: (context, state) {
          if (state is AbsentDataLoaded) {
            return buildProfileScreen(context, model, absCtr);
          } else {
            return buildProfileSkeleton();
          }
        },
      ),
    );
  }
}

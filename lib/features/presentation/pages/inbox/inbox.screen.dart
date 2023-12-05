import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../lib.dart';

@RoutePage()
class InboxScreen extends StatefulWidget {
  const InboxScreen({super.key});

  @override
  State<InboxScreen> createState() => _InboxScreenState();
}

class _InboxScreenState extends State<InboxScreen> {
  List<ApprovalCountEntity>? listApp = [];
  List<NotifEntity>? listNotif = [];
  ScrollController ctrl = ScrollController();
  EntityProfile? profile;
  String pgNm = Constant.ibxNAppPgNm;

  void dispatchGetProfile() {
    BlocProvider.of<ApprovalScrnBloc>(context).add(
      ApprovalScrnGetProfile(),
    );
  }

  void dispatchGetListNotif() {
    BlocProvider.of<InboxScrnBloc>(context).add(
      InboxScrnGetListNotif(),
    );
  }

  // void dispatchInboxInvalidVersion(String msg) {
  //   BlocProvider.of<InboxScrnBloc>(context).add(
  //     InboxScrnGetInvalidVersion(msg),
  //   );
  // }

  void dispatchGetApprvData() {
    BlocProvider.of<InboxScrnBloc>(context).add(
      InboxScrnGetApprvlData(),
    );
  }

  void dispatchLogout() {
    BlocProvider.of<AuthBloc>(context).add(OnLogOut());
  }

  void dispatchCancel() {
    BlocProvider.of<AuthBloc>(context).add(AuthCancelLogout());
  }

  void refreshData() {
    dispatchGetProfile();
  }

  FutureOr onGoBack() {
    refreshData();
    setState(() {});
  }

  Widget loadingInbox(String msg) {
    return Center(
      child: Text(
        msg,
        style: Theme.of(context).textTheme.headlineSmall,
        textAlign: TextAlign.center,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    dispatchGetProfile();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final ThemeData theme = Theme.of(context);
    String scrMst = l10n.inboxNapprv;
    return Scaffold(
      appBar: buildCommAppBar(context, profile),
      endDrawer: AppNavigationDrawer(
        scrNm: pgNm,
        ctx: context,
        scrMst: scrMst,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: MultiBlocListener(
          listeners: [
            BlocListener<ApprovalScrnBloc, ApprovalState>(
              listener: (context, state) {
                if (state is ApprovalProfileLoaded) {
                  profile = state.profile;
                  dispatchGetListNotif();
                  setState(() {});
                }
                // if (state is ApprovalInvalidVersion) {
                //   dispatchInboxInvalidVersion(
                //       state.invalidErrMsg ?? "Invalid Version");
                // }
              },
            ),
            BlocListener<InboxScrnBloc, InboxState>(
              listener: (context, state) {
                if (state is InboxScrnListNotifLoaded) {
                  if (state.listNotif != null) {
                    listNotif = state.listNotif;
                  }
                  dispatchGetApprvData();
                }
                if (state is InboxScrnApprvDataLoaded) {
                  if (state.listApprv != null) {
                    listApp = state.listApprv;
                  }
                }
                if (state is InboxInvalidVersion) {
                  Future.delayed(const Duration(seconds: 3))
                      .then((value) => dispatchLogout());
                }
              },
            ),
            BlocListener<AuthBloc, AuthState>(
              listener: (authContext, state) {
                if (state is ShowLogoutDialog &&
                    state.pgNm == Constant.ibxNAppPgNm) {
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
          child: BlocBuilder<InboxScrnBloc, InboxState>(
            builder: (context, state) {
              if (state is InboxScrnApprvDataLoaded) {
                return NotificationListener<OverscrollIndicatorNotification>(
                  onNotification: (OverscrollIndicatorNotification overScrl) {
                    overScrl.disallowIndicator();
                    return false;
                  },
                  child: SingleChildScrollView(
                    controller: ctrl,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 12.h),
                        buildApprvlItem(context, listApp, (val) {
                          context.router
                              .push(ApprovalRoute(type: val))
                              .then((value) => onGoBack());
                        }),
                        SizedBox(height: 8.h),
                        const Divider(),
                        SizedBox(height: 8.h),
                        Text(
                          l10n.notification,
                          style: theme.textTheme.displayMedium,
                        ),
                        SizedBox(height: 12.h),
                        buildInboxItem(context, listNotif),
                        SizedBox(height: 12.h),
                      ],
                    ),
                  ),
                );
              } else if (state is InboxInvalidVersion) {
                return loadingInbox(state.invalidErrMsg ?? "Invalid version");
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}

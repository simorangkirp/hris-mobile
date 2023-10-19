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

  void dispatchGetListNotif() {
    BlocProvider.of<InboxScrnBloc>(context).add(
      InboxScrnGetListNotif(),
    );
  }

  void dispatchGetApprvData() {
    BlocProvider.of<InboxScrnBloc>(context).add(
      InboxScrnGetApprvlData(),
    );
  }

  void refreshData() {
    dispatchGetListNotif();
  }

  FutureOr onGoBack() {
    refreshData();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    dispatchGetListNotif();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: BlocListener<InboxScrnBloc, InboxState>(
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
          },
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
                        buildApprvlItem(context, listApp, (val) {
                          context.router
                              .push(ApprovalRoute(type: val))
                              .then((value) => onGoBack());
                        }),
                        SizedBox(height: 8.h),
                        Divider(
                          color: appBgBlack.withOpacity(0.3),
                          thickness: 2,
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          l10n.notification,
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        SizedBox(height: 12.h),
                        buildInboxItem(context,listNotif),
                        SizedBox(height: 12.h),
                      ],
                    ),
                  ),
                );
              } else {
                return const CircularProgressIndicator();
              }
            },
          ),
        ),
      ),
    );
  }
}

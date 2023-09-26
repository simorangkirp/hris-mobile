import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../config/routes/app.routes.dart';
import '../../../features.dart';

@RoutePage()
class AbsentScreen extends StatefulWidget {
  const AbsentScreen({super.key});

  @override
  State<AbsentScreen> createState() => _AbsentScreenState();
}

class _AbsentScreenState extends State<AbsentScreen> {
  String period = '';
  EntityProfile appmod = const EntityProfile();
  UserAssignLocationModel? assignLoc;
  AbsentData? data;
  void dispatchGetUserAssignLoc() {
    BlocProvider.of<AbsentBloc>(context).add(GetUserAssignLocation());
  }

  void dispatchGetUserInfo() {
    BlocProvider.of<AbsentBloc>(context).add(AbsentGetUserInfo());
  }

  void dispatchGetCurrentPeriod() {
    BlocProvider.of<AbsentBloc>(context).add(AbsentScrnActPeriod());
  }

  void dispatchGetTodayAbsent() {
    BlocProvider.of<AbsentBloc>(context).add(GetAbsentPeriod(
      period,
    ));
  }

  FutureOr onGoBack() {
    refreshData();
  }

  void refreshData() {
    dispatchGetCurrentPeriod();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    dispatchGetCurrentPeriod();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AbsentBloc, AbsentState>(
      listener: (context, state) {
        if (state is AbsentScrnActPeriodLoaded) {
          period = state.period?.periode ?? "";
          dispatchGetUserAssignLoc();
        }
        if (state is UserAssignLocLoaded) {
          assignLoc = state.assignLoc;
          dispatchGetUserInfo();
        }
        if (state is AbsentUserInfoLoaded) {
          if (state.profileModel != null) {
            appmod = state.profileModel!;
          }
          dispatchGetTodayAbsent();
        }
        if (state is AbsentPeriodLoaded) {
          if (state.listAbsent != null) {
            for (var e in state.listAbsent!) {
              if (e.tanggal ==
                  DateFormat('yyyy-MM-dd').format(DateTime.now())) {
                data = e.data;
              }
            }
          }
        }
      },
      child: BlocBuilder<AbsentBloc, AbsentState>(
        builder: (context, state) {
          if (state is AbsentPeriodLoaded) {
            return buildScreen(
              context,
              appmod,
              assignLoc,
              data,
              (val) => context.router
                  .push(SubmitAbsentRoute(
                    inout: val,
                    period: period,
                  ))
                  .then((value) => onGoBack()),
            );
          } else {
            return const Scaffold(
              body: SafeArea(
                  child: Center(
                child: CircularProgressIndicator(),
              )),
            );
          }
        },
      ),
    );
  }
}

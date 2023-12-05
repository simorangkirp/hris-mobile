import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../lib.dart';

@RoutePage()
class ApprovalScreen extends StatefulWidget {
  const ApprovalScreen({
    @PathParam('type') this.type,
    super.key,
  });

  final String? type;

  @override
  State<ApprovalScreen> createState() => _ApprovalScreenState();
}

class _ApprovalScreenState extends State<ApprovalScreen> {
  final ctrl = PageController(
    initialPage: 0,
  );

  List<ApprovalEntity>? listData = [];

  void dispatchGetApprvListData() {
    BlocProvider.of<ApprovalScrnBloc>(context).add(
      ApprovalScrnGetApproval(widget.type ?? ""),
    );
  }

  void dispatchLogout() {
    BlocProvider.of<AuthBloc>(context).add(OnLogOut());
  }

  Widget approvalInvalid(String msg) {
    return Scaffold(
      body: Center(
        child: Text(
          msg,
          style: Theme.of(context).textTheme.headlineSmall,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    dispatchGetApprvListData();
  }

  @override
  void dispose() {
    super.dispose();
    ctrl.dispose();
  }

  void refreshData() {
    dispatchGetApprvListData();
  }

  FutureOr onGoBack() {
    refreshData();
    setState(() {});
  }

  // ontapActItem(ApprovalDetail data) {
  // dispatchGetApprvDataDetail(data);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () => context.router.pop(),
        ),
        centerTitle: true,
        title: Text(widget.type ?? ""),
      ),
      body: MultiBlocListener(
        listeners: [
          BlocListener<ApprovalScrnBloc, ApprovalState>(
            listener: (context, state) {
              if (state is ApprovalListLoaded) {
                listData = state.listApprv;
              }
              if (state is ApprovalInvalidVersion) {
                Future.delayed(const Duration(seconds: 3))
                    .then((value) => dispatchLogout());
              }
            },
          ),
          BlocListener<AuthBloc, AuthState>(
            listener: (authContext, state) {
              if (state is OnLogOutSuccess) {
                authContext.router.replaceAll([const SplashRoute()]);
              }
              if (state is AuthCancelSuccess) {
                setState(() {});
              }
            },
          ),
        ],
        child: BlocBuilder<ApprovalScrnBloc, ApprovalState>(
          builder: (context, state) {
            if (state is ApprovalInvalidVersion) {
              return approvalInvalid(state.invalidErrMsg ?? "Invalid version");
            } else {
              List<ApprovalDetail> dataAct = [];
              List<ApprovalDetail> dataHist = [];
              if (listData != null) {
                for (var e in listData!) {
                  if (e.tipe == "active") {
                    if (e.detail != null) {
                      for (var el in e.detail!) {
                        dataAct.add(el);
                      }
                    }
                  }
                  if (e.tipe == "history") {
                    if (e.detail != null) {
                      for (var el in e.detail!) {
                        dataHist.add(el);
                      }
                    }
                  }
                }
              }
              return PageView(
                scrollDirection: Axis.horizontal,
                controller: ctrl,
                children: <Widget>[
                  activeList(
                    context,
                    dataAct,
                    (val) {
                      context.router
                          .push(
                            ApprovalDetailRoute(
                              id: val.id,
                              txn: val.notransaksi,
                              mode: ConstantMode.edit,
                              type: widget.type ?? "",
                            ),
                          )
                          .then((value) => onGoBack());
                    },
                  ),
                  historyList(
                    context,
                    dataHist,
                    (val) {
                      context.router
                          .push(
                            ApprovalDetailRoute(
                              id: val.id,
                              txn: val.notransaksi,
                              mode: ConstantMode.view,
                              type: widget.type ?? "",
                            ),
                          )
                          .then((value) => onGoBack());
                    },
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}

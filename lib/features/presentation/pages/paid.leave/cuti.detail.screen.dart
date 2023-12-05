import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../lib.dart';

@RoutePage()
class PaidLeaveDetailScreen extends StatefulWidget {
  const PaidLeaveDetailScreen({
    @PathParam('id') this.id,
    super.key,
  });
  final String? id;

  @override
  State<PaidLeaveDetailScreen> createState() => _PaidLeaveDetailScreenState();
}

class _PaidLeaveDetailScreenState extends State<PaidLeaveDetailScreen> {
  final ctrl = PageController(
    initialPage: 0,
  );

  PaidLeaveDataDetail? data;
  List<PaidLeaveApproval>? listData;

  // Bloc calls
  void dispatchGetDataDetail() {
    BlocProvider.of<PaidLeaveBloc>(context)
        .add(PaidLeaveGetDataDetail(widget.id ?? ""));
  }

  void dispatchLogout() {
    BlocProvider.of<AuthBloc>(context).add(OnLogOut());
  }

  Widget invalidVersion(String msg) {
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
    dispatchGetDataDetail();
  }

  buildScreen(BuildContext context, ThemeData theme) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          widget.id ?? '-',
          style: theme.appBarTheme.titleTextStyle,
        ),
      ),
      body: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (OverscrollIndicatorNotification overScrl) {
          overScrl.disallowIndicator();
          return false;
        },
        child: PageView(
          scrollDirection: Axis.horizontal,
          controller: ctrl,
          children: [
            paidLeaveDetail(
              context,
              '',
              data,
              (comment, cd) {},
            ),
            paidleaveAppHistory(context, listData),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return MultiBlocListener(
      listeners: [
        BlocListener<PaidLeaveBloc, PaidLeaveState>(
          listener: (context, state) {
            if (state is PaidLeaveDetailLoaded) {
              data = state.detail;
              listData = state.detail?.approval;
            }
            if (state is PaidLeaveErrCall) {}
            if (state is PaidLeaveInvalidVersion) {
              Future.delayed(const Duration(seconds: 3))
                  .then((value) => dispatchLogout());
            }
          },
        ),
        BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is OnLogOutSuccess) {
              context.router.replaceAll([const SplashRoute()]);
            }
            if (state is AuthCancelSuccess) {
              setState(() {});
            }
          },
        ),
      ],
      child: BlocBuilder<PaidLeaveBloc, PaidLeaveState>(
        builder: (context, state) {
          if (state is PaidLeaveDetailLoaded) {
            return buildScreen(context, theme);
          }
          if (state is PaidLeaveLoading) {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else if (state is PaidLeaveInvalidVersion) {
            return invalidVersion(state.errMsg ?? "Invalid version");
          } else {
            return const Scaffold(
              body: SizedBox(),
            );
          }
        },
      ),
    );
  }
}

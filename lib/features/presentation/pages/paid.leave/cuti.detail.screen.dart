import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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

  @override
  void initState() {
    super.initState();
    dispatchGetDataDetail();
  }

  buildScreen() {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          widget.id ?? '-',
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
          ),
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
    return BlocListener<PaidLeaveBloc, PaidLeaveState>(
      listener: (context, state) {
        if (state is PaidLeaveDetailLoaded) {
          data = state.detail;
          listData = state.detail?.approval;
        }
        if (state is PaidLeaveErrCall) {}
      },
      child: BlocBuilder<PaidLeaveBloc, PaidLeaveState>(
        builder: (context, state) {
          if (state is PaidLeaveDetailLoaded) {
            return buildScreen();
          }
          if (state is PaidLeaveLoading) {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
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

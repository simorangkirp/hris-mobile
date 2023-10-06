import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../../../lib.dart';

@RoutePage()
class ApprovalDetailScreen extends StatefulWidget {
  const ApprovalDetailScreen({
    @PathParam('id') this.id,
    @PathParam('txn') this.txn,
    @PathParam('mode') required this.mode,
    @PathParam('type') required this.type,
    super.key,
  });

  final String? id;
  final String? txn;
  final String mode, type;
  @override
  State<ApprovalDetailScreen> createState() => _ApprovalDetailScreenState();
}

class _ApprovalDetailScreenState extends State<ApprovalDetailScreen> {
  final ctrl = PageController(
    initialPage: 0,
  );

  ApprovalDetailEntity? data;
  ApprovalDatadetail? detail;
  List<ListApprovalDataDetail>? listData;
  List<ApprovalDetailFileupload>? listDoc;

  void dispatchGetApprvDataDetail(String id, String txn) {
    BlocProvider.of<ApprovalScrnBloc>(context).add(
      ApprovalScrnGetApprovalDataDetail(ApprvDataDetailParams(id, txn)),
    );
  }

  void dispatchSubmitApprovalResponse(String id, String sts, String desc) {
    BlocProvider.of<ApprovalScrnBloc>(context).add(
      ApprovalScrnSubmitResponse(ApprvSubmitResponseParams(id, sts, desc)),
    );
  }

  @override
  void initState() {
    super.initState();
    dispatchGetApprvDataDetail(widget.id ?? "-", widget.txn ?? "-");
  }

  @override
  void dispose() {
    super.dispose();
    ctrl.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ApprovalScrnBloc, ApprovalState>(
      listener: (context, state) {
        if (state is ApprovalDataDetailLoaded) {
          data = state.apprvDetail;
          if (data?.datadetail != null) {
            detail = data!.datadetail;
          }
          if (data?.listapproval != null) {
            listData = data!.listapproval;
          }
          if (data?.fileupload != null) {
            listDoc = data!.fileupload;
          }
        }
        if (state is ApprovalResponseSubmited) {
          Future.delayed(const Duration(seconds: 3)).then((value) {
            context.router.pop();
          });
        }
      },
      child: BlocBuilder<ApprovalScrnBloc, ApprovalState>(
        builder: (context, state) {
          if (state is ApprovalDataDetailLoaded) {
            return Scaffold(
              appBar: AppBar(
                centerTitle: true,
                title: Text(
                  widget.txn ?? "-",
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
                  children: <Widget>[
                    approvalDetail(
                      widget.mode,
                      detail,
                      listDoc,
                      (comment, cd) {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return Dialog(
                              insetPadding: EdgeInsets.symmetric(
                                horizontal: (0.1.sw),
                                vertical: (0.41.sh),
                              ),
                              backgroundColor: appBgWhite,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(8.w),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Confirmation',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16.sp,
                                        color: appBgBlack.withOpacity(0.4),
                                      ),
                                    ),
                                    Text(
                                      'Are you sure want to proceed?',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14.sp,
                                      ),
                                    ),
                                    SizedBox(height: 8.h),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const SizedBox(),
                                        Row(
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                context.router.pop();
                                              },
                                              child: Text(
                                                'Cancel',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 12.sp,
                                                  color: appWarning,
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 12.w),
                                            InkWell(
                                              onTap: () {
                                                context.router.pop();
                                                dispatchSubmitApprovalResponse(
                                                    widget.id ?? '1',
                                                    cd,
                                                    comment);
                                              },
                                              child: Text(
                                                'Confirm',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 12.sp,
                                                  color: appBtnBlue,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                    approvalHistory(listData),
                  ],
                ),
              ),
            );
          } else if (state is ApprovalResponseSubmited) {
            return Scaffold(
              body: Padding(
                padding: Constant.appPadding,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 0.1.sh),
                    Lottie.asset(ConstantLottie.submitSuccess),
                    SizedBox(height: 12.h),
                    Text(
                      state.msg ?? "",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 22.sp,
                        color: appBgBlack.withOpacity(0.8),
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else if (state is ApprovalScrnLoading) {
            return Scaffold(
              body: Padding(
                padding: Constant.appPadding,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 0.12.sh),
                    Lottie.asset(ConstantLottie.submitLoading),
                    SizedBox(height: 12.h),
                    Text(
                      'Please wait while we processing your request...',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 22.sp,
                        color: appBgBlack.withOpacity(0.8),
                      ),
                    )
                  ],
                ),
              ),
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}

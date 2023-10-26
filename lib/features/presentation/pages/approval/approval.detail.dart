import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import '../../../../lib.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/foundation.dart'
    show TargetPlatform, defaultTargetPlatform;

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
    final l10n = AppLocalizations.of(context);
    final ThemeData theme = Theme.of(context);
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
                      context,
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
                                vertical:
                                    (defaultTargetPlatform == TargetPlatform.iOS
                                        ? 0.395.sh
                                        : 0.42.sh),
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(8.w),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      l10n.confirm_msg,
                                      style:
                                          Theme.of(context).textTheme.bodyLarge,
                                    ),
                                    SizedBox(height: 4.h),
                                    Text(
                                      l10n.proceed_msg,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium,
                                    ),
                                    const Spacer(),
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
                                                l10n.cancelBtn,
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
                                                l10n.confirmBtn,
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
                    approvalHistory(context, listData),
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
                    Lottie.asset(ConstantLottie.submitSuccess),
                    SizedBox(height: 12.h),
                    Text(
                      state.msg ?? "",
                      textAlign: TextAlign.center,
                      style: theme.textTheme.displayLarge,
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
                    Lottie.asset(ConstantLottie.submitLoading),
                    SizedBox(height: 12.h),
                    Text(
                      l10n.process_req_msg,
                      textAlign: TextAlign.center,
                      style: theme.textTheme.displayLarge,
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

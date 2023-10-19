import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../lib.dart';

@RoutePage()
class PaidLeaveFormScreen extends StatefulWidget {
  const PaidLeaveFormScreen({
    @PathParam('params') this.param,
    super.key,
  });
  final String? param;

  @override
  State<PaidLeaveFormScreen> createState() => _PaidLeaveFormScreenState();
}

class _PaidLeaveFormScreenState extends State<PaidLeaveFormScreen> {
  List<String> listCat = [];
  List<KeyVal> listCatDetail = [];
  PaidLeaveSubmitModel submitmodel = PaidLeaveSubmitModel.init();
  ScrollController ctrl = ScrollController();

  void dispatchGetCategory() {
    BlocProvider.of<PaidLeaveBloc>(context).add(PaidLeaveGetCategory());
  }

  void dispatchGetCatDetail() {
    BlocProvider.of<PaidLeaveBloc>(context)
        .add(PaidLeaveGetCatDetail(submitmodel.slctCat ?? ""));
  }

  void dispatchSubmitForm() {
    BlocProvider.of<PaidLeaveBloc>(context)
        .add(PaidLeaveSubmitData(submitmodel));
  }

  FutureOr onGoBack() {
    refreshData();
  }

  void refreshData() {
    dispatchGetCategory();
    if (widget.param != null) {
      submitmodel.imagePhoto =
          const Base64Decoder().convert(widget.param!.split(',').last);
    }
    setState(() {});
  }

  final GlobalKey<FormState> paidLeaveFormKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    dispatchGetCategory();
    if (widget.param != null) {
      const Base64Decoder().convert(widget.param!.split(',').last);
    }
  }

  Future getImage() async {
    final img = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (img == null) return;
    final imgTmp = File(img.path);
    submitmodel.imagePhoto = imgTmp.readAsBytesSync();
    if (submitmodel.imagePhoto != null) {
      submitmodel.smbFlUpl = base64Encode(submitmodel.imagePhoto!);
    }
    // if (imagePhoto != null) {
    //   convImgStr = convertUint8ListToString(imagePhoto!);
    // }
    setState(() {
      // _image = imgTmp;
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    buildBtmDialog() {
      return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            height: 0.228.sh,
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(vertical: 18.h, horizontal: 12.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  l10n.chooseFr,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16.sp,
                    color: appDivider.withOpacity(0.9),
                  ),
                ),
                SizedBox(height: 24.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {
                        getImage().then((value) => Navigator.pop(context));
                      },
                      child: Container(
                        padding: EdgeInsets.all(4.w),
                        child: Column(
                          children: [
                            SvgPicture.asset(
                              ConstIconPath.gallery,
                              height: 32,
                              colorFilter: const ColorFilter.mode(
                                  appDivider, BlendMode.srcIn),
                            ),
                            SizedBox(height: 12.h),
                            Text(
                              l10n.gallery,
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 12.w),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                        context.router
                            .push(const PaidLeaveCameraRoute())
                            .then((value) => onGoBack());
                      },
                      child: Container(
                        padding: EdgeInsets.all(4.w),
                        child: Column(
                          children: [
                            SvgPicture.asset(
                              ConstIconPath.cameraIcon,
                              height: 32,
                              colorFilter: const ColorFilter.mode(
                                  appDivider, BlendMode.srcIn),
                            ),
                            SizedBox(height: 12.h),
                            Text(
                              l10n.camera,
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        },
      );
    }

    buildScreen() {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            l10n.paidLeavForm,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: Constant.appPadding,
          child: NotificationListener<OverscrollIndicatorNotification>(
            onNotification: (OverscrollIndicatorNotification overScrl) {
              overScrl.disallowIndicator();
              return false;
            },
            child: SingleChildScrollView(
              controller: ctrl,
              child: Form(
                key: paidLeaveFormKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 18.h),
                    Text(
                      l10n.category,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12.sp,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    PortalFormDropdown(
                      submitmodel.slctCat ?? "",
                      listCat,
                      onChange: (v) {
                        setState(() {
                          submitmodel.slctCat = v;
                        });
                        dispatchGetCatDetail();
                      },
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return l10n.cat_req_msg;
                        } else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      l10n.catDetail,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12.sp,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    PortalFormDropdownKeyVal(
                      submitmodel.slctCatDt,
                      listCatDetail,
                      onChange: (v) {
                        setState(() {
                          submitmodel.slctCatDt = v;
                          submitmodel.smbCatDet = v.value;
                        });
                      },
                      validator: (val) {
                        if (val == null || val.value.isEmpty) {
                          return l10n.cat_det_req_msg;
                        } else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      l10n.paidLeaveDt,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12.sp,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    CommonDateRangePicker(
                      readOnly: true,
                      hint: l10n.chooseDt,
                      dtRgCtrl: submitmodel.dtRgCtrl,
                      retCtrl: submitmodel.retCtrl,
                      totCtrl: submitmodel.totCtrl,
                      dataCtrl: submitmodel.dataCtrl,
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return l10n.dtReq;
                        } else {
                          return null;
                        }
                      },
                    ),
                    Visibility(
                        visible: submitmodel.totCtrl!.text != '0',
                        child: SizedBox(height: 6.h)),
                    Visibility(
                      visible: submitmodel.totCtrl!.text != '0',
                      child: Text(
                        l10n.retDt,
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12.sp,
                        ),
                      ),
                    ),
                    Visibility(
                        visible: submitmodel.totCtrl!.text != '0',
                        child: SizedBox(height: 4.h)),
                    Visibility(
                      visible: submitmodel.totCtrl!.text != '0',
                      child: CustomFormTextField(
                        readOnly: true,
                        controller: submitmodel.retCtrl,
                        fillColor: appBgWhite,
                        validator: (val) {
                          if (val == null || val.isEmpty) {
                            return l10n.dtReq;
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      l10n.uploadFile,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12.sp,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    submitmodel.imagePhoto == null
                        ? InkWell(
                            onTap: () => buildBtmDialog(),
                            child: Container(
                              width: double.maxFinite,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: appLightGrey),
                              ),
                              padding: EdgeInsets.symmetric(
                                  vertical: 10.w, horizontal: 12.h),
                              child: Column(
                                children: [
                                  Icon(
                                    Icons.file_upload_outlined,
                                    size: 28.h,
                                    color: appBtnBlue,
                                  ),
                                  SizedBox(height: 2.h),
                                  Text(
                                    l10n.chooseFile,
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w500,
                                      color: appDivider.withOpacity(0.8),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        : InkWell(
                            onTap: () => buildBtmDialog(),
                            child: Container(
                              width: double.maxFinite,
                              height: 0.3.sh,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: appLightGrey),
                                image: DecorationImage(
                                  image: MemoryImage(submitmodel.imagePhoto!),
                                ),
                              ),
                            ),
                          ),
                    SizedBox(height: 8.h),
                    Text(
                      l10n.desc,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12.sp,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    CustomFormTextField(
                      onChanged: (val) {
                        setState(() {
                          submitmodel.smbDsc = val;
                        });
                      },
                      fillColor: appBgWhite,
                      hint: l10n.write_comm,
                    ),
                    SizedBox(height: 24.h),
                    Align(
                      alignment: Alignment.centerRight,
                      child: InkWell(
                        onTap: () {
                          if (paidLeaveFormKey.currentState!.validate()) {
                            if (submitmodel.imagePhoto == null &&
                                submitmodel.slctCat == "SAKIT" &&
                                submitmodel.slctCatDt?.value == "CUTI07") {
                              ScaffoldMessenger.of(context)
                                ..hideCurrentSnackBar()
                                ..showSnackBar(failSnackBar(
                                  message: l10n.photo_req,
                                ));
                            } else {
                              dispatchSubmitForm();
                            }
                          }
                        },
                        child: Text(
                          l10n.submitBtn,
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            color: appBtnBlue,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 32.h),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    }

    return BlocListener<PaidLeaveBloc, PaidLeaveState>(
      listener: (context, state) {
        if (state is PaidLeaveCatLoaded) {
          if (state.cat != null) {
            for (var e in state.cat!) {
              listCat.add(e.kelompokizin ?? '-');
            }
            setState(() {});
          }
        }
        if (state is PaidLeaveErrCall) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(failSnackBar(
              message: state.errMsg,
            ));
          dispatchGetCategory();
        }
        if (state is PaidLeaveSubmitFormSuccess) {
          Future.delayed(const Duration(seconds: 3)).then((value) {
            context.router.navigate(const PaidLeaveMainRoute());
          });
        }
        if (state is PaidLeaveCatDetailLoaded) {
          if (state.catDetail != null) {
            listCatDetail.clear();
            for (var el in state.catDetail!) {
              listCatDetail.add(KeyVal(el.jenisijin ?? "-", el.idjenis ?? "-"));
            }
            setState(() {});
          }
        }
      },
      child: BlocBuilder<PaidLeaveBloc, PaidLeaveState>(
        builder: (context, state) {
          if (state is PaidLeaveSubmitFormLoading) {
            return Scaffold(
              body: SafeArea(
                child: Padding(
                  padding: Constant.appPadding,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 0.12.sh),
                      Lottie.asset(ConstantLottie.submitLoading),
                      SizedBox(height: 12.h),
                      Text(
                        l10n.process_req_msg,
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
              ),
            );
          } else if (state is PaidLeaveSubmitFormSuccess) {
            return Scaffold(
              body: SafeArea(
                child: Padding(
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
              ),
            );
          } else {
            return buildScreen();
          }
        },
      ),
    );
  }
}

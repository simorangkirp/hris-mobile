import 'dart:io';
import 'dart:typed_data';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:owl_hris/config/config.dart';
import 'package:owl_hris/core/core.dart';

import '../../cuti.dart';

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
  String sltDt = 'Choose date';
  String? slctCat;
  KeyVal? slctCatDt;
  String? total;
  String? retDt;
  ScrollController ctrl = ScrollController();
  Uint8List? imagePhoto;

  void dispatchGetCategory() {
    BlocProvider.of<PaidLeaveBloc>(context).add(PaidLeaveGetCategory());
  }

  void dispatchGetCatDetail() {
    BlocProvider.of<PaidLeaveBloc>(context)
        .add(PaidLeaveGetCatDetail(slctCat ?? ""));
  }

  @override
  void initState() {
    super.initState();
    dispatchGetCategory();
  }

  Future getImage() async {
    final img = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (img == null) return;
    final imgTmp = File(img.path);
    imagePhoto = imgTmp.readAsBytesSync();
    // if (imagePhoto != null) {
    //   convImgStr = convertUint8ListToString(imagePhoto!);
    // }
    setState(() {
      // _image = imgTmp;
    });
  }

  @override
  Widget build(BuildContext context) {
    buildBtmDialog() {
      return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            height: 0.224.sh,
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(vertical: 18.h, horizontal: 12.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Choose from',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16.sp,
                    color: appDivider.withOpacity(0.8),
                  ),
                ),
                SizedBox(height: 24.h),
                Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          getImage().then((value) => Navigator.pop(context));
                        },
                        child: Column(
                          children: [
                            Icon(
                              Icons.yard_rounded,
                              size: 32.h,
                            ),
                            SizedBox(height: 8.h),
                            Text(
                              'Gallery',
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: appDivider.withOpacity(0.8),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                          context.router.push(const PaidLeaveCameraRoute());
                        },
                        child: Column(
                          children: [
                            Icon(
                              Icons.camera,
                              size: 32.h,
                            ),
                            SizedBox(height: 8.h),
                            Text(
                              'Camera',
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: appDivider.withOpacity(0.8),
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
          title: Text('Paid Leave Form'),
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 18.h),
                  Text('Kategori'),
                  SizedBox(height: 4.h),
                  PortalFormDropdown(
                    slctCat,
                    listCat,
                    onChange: (v) {
                      setState(() {
                        slctCat = v;
                      });
                      dispatchGetCatDetail();
                    },
                  ),
                  SizedBox(height: 8.h),
                  Text('Detail'),
                  SizedBox(height: 4.h),
                  PortalFormDropdownKeyVal(
                    slctCatDt,
                    listCatDetail,
                    onChange: (v) {
                      setState(() {
                        slctCatDt = v;
                      });
                    },
                  ),
                  SizedBox(height: 8.h),
                  Text('Tanggal Cuti'),
                  SizedBox(height: 4.h),
                  InkWell(
                    onTap: () => pickDateRange(context).then((value) {
                      var splitStr = diffDays(value).split(',');
                      setState(() {
                        sltDt = splitStr[0];
                        total = splitStr[1];
                        retDt = splitStr[2];
                      });
                    }),
                    child: Container(
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: appLightGrey),
                      ),
                      padding: EdgeInsets.symmetric(
                          vertical: 10.w, horizontal: 12.h),
                      child: Text(
                        sltDt,
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  Visibility(
                      visible: total != null, child: SizedBox(height: 2.h)),
                  Visibility(
                    visible: total != null,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "${total ?? ''} hari",
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  Visibility(
                      visible: total != '0' && retDt != null,
                      child: SizedBox(height: 6.h)),
                  Visibility(
                      visible: total != '0' && retDt != null,
                      child: Text('Tgl Kembali')),
                  Visibility(
                      visible: total != '0' && retDt != null,
                      child: SizedBox(height: 4.h)),
                  Visibility(
                    visible: total != '0' && retDt != null,
                    child: Container(
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: appLightGrey),
                      ),
                      padding: EdgeInsets.symmetric(
                          vertical: 10.w, horizontal: 12.h),
                      child: Text(
                        retDt ?? '',
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text('Unggah File'),
                  SizedBox(height: 4.h),
                  InkWell(
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
                            'Choose a file',
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              color: appDivider.withOpacity(0.8),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text('Alasan'),
                  SizedBox(height: 4.h),
                  CustomFormTextField(
                    fillColor: appBgWhite,
                    hint: 'Write a comment...',
                  ),
                  SizedBox(height: 24.h),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'Submit',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: appBtnBlue,
                      ),
                    ),
                  ),
                ],
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
        if (state is PaidLeaveCatDetailLoaded) {
          if (state.catDetail != null) {
            for (var el in state.catDetail!) {
              listCatDetail.add(KeyVal(el.jenisijin ?? "-", el.idjenis ?? "-"));
            }
            setState(() {});
          }
        }
      },
      child: BlocBuilder<PaidLeaveBloc, PaidLeaveState>(
        builder: (context, state) {
          return buildScreen();
        },
      ),
    );
  }
}

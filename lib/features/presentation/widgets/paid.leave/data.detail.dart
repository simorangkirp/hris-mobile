import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../lib.dart';

Widget paidLeaveDetail(String mode, PaidLeaveDataDetail? mod,
    Function(String comment, String cd) onAction) {
  TextEditingController tCtrl = TextEditingController();
  ScrollController ctrl = ScrollController();
  // ScrollController sCtrl = ScrollController();
  Uint8List? photo;
  if (mod?.fileupload != null) {
    if (mod!.fileupload!.isNotEmpty) {
      if (mod.fileupload?[0].value != null) {
        photo = const Base64Decoder()
            .convert(mod.fileupload![0].value!.split(',').last);
      }
    }
  }
  return Column(
    children: [
      Expanded(
        child: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (OverscrollIndicatorNotification overScrl) {
            overScrl.disallowIndicator();
            return false;
          },
          child: SingleChildScrollView(
            controller: ctrl,
            child: Padding(
              padding: Constant.appPadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Details',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16.sp,
                    ),
                  ),
                  SizedBox(height: 12.h),
                  IntrinsicHeight(
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'No transaksi',
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12.sp,
                                  color: appBgBlack.withOpacity(0.7),
                                ),
                              ),
                              Text(
                                mod?.notransaksi ?? "-",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 2.w),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Nama',
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12.sp,
                                  color: appBgBlack.withOpacity(0.7),
                                ),
                              ),
                              Text(
                                mod?.namakaryawan ?? "-",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 12.h),
                  IntrinsicHeight(
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Tanggal pengajuan',
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12.sp,
                                  color: appBgBlack.withOpacity(0.7),
                                ),
                              ),
                              Text(
                                mod?.tglpengajuan ?? "-",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 2.w),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Jenis ijin',
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12.sp,
                                  color: appBgBlack.withOpacity(0.7),
                                ),
                              ),
                              Text(
                                mod?.namajenis ?? '-',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 12.h),
                  IntrinsicHeight(
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Tanggal dari',
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12.sp,
                                  color: appBgBlack.withOpacity(0.7),
                                ),
                              ),
                              Text(
                                mod?.tgldari ?? "-",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 2.w),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Tanggal sampai',
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12.sp,
                                  color: appBgBlack.withOpacity(0.7),
                                ),
                              ),
                              Text(
                                mod?.tglsampai ?? "-",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 12.h),
                  IntrinsicHeight(
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Keterangan',
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12.sp,
                                  color: appBgBlack.withOpacity(0.7),
                                ),
                              ),
                              Text(
                                mod?.keterangan ?? "-",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 2.w),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Jumlah hari',
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12.sp,
                                  color: appBgBlack.withOpacity(0.7),
                                ),
                              ),
                              Text(
                                mod?.jumlahhari ?? "-",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 12.h),
                  IntrinsicHeight(
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Status batal',
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12.sp,
                                  color: appBgBlack.withOpacity(0.7),
                                ),
                              ),
                              Text(
                                mod?.statusbatal ?? "-",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 2.w),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Alasan batal',
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12.sp,
                                  color: appBgBlack.withOpacity(0.7),
                                ),
                              ),
                              Text(
                                "-",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 12.h),
                  IntrinsicHeight(
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Tanggal dari real',
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12.sp,
                                  color: appBgBlack.withOpacity(0.7),
                                ),
                              ),
                              Text(
                                mod?.tgldarireal ?? "-",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 2.w),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Tanggal sampai real',
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12.sp,
                                  color: appBgBlack.withOpacity(0.7),
                                ),
                              ),
                              Text(
                                mod?.tglsampaireal ?? "-",
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 12.h),
                  Visibility(
                    visible: photo != null,
                    child: Text(
                      'Documents',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16.sp,
                      ),
                    ),
                  ),
                  Visibility(
                      visible: photo != null, child: SizedBox(height: 12.h)),
                  photo != null
                      ? Container(
                          height: 0.6.sh,
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: MemoryImage(
                                photo,
                              ),
                              fit: BoxFit.contain,
                            ),
                          ),
                        )
                      : const SizedBox(),
                  // SizedBox(height: 4.h),
                  // SizedBox(
                  //   width: double.maxFinite,
                  //   height: 0.24.sw,
                  //   child: ListView.builder(
                  //     scrollDirection: Axis.horizontal,
                  //     controller: sCtrl,
                  //     shrinkWrap: true,
                  //     itemCount: 10,
                  //     itemBuilder: (context, index) {
                  //       return Padding(
                  //         padding: EdgeInsets.only(right: 8.w),
                  //         child: Container(
                  //           height: 0.2.sw,
                  //           width: 0.2.sw,
                  //           color: appBgBlack,
                  //         ),
                  //       );
                  //     },
                  //   ),
                  // ),
                  SizedBox(height: 12.h),

                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: List.generate(
                  //     4,
                  //     (index) => Container(
                  //       height: 0.2.sw,
                  //       width: 0.2.sw,
                  //       color: appBgBlack,
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
      Visibility(
        visible: mode == ConstantMode.edit,
        child: Material(
          elevation: 4,
          shadowColor: appBgBlack.withOpacity(0.4),
          child: Container(
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  width: 1.2,
                  color: appIconMenuTitle.withOpacity(0.2),
                ),
              ),
              color: appBgWhite,
            ),
            height: 0.2.sh,
            width: double.maxFinite,
            padding: EdgeInsets.all(12.w),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  flex: 4,
                  child: IntrinsicHeight(
                    child: TextFormField(
                      controller: tCtrl,
                      autocorrect: false,
                      decoration: const InputDecoration(
                        hintText: "Tuliskan komentar...",
                      ),
                      minLines: 1,
                      maxLines: 3,
                      maxLength: 62,
                    ),
                  ),
                ),
                SizedBox(width: 8.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          onAction(tCtrl.text, '1');
                          // widget.onAction(statsCtrl.text, "1");
                        },
                        child: Material(
                          borderRadius: BorderRadius.circular(8),
                          elevation: 4,
                          shadowColor: appNotifAbsIcn,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            height: 24.h,
                            width: 56.w,
                            child: Center(
                              child: SvgPicture.asset(
                                ConstIconPath.checkIcon,
                                fit: BoxFit.fitHeight,
                                colorFilter: const ColorFilter.mode(
                                  appNotifAbsIcn,
                                  BlendMode.srcIn,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      GestureDetector(
                        onTap: () {
                          onAction(tCtrl.text, '2');
                          // widget.onAction(statsCtrl.text, "2");
                        },
                        child: Material(
                          borderRadius: BorderRadius.circular(8),
                          shadowColor: appWarning,
                          elevation: 4,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            height: 24.h,
                            width: 56.w,
                            child: Center(
                              child: SvgPicture.asset(
                                ConstIconPath.declineIcon,
                                fit: BoxFit.fitHeight,
                                colorFilter: const ColorFilter.mode(
                                  appWarning,
                                  BlendMode.srcIn,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      GestureDetector(
                        onTap: () {
                          onAction(tCtrl.text, '3');
                          // widget.onAction(statsCtrl.text, "3");
                        },
                        child: Material(
                          borderRadius: BorderRadius.circular(8),
                          shadowColor: appCutiBg,
                          elevation: 4,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            height: 24.h,
                            width: 56.w,
                            child: Center(
                              child: SvgPicture.asset(
                                ConstIconPath.exclamIcon,
                                fit: BoxFit.fitHeight,
                                colorFilter: const ColorFilter.mode(
                                  appCutiBg,
                                  BlendMode.srcIn,
                                ),
                              ),
                            ),
                            // SvgPicture.asset(
                            //   ConstIconPath.iconPen,
                            //   fit: BoxFit.fitHeight,
                            //   colorFilter: const ColorFilter.mode(
                            //     appBgWhite,
                            //     BlendMode.srcIn,
                            //   ),
                            // ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ],
  );
}

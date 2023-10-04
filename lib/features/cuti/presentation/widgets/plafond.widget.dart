import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';

import '../../../../lib.dart';

Widget buildPlafond(List<PaidLeavePlafond>? list) {
  return list != null && list.isNotEmpty
      ? ListView.builder(
          itemCount: list.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            var data = list[index];
            return Padding(
              padding: EdgeInsets.only(bottom: 12.h),
              child: Material(
                elevation: 8,
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                  child: Column(
                    children: [
                      IntrinsicHeight(
                        child: Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Period',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12.sp,
                                    ),
                                  ),
                                  Text(
                                    data.periodecuti ?? '-',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12.sp,
                                      color: appBgBlack.withOpacity(0.6),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 4.w),
                            Expanded(
                              flex: 3,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Annual leave',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12.sp,
                                    ),
                                  ),
                                  Text(
                                    data.hakcuti ?? '-',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12.sp,
                                      color: appBgBlack.withOpacity(0.6),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 4.w),
                            Expanded(
                              flex: 3,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Available',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12.sp,
                                    ),
                                  ),
                                  Text(
                                    data.sisa ?? '-',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12.sp,
                                      color: appBgBlack.withOpacity(0.6),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 4.w),
                            Expanded(
                              flex: 2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Taken',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12.sp,
                                    ),
                                  ),
                                  Text(
                                    data.diambil ?? '-',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12.sp,
                                      color: appBgBlack.withOpacity(0.6),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        )
      : const SizedBox();
}



// Stack(
    //   children: [
    //     Container(
    //       decoration: BoxDecoration(
    //         borderRadius: BorderRadius.circular(8),
    //       ),
    //       padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
    //       child: Column(
    //         children: [
    //           Row(
    //             children: [
    //               Expanded(
    //                 child: IntrinsicHeight(
    //                   child: Column(
    //                     crossAxisAlignment: CrossAxisAlignment.start,
    //                     children: [
    //                       Text(
    //                         'Period',
    //                         style: TextStyle(
    //                           fontWeight: FontWeight.w400,
    //                           fontSize: 12.sp,
    //                         ),
    //                       ),
    //                       Text(
    //                         data?.periodecuti ?? '-',
    //                         style: TextStyle(
    //                           fontWeight: FontWeight.w600,
    //                           fontSize: 12.sp,
    //                           color: appBgBlack.withOpacity(0.6),
    //                         ),
    //                       ),
    //                     ],
    //                   ),
    //                 ),
    //               ),
    //               Expanded(
    //                 child: IntrinsicHeight(
    //                   child: Column(
    //                     crossAxisAlignment: CrossAxisAlignment.start,
    //                     children: [
    //                       Text(
    //                         'Annual leave',
    //                         style: TextStyle(
    //                           fontWeight: FontWeight.w400,
    //                           fontSize: 12.sp,
    //                         ),
    //                       ),
    //                       Text(
    //                         data?.hakcuti ?? '-',
    //                         style: TextStyle(
    //                           fontWeight: FontWeight.w600,
    //                           fontSize: 12.sp,
    //                           color: appBgBlack.withOpacity(0.6),
    //                         ),
    //                       ),
    //                     ],
    //                   ),
    //                 ),
    //               ),
    //             ],
    //           ),
    //           SizedBox(height: 4.h),
    //           Row(
    //             children: [
    //               Expanded(
    //                 child: IntrinsicHeight(
    //                   child: Column(
    //                     crossAxisAlignment: CrossAxisAlignment.start,
    //                     children: [
    //                       Text(
    //                         'Available',
    //                         style: TextStyle(
    //                           fontWeight: FontWeight.w400,
    //                           fontSize: 12.sp,
    //                         ),
    //                       ),
    //                       Text(
    //                         data?.sisa ?? '-',
    //                         style: TextStyle(
    //                           fontWeight: FontWeight.w600,
    //                           fontSize: 12.sp,
    //                           color: appBgBlack.withOpacity(0.6),
    //                         ),
    //                       ),
    //                     ],
    //                   ),
    //                 ),
    //               ),
    //               Expanded(
    //                 child: IntrinsicHeight(
    //                   child: Column(
    //                     crossAxisAlignment: CrossAxisAlignment.start,
    //                     children: [
    //                       Text(
    //                         'Taken',
    //                         style: TextStyle(
    //                           fontWeight: FontWeight.w400,
    //                           fontSize: 12.sp,
    //                         ),
    //                       ),
    //                       Text(
    //                         data?.diambil ?? '-',
    //                         style: TextStyle(
    //                           fontWeight: FontWeight.w600,
    //                           fontSize: 12.sp,
    //                           color: appBgBlack.withOpacity(0.6),
    //                         ),
    //                       ),
    //                     ],
    //                   ),
    //                 ),
    //               ),
    //             ],
    //           ),
    //         ],
    //       ),
    //     ),
    //     Positioned(
    //       right: -2.w,
    //       bottom: -8.h,
    //       child: SizedBox(
    //         width: 78.h,
    //         height: 78.h,
    //         child: SvgPicture.asset(
    //           Constant.owlBird,
    //           fit: BoxFit.cover,
    //         ),
    //       ),
    //     ),
    //   ],
    // ),
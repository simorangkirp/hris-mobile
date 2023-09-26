import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:owl_hris/lib.dart';

Widget addressInfo(AddressEntity? model) {
  ScrollController ctrl = ScrollController();
  return SingleChildScrollView(
    controller: ctrl,
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        children: [
          SizedBox(height: 4.h),
          Text(
            'Address',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 18.sp,
              color: appBgBlack.withOpacity(0.7),
            ),
          ),
          model != null
              ? model.dataDetails!.isNotEmpty
                  ? ListView.builder(
                      controller: ctrl,
                      shrinkWrap: true,
                      itemCount: model.dataDetails!.length,
                      itemBuilder: (context, index) {
                        var item = model.dataDetails![index];
                        return Padding(
                          padding: EdgeInsets.symmetric(vertical: 12.h),
                          child: buildAddressItem(item),
                        );
                      },
                    )
                  : const SizedBox()
              : const SizedBox(),
        ],
      ),
    ),
  );
}

buildAddressItem(AddressDetails data) {
  return Column(
    children: [
      IntrinsicHeight(
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Alamat',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12.sp,
                      color: appBgBlack.withOpacity(0.7),
                    ),
                  ),
                  Text(
                    data.alamat ?? "-",
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
                    'Kota',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12.sp,
                      color: appBgBlack.withOpacity(0.7),
                    ),
                  ),
                  Text(
                    data.kota ?? "-",
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
                    'Kode pos',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12.sp,
                      color: appBgBlack.withOpacity(0.7),
                    ),
                  ),
                  Text(
                    data.kodepos   ?? "-",
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
                    'Provinsi',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12.sp,
                      color: appBgBlack.withOpacity(0.7),
                    ),
                  ),
                  Text(
                    data.provinsi ?? "-",
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
    ],
  );
}

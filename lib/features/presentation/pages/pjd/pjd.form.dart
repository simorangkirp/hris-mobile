import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../lib.dart';

@RoutePage()
class PJDFormScreen extends StatefulWidget {
  const PJDFormScreen({super.key});

  @override
  State<PJDFormScreen> createState() => _PJDFormScreenState();
}

class _PJDFormScreenState extends State<PJDFormScreen> {
  List<String> listString = ['satu', 'dua', 'tiga', 'empat'];
  String? selectedString;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        child: Padding(
          padding: Constant.appPadding,
          child: ListView(
            children: [
              SizedBox(height: 18.h),
              Text(
                'Jenis perjalanan dinas',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12.sp,
                ),
              ),
              SizedBox(height: 4.h),
              PortalFormDropdown(
                selectedString,
                listString,
                onChange: (v) {
                  // setState(() {
                  //   submitmodel.slctCat = v;
                  // });
                  // dispatchGetCatDetail();
                },
                validator: (val) {
                  if (val == null || val.isEmpty) {
                    return 'Category required!';
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(height: 8.h),
              Text(
                'PT tujuan',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12.sp,
                ),
              ),
              SizedBox(height: 4.h),
              PortalFormDropdown(
                selectedString,
                listString,
                onChange: (v) {
                  // setState(() {
                  //   submitmodel.slctCat = v;
                  // });
                  // dispatchGetCatDetail();
                },
                validator: (val) {
                  if (val == null || val.isEmpty) {
                    return 'Category required!';
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(height: 8.h),
              Text(
                'Keperluan',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12.sp,
                ),
              ),
              SizedBox(height: 4.h),
              CustomFormTextField(
                onChanged: (val) {},
                fillColor: appBgWhite,
                maxLength: 300,
                minLine: 1,
                maxLine: 7,
                ),
              SizedBox(height: 8.h),
              Text(
                'Tiket pesawat',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12.sp,
                ),
              ),
              SizedBox(height: 4.h),
              PortalFormDropdown(
                selectedString,
                listString,
                onChange: (v) {
                  // setState(() {
                  //   submitmodel.slctCat = v;
                  // });
                  // dispatchGetCatDetail();
                },
                validator: (val) {
                  if (val == null || val.isEmpty) {
                    return 'Category required!';
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(height: 8.h),
              Text(
                'Uang muka',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12.sp,
                ),
              ),
              SizedBox(height: 4.h),
              CustomFormTextField(
                onChanged: (val) {},
                fillColor: appBgWhite,
              ),
              SizedBox(height: 8.h),
            ],
          ),
        ),
      ),
    );
  }
}

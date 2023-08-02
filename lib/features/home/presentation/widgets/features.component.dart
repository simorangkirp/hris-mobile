import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../config/themes/colors.dart';

class FeaturesComponent extends StatefulWidget {
  const FeaturesComponent({super.key});

  @override
  State<FeaturesComponent> createState() => _FeaturesComponentState();
}

class _FeaturesComponentState extends State<FeaturesComponent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Features',
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w900,
          ),
        ),
        SizedBox(height: 12.h),
        GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: 8,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            childAspectRatio: 4 / 5,
            mainAxisSpacing: 12.w,
            crossAxisSpacing: 12.h,
          ),
          itemBuilder: (context, index) {
            return SizedBox(
              height: 72.h,
              width: 32.w,
              // padding:
              //     EdgeInsets.symmetric(horizontal: 4.w, vertical: 8.h),
              // color: Colors.red,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: appDisabledTextField,
                    ),
                    padding: EdgeInsets.all(12.w),
                    child: SizedBox(
                      child: SvgPicture.asset('assets/icons/setting-cogs.svg'),
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    'Ajukan \nPJD',
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            );
          },
        )
      ],
    );
  }
}

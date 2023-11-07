import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/constants/constants.dart';

Widget completeIntroPage(BuildContext context) {
  return SizedBox(
    width: 1.sw,
    height: 1.sh,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 0.6.sw,
          width: 0.6.sw,
          child: LottieBuilder.asset(
            ConstantLottie.introComplete,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(height: 12.h),
        Text(
          'You are all set.',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ],
    ),
  );
}

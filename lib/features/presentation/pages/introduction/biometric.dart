import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/constants/constants.dart';

Widget biometricIntroPage(BuildContext context) {
  return SizedBox(
    width: 1.sw,
    height: 1.sh,
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 0.6.sw,
          width: 0.6.sw,
            child: LottieBuilder.asset(
              ConstantLottie.introBiometric,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 12.h),
          Text(
            'Biometric confirmation.',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ],
      ),
    ),
  );
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/constants/constants.dart';

Widget boostIntroPage(BuildContext context) {
  return SizedBox(
    width: 1.sw,
    height: 1.sh,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(height: 0.12.sh),
        Text(
          'Boost your\nproductivity.',
          style: Theme.of(context).textTheme.headlineLarge,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 0.18.sw),
        SizedBox(
          height: 0.7.sw,
          width: 0.7.sw,
          child: LottieBuilder.asset(
            ConstantLottie.introBoost,
            fit: BoxFit.fill,
          ),
        ),
      ],
    ),
  );
}

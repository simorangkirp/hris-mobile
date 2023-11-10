import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/constants/constants.dart';

Widget collabIntroPage(BuildContext context) {
  return SizedBox(
    width: 1.sw,
    height: 1.sh,
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 0.12.sh),
          Text(
            'Collaborate in\nreal time.',
            style: Theme.of(context).textTheme.headlineLarge,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 0.22.sw),
          SizedBox(
            height: 0.5.sw,
            width: 0.8.sw,
            child: LottieBuilder.asset(
              ConstantLottie.introCollab,
              fit: BoxFit.fill,
            ),
          ),
        ],
      ),
    ),
  );
}

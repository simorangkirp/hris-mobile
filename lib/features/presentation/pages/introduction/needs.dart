import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/constants/constants.dart';

Widget needsIntroPage(BuildContext context) {
  return SizedBox(
    width: 1.sw,
    height: 1.sh,
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 0.12.sh),
          Text(
            'Your needs,\nall in one place',
            style: Theme.of(context).textTheme.headlineLarge,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 0.21.sw),
          SizedBox(
            height: 0.7.sw,
            width: 0.9.sw,
            child: LottieBuilder.asset(
              ConstantLottie.introNeeds,
              fit: BoxFit.fill,
            ),
          ),
        ],
      ),
    ),
  );
}

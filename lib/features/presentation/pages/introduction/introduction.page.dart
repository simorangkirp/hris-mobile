import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'introduction.dart';

@RoutePage()
class IntroductionScreen extends StatefulWidget {
  const IntroductionScreen({super.key});

  @override
  State<IntroductionScreen> createState() => _IntroductionScreenState();
}

class _IntroductionScreenState extends State<IntroductionScreen> {
  PageController ctrl = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            PageView(
              controller: ctrl,
              children: [
                selfServiceIntroPage(context),
                approvalIntroPage(context),
                biometricIntroPage(context),
                completeIntroPage(context),
              ],
            ),
            Container(
              alignment: const Alignment(0, 0.75),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('Skip'),
                  SmoothPageIndicator(controller: ctrl, count: 4),
                  Text('Next')
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

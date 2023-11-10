import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../lib.dart';

@RoutePage()
class IntroductionScreen extends StatefulWidget {
  const IntroductionScreen({super.key});

  @override
  State<IntroductionScreen> createState() => _IntroductionScreenState();
}

class _IntroductionScreenState extends State<IntroductionScreen> {
  PageController ctrl = PageController();
  bool isLast = false;

  void dispatchSubmitIntro() {
    BlocProvider.of<IntrodBloc>(context).add(IntrodSubmitIntro());
  }

  void redirectIntrScreen() {
    context.router.replace(LoginRoute(param: 'bio'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<IntrodBloc, IntrodState>(
        listener: (context, state) {
          if (state is IntrodInfoSubmited) {
            redirectIntrScreen();
          }
        },
        child: SafeArea(
          child: Stack(
            children: [
              PageView(
                onPageChanged: (value) {
                  if (value == 2) {
                    setState(() {
                      isLast = true;
                    });
                  } else {
                    setState(() {
                      isLast = false;
                    });
                  }
                },
                controller: ctrl,
                children: [
                  boostIntroPage(context),
                  needsIntroPage(context),
                  collabIntroPage(context),
                  // completeIntroPage(context),
                ],
              ),
              Container(
                alignment: const Alignment(0, 0.75),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Visibility(
                      visible: !isLast,
                      replacement: const SizedBox(),
                      child: GestureDetector(
                        onTap: () => dispatchSubmitIntro(),
                        child: Text(
                          'Skip',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ),
                    ),
                    SmoothPageIndicator(
                      controller: ctrl,
                      count: 3,
                      effect: ExpandingDotsEffect(
                        activeDotColor:
                            Theme.of(context).listTileTheme.selectedColor!,
                        dotColor: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                    Visibility(
                      visible: isLast,
                      replacement: const SizedBox(),
                      child: Text(
                        'Done',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

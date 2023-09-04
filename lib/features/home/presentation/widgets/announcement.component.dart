import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:owl_hris/lib.dart';


class HomePengumumanWidget extends StatefulWidget {
  // final Function(BuildContext) showSnBar;
  const HomePengumumanWidget({
    // required this.showSnBar,
    super.key,
  });

  @override
  State<HomePengumumanWidget> createState() => _HomePengumumanWidgetState();
}

class _HomePengumumanWidgetState extends State<HomePengumumanWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Announcement',
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w900,
              ),
            ),
            GestureDetector(
              // onTap: () => widget.showSnBar(context),
              child: Text(
                'See all',
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  color: appButtonBlue,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 12.h),
        const ContentSliderWidget(),
      ],
    );
  }
}

class ContentSliderWidget extends StatefulWidget {
  const ContentSliderWidget({super.key});

  @override
  State<ContentSliderWidget> createState() => _ContentSliderWidgetState();
}

class _ContentSliderWidgetState extends State<ContentSliderWidget> {
  late final PageController pageCtrl;
  int pageNo = 0;

  late final Timer carasouelTimer;
  List<String> pht = [
    'assets/image/devs/news1.png',
    'assets/image/devs/news2.png',
    'assets/image/devs/news3.jpg',
    'assets/image/devs/news4.jpg',
    'assets/image/devs/news5.jpg',
  ];

  Timer getTimer() {
    return Timer.periodic(const Duration(seconds: 5), (timer) {
      if (pageNo == 5) {
        pageNo = 0;
      }
      pageCtrl.animateToPage(pageNo,
          duration: const Duration(seconds: 1), curve: Curves.easeInOutCirc);
      pageNo++;
    });
  }

  @override
  void initState() {
    super.initState();
    pageCtrl = PageController(
      initialPage: 0,
      viewportFraction: 0.88,
    );
    carasouelTimer = getTimer();
  }

  @override
  void dispose() {
    super.dispose();
    pageCtrl.dispose();
  }

  @override
  Widget build(BuildContext _) {
    return Column(
      children: [
        SizedBox(
          height: 132.h,
          child: PageView.builder(
            onPageChanged: (value) {
              pageNo = value;
              setState(() {});
            },
            padEnds: false,
            controller: pageCtrl,
            itemCount: pht.length,
            itemBuilder: (_, index) {
              return AnimatedBuilder(
                animation: pageCtrl,
                builder: (ctx, child) {
                  return child!;
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      height: 132.h,
                      width: 224.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: appBgBlack,
                      ),
                      child: Image.asset(
                        pht[index],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            5,
            (index) => index != pageNo
                ? Container(
                    margin: const EdgeInsets.all(4),
                    child: Icon(
                      Icons.circle,
                      size: 12,
                      color: appBgBlack.withOpacity(0.5),
                    ),
                  )
                : Container(
                    margin: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      color: appBgBlack,
                    ),
                    height: 12,
                    width: 32,
                  ),
          ),
        ),
      ],
    );
  }
}
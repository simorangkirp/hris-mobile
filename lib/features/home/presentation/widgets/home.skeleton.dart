import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:owl_hris/lib.dart';

class HomeScreenSkeleton extends StatefulWidget {
  const HomeScreenSkeleton({super.key});

  @override
  State<HomeScreenSkeleton> createState() => _HomeScreenSkeletonState();
}

class _HomeScreenSkeletonState extends State<HomeScreenSkeleton> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: 1.sh,
          width: 1.sw,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CommonShimmer(
                    isLoading: true,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 42.w,
                              width: 42.w,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: appBgBlack.withOpacity(0.5),
                              ),
                            ),
                            SizedBox(width: 12.w),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 12.sp,
                                  width: 72.w,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    color: appBgBlack.withOpacity(0.5),
                                  ),
                                ),
                                SizedBox(height: 4.h),
                                Container(
                                  height: 16.sp,
                                  width: 132.w,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    color: appBgBlack.withOpacity(0.5),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Container(
                          height: 24.w,
                          width: 24.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: appBgBlack.withOpacity(0.5),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 24.h),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Features',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      SizedBox(height: 12.h),
                      CommonShimmer(
                        isLoading: true,
                        child: GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: 8,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                            childAspectRatio: 4 / 5,
                            mainAxisSpacing: 12.w,
                            crossAxisSpacing: 12.h,
                          ),
                          itemBuilder: (context, index) {
                            // var item = collection[index];
                            return SizedBox(
                              height: 72.h,
                              width: 32.w,
                              // padding:
                              //     EdgeInsets.symmetric(horizontal: 4.w, vertical: 8.h),
                              // color: Colors.red,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: appButtonBlue.withOpacity(0.3),
                                    ),
                                    height: 32.h,
                                    width: 32.h,
                                    // child: SvgPicture.asset(
                                    //   item.iconPath!,
                                    //   fit: BoxFit.scaleDown,
                                    //   colorFilter:
                                    //       const ColorFilter.mode(appBgBlack, BlendMode.srcIn),
                                    // ),
                                  ),
                                  SizedBox(height: 4.h),
                                  Container(
                                    height: 12.h,
                                    width: double.maxFinite,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(2),
                                      color: appBgBlack.withOpacity(0.5),
                                    ),
                                  )
                                  // Text(
                                  //   item.id!,
                                  //   style: TextStyle(
                                  //     fontSize: 12.sp,
                                  //     fontWeight: FontWeight.w500,
                                  //   ),
                                  //   textAlign: TextAlign.center,
                                  // ),
                                ],
                              ),
                            );
                          },
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 12.h),
                  Column(
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
                      SizedBox(
                        height: 116,
                        child: ListView.builder(
                          shrinkWrap: false,
                          scrollDirection: Axis.horizontal,
                          itemCount: 3,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.only(right: 8.w),
                              child: CommonShimmer(
                                isLoading: true,
                                child: Container(
                                  height: 112.h,
                                  width: 224.w,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: appBgBlack,
                                  ),
                                  // child: Image.asset(
                                  //   pht[index],
                                  //   fit: BoxFit.cover,
                                  // ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          5,
                          (index) => Padding(
                            padding: EdgeInsets.symmetric(horizontal: 4.w),
                            child: CommonShimmer(
                              isLoading: true,
                              child: Container(
                                margin: const EdgeInsets.all(4),
                                child: Icon(
                                  Icons.circle,
                                  size: 12,
                                  color: appBgBlack.withOpacity(0.5),
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 12.h),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Active Task',
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
                      const SizedBox(height: 12),
                      const CommonShimmer(
                        isLoading: true,
                        child: AssigneeTask(),
                      ),
                      const SizedBox(height: 24),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

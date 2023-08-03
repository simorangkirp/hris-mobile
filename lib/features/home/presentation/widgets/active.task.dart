import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/themes/colors.dart';

class HomeTaskWidget extends StatefulWidget {
  // final Function(BuildContext) showSnBar;
  const HomeTaskWidget({
    // required this.showSnBar,
    super.key,
  });

  @override
  State<HomeTaskWidget> createState() => _HomeTaskWidgetState();
}

class _HomeTaskWidgetState extends State<HomeTaskWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
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
        const AssigneeTask(),
        const SizedBox(height: 24),
      ],
    );
  }
}

class AssigneeTask extends StatefulWidget {
  const AssigneeTask({super.key});

  @override
  State<AssigneeTask> createState() => _AssigneeTaskState();
}

class _AssigneeTaskState extends State<AssigneeTask> {
  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(8),
      elevation: 6,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: appBgBlack,
          // border: Border.all(color: appDivider),
        ),
        width: double.maxFinite,
        height: 124,
        child: const Row(
          children: [],
        ),
      ),
    );
  }
}

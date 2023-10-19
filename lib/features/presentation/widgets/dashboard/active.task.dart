import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../lib.dart';

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
    final l10n = AppLocalizations.of(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              l10n.actTask,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w900,
              ),
            ),
            GestureDetector(
              // onTap: () => widget.showSnBar(context),
              child: Visibility(
                visible: false,
                child: Text(
                  l10n.seeAll,
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    color: appButtonBlue,
                  ),
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
      elevation: 2,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: appBgWhite,
          // border: Border.all(color: appDivider),
        ),
        width: double.maxFinite,
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
        child: Text(
          "This feature isn't available to everyone yet.",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 12.sp,
            color: appBgBlack.withOpacity(0.6),
          ),
        ),
      ),
    );
  }
}

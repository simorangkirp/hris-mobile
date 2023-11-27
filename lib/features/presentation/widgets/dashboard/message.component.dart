import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../lib.dart';

Widget messagesWidget(BuildContext context, int total) {
  final ThemeData theme = Theme.of(context);
  final l10n = AppLocalizations.of(context);

  return Material(
    elevation: 4,
    borderRadius: BorderRadius.circular(12),
    child: Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.secondary,
        borderRadius: BorderRadius.circular(12),
      ),
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.priority_high_rounded,
            color: appText5,
            size: 14.sp,
          ),
          Expanded(
            child: Text(
              l10n.homeAppMsg(total.toString()),
              textAlign: TextAlign.center,
              style: theme.textTheme.displaySmall,
            ),
          ),
        ],
      ),
    ),
  );
}

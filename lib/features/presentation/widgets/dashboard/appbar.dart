import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../../lib.dart';

buildAppBar(BuildContext context, EntityProfile? mod, ThemeData theme) {
  Uint8List? byteImg;
  if (mod?.photo != null) {
    byteImg = const Base64Decoder().convert(mod!.photo!);
  }
  final l10n = AppLocalizations.of(context);

  return AppBar(
    automaticallyImplyLeading: false,
    title: Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(120),
          child: SizedBox(
            height: 42.w,
            width: 42.w,
            child: byteImg != null
                ? Image.memory(
                    byteImg,
                    fit: BoxFit.cover,
                  )
                : Container(
                    color: appBgBlack,
                  ),
          ),
        ),
        SizedBox(width: 12.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              l10n.welcomeBack,
              style: theme.textTheme.titleSmall,
            ),
            Text(
              mod?.namakaryawan ?? "",
              style: theme.textTheme.titleMedium,
            ),
          ],
        ),
      ],
    ),
  );
}

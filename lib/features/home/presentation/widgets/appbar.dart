import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../lib.dart';

buildAppBar(EntityProfile? mod) {
  Uint8List? byteImg;
  if(mod?.photo != null){
  byteImg = const Base64Decoder().convert(mod!.photo!);
  }
  return AppBar(
    automaticallyImplyLeading: false,
    title: Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(120),
          child: SizedBox(
            height: 42.w,
            width: 42.w,
            child: byteImg!= null ? Image.memory(
              byteImg,
              fit: BoxFit.cover,
            ): Container(color: appBgBlack,),
          ),
        ),
        SizedBox(width: 12.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Welcome Back!',
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              mod?.namakaryawan ?? "",
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

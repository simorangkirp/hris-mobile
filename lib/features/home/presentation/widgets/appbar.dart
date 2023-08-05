import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

buildAppBar() {
  return AppBar(
    title: Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(120),
          child: SizedBox(
            height: 42.w,
            width: 42.w,
            child: Image.asset(
              'assets/image/serenia-0363.jpg',
              fit: BoxFit.cover,
            ),
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
              'Patrick S',
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

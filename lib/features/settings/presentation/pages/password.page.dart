import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class PasswordScreen extends StatefulWidget {
  const PasswordScreen({super.key});

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Change password'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 12.h),
            Text(
              'Reset password',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 18.sp,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              "Please insert your account password, we'll send OTP code to your connected number.",
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 12.sp,
              ),
            ),
            SizedBox(height: 12.h),
            Text(
              'Password',
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 8.h),
            TextFormField(
              maxLines: 1,
              maxLength: 24,
              decoration: const InputDecoration(
                hintText: 'password',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

@RoutePage()
class PINScreen extends StatefulWidget {
  const PINScreen({super.key});

  @override
  State<PINScreen> createState() => _PINScreenState();
}

class _PINScreenState extends State<PINScreen> {
  bool enable = true;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          l10n.pin,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          // child: verifyPin(context),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    l10n.pin_enable_msg,
                    style: TextStyle(
                      fontSize: 14.sp,
                    ),
                  ),
                  Switch(
                    value: enable,
                    onChanged: (value) {
                      setState(() {
                        enable = !enable;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(height: 8.h),
              Text(
                l10n.reset_pin,
                style: TextStyle(
                  fontSize: 14.sp,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

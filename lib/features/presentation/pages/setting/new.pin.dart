import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../config/config.dart';

@RoutePage()
class NewPINScreen extends StatefulWidget {
  const NewPINScreen({super.key});

  @override
  State<NewPINScreen> createState() => _NewPINScreenState();
}

class _NewPINScreenState extends State<NewPINScreen> {
  List<TextEditingController> listCtrl = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Please enter your new PIN',
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 48.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(listCtrl.length, (index) {
              var ctrl = listCtrl[index];
              return SizedBox(
                height: 58,
                width: 52,
                child: TextFormField(
                  controller: ctrl,
                  decoration: InputDecoration(
                    hintText: "*",
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: //hasFocus ?
                            const BorderSide(color: appLightGrey, width: 1)
                        //  : BorderSide.none,
                        ),
                    disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(color: appLightGrey)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide:
                            const BorderSide(color: appButtonBlue, width: 1)),
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(color: appWarning)),
                    focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide:
                            const BorderSide(color: appWarning, width: 1.5)),
                  ),
                  style: Theme.of(context).textTheme.titleLarge,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(1),
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  onChanged: (value) {
                    if (value.length == 1) {
                      FocusScope.of(context).nextFocus();
                    }
                  },
                ),
              );
            }),
          ),
          SizedBox(height: 24.h),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: appBtnBlue,
            ),
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(vertical: 12.h),
            child: Center(
              child: Text(
                'SUBMIT',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 14.sp,
                  color: appBgWhite,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

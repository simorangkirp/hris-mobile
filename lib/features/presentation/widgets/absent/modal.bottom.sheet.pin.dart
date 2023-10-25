import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../lib.dart';

Future<void> modalBtnPIN(BuildContext context,
    List<TextEditingController> listCtrl, Function() onSubmitPin) async {
  final l10n = AppLocalizations.of(context);
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        contentPadding: EdgeInsets.all(12.h),
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: InkWell(
                onTap: () {
                  context.router.pop();
                },
                child: SvgPicture.asset(ConstIconPath.declineIcon),
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              l10n.pin_cd_verify,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16.sp,
                color: appBgBlack.withOpacity(0.8),
              ),
            ),
            SizedBox(height: 12.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(listCtrl.length, (index) {
                var ctrl = listCtrl[index];
                return SizedBox(
                  height: 42.h,
                  width: 38.w,
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
                    cursorColor: appBtnBlue,
                    style: Theme.of(context).textTheme.bodySmall,
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
            SizedBox(height: 16.h),
            InkWell(
              onTap: () {
                 context.router.pop();
                 onSubmitPin();
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: appBtnBlue,
                ),
                width: double.maxFinite,
                height: 42.h,
                child: Center(
                  child: Text(
                    l10n.verifyBtn,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16.sp,
                      color: appBgWhite,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}

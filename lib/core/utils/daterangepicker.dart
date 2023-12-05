import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../lib.dart';

class CommonDateRangePicker extends StatefulWidget {
  const CommonDateRangePicker({
    this.dtRgCtrl,
    this.onAction,
    this.disabledBorder,
    this.enabled,
    this.enabledBorder,
    this.errorBorder,
    this.errorMessage,
    this.fillColor,
    this.focusColor,
    this.focusNode,
    this.focusedBorder,
    this.focusedErrorBorder,
    this.hint,
    this.idleColor,
    this.inputAction,
    this.isDense = true,
    this.label,
    this.maxLength,
    this.maxLine,
    this.obscureText,
    this.onChange,
    this.onChanged,
    this.precision,
    this.prefix,
    this.readOnly,
    this.suffix,
    this.validator,
    this.totCtrl,
    this.retCtrl,
    this.dataCtrl,
    super.key,
  });
  final TextEditingController? dtRgCtrl;
  final TextEditingController? totCtrl;
  final TextEditingController? retCtrl;
  final TextEditingController? dataCtrl;
  final Function(TextEditingController)? onChange;
  final FocusNode? focusNode;
  final bool? readOnly, enabled, obscureText;
  final bool isDense;
  final int? maxLine, maxLength, precision;
  final Widget? suffix;
  final Widget? prefix;
  final String? errorMessage;
  final OutlineInputBorder? enabledBorder,
      disabledBorder,
      focusedBorder,
      errorBorder,
      focusedErrorBorder;
  final String? hint, label;
  final Function(String?)? onChanged, onAction;
  final String? Function(String?)? validator;

  ///* Constant fill color that ignore form state. When this called, [focusColor] & [idleColor] shall be ignored
  final Color? fillColor;

  ///* fill color when focus, if fillColor is [null]
  final Color? focusColor;

  ///* fill color when idle, if fillColor is [null]
  final Color? idleColor;
  final TextInputAction? inputAction;

  @override
  State<CommonDateRangePicker> createState() => _CommonDateRangePickerState();
}

class _CommonDateRangePickerState extends State<CommonDateRangePicker> {
  FocusNode focusNode = FocusNode();
  Color fillColor = appBgWhite;
  bool valid = false;
  String? retDt;
  @override
  Widget build(BuildContext context) {
    Color fillColor = Theme.of(context).colorScheme.secondary;
    final l10n = AppLocalizations.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IntrinsicHeight(
          child: Row(
            children: [
              Material(
                elevation: 4,
                borderRadius: BorderRadius.circular(12),
                child: GestureDetector(
                  onTap: () => pickDateRange(context).then((value) {
                    var splitStr = diffDays(value).split(',');
                    widget.dtRgCtrl?.text = splitStr[0];
                    widget.totCtrl?.text = splitStr[1];
                    widget.retCtrl?.text = splitStr[2];
                    widget.dataCtrl?.text = diffDays(value);
                    setState(() {});
                  }),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: appNotifCutIcn.withOpacity(0.8),
                    ),
                    height: 38.h,
                    width: 38.h,
                    child: SvgPicture.asset(
                      ConstIconPath.calendarDays,
                      fit: BoxFit.scaleDown,
                      colorFilter:
                          const ColorFilter.mode(appBgWhite, BlendMode.srcIn),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: TextFormField(
                  readOnly: widget.readOnly ?? false,
                  controller: widget.dtRgCtrl,
                  validator: (value) {
                    if (widget.validator != null) {
                      final stringReturn = widget.validator!(value);
                      setState(() {
                        if (stringReturn != null && stringReturn.isNotEmpty) {
                          valid = true;
                        } else {
                          valid = false;
                        }
                      });
                      return stringReturn;
                    } else {
                      return null;
                    }
                  }, //widget.validator,
                  onChanged: widget.onChanged,
                  focusNode: (widget.focusNode ?? focusNode),
                  maxLength: widget.maxLength,
                  maxLines: widget.maxLine,
                  obscureText: widget.obscureText ?? false,
                  // inputFormatters: inputformat,
                  textInputAction: widget.inputAction,
                  onFieldSubmitted: widget.onAction,
                  // cursorColor: widget.cursorColor ?? VccFillLoginField,
                  style: Theme.of(context).textTheme.bodyMedium,
                  decoration: InputDecoration(
                    errorStyle: TextStyle(fontSize: 12.sp, color: appWarning),
                    errorText: widget.errorMessage,
                    counterText: '',
                    prefixIcon: widget.prefix,
                    isDense: widget.isDense,
                    enabled: widget.enabled ?? true,
                    labelText: widget.label,
                    // focusColor: appBgWhite,
                    floatingLabelStyle: TextStyle(
                      color: appBgBlack,
                      fontWeight: FontWeight.w600,
                      fontSize: 12.sp,
                    ),
                    labelStyle: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: appBgBlack,
                    ),
                    hintText: widget.hint,
                    hintStyle: TextStyle(
                      fontSize: 12.sp,
                    ),
                    filled: true,
                    fillColor: valid
                        ? fillColor
                        : (widget.fillColor != null)
                            ? fillColor
                            : (!(widget.enabled ?? true))
                                ? appFieldUnselect
                                : fillColor,
                    enabledBorder: widget.enabledBorder ??
                        // const UnderlineInputBorder(
                        //   borderSide: BorderSide(color: appLightGrey, width: 2),
                        // ),
                        OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: //hasFocus ?
                                const BorderSide(color: appLightGrey, width: 1)
                            //  : BorderSide.none,
                            ), //(color: appFieldUnselect)),
                    disabledBorder: widget.disabledBorder ??
                        OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide:
                                const BorderSide(color: appDisabledTextField)),
                    focusedBorder: widget.focusedBorder ??
                        OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide:
                              const BorderSide(color: appButtonBlue, width: 1),
                        ),
                    errorBorder: widget.errorBorder ??
                        OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(color: appWarning)),
                    focusedErrorBorder: widget.focusedErrorBorder ??
                        OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(
                                color: appWarning, width: 1.5)),
                  ),
                ),
              ),
            ],
          ),
        ),
        Visibility(
          visible: widget.totCtrl?.text != null,
          child: SizedBox(height: 2.h),
        ),
        Visibility(
          visible: widget.totCtrl?.text != null,
          child: Align(
            alignment: Alignment.centerRight,
            child: Text(
              "${widget.totCtrl?.text ?? '-'} ${l10n.day}",
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

Future pickDateRange(BuildContext ctx) async {
  DateTimeRange? newDateRange = await showDateRangePicker(
    initialEntryMode: DatePickerEntryMode.calendarOnly,
    builder: (ctx, child) {
      return Theme(
        data: ThemeData.light().copyWith(
          colorScheme: const ColorScheme.dark(
            primary: appBgBlack,
            onPrimary: appBgWhite,
            surface: appBgWhite,
            onSurface: appBgBlack,
            secondary: appBgWhite,
            onSecondary: appBgWhite,
          ),

          // // Here I Chaged the overline to my Custom TextStyle.
          // textTheme: TextTheme(
          //   labelSmall: TextStyle(fontSize: 16, color: appBgBlack),
          // ),
          dialogBackgroundColor: appBgBlack,
        ),
        child: child!,
      );
    },
    context: ctx,
    firstDate: DateTime(1900),
    lastDate: DateTime(2999),
  );
  return newDateRange;
}

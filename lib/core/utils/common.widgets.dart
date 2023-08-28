import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:heroicons/heroicons.dart';
import 'package:intl/intl.dart';
import 'package:owl_hris/config/routes/app.routes.dart';
import 'package:shimmer/shimmer.dart';

import '../../config/themes/colors.dart';
import 'utils.dart';

class CustomFormTextField extends StatefulWidget {
  final Key? key;
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
  final TextEditingController? controller;
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

  const CustomFormTextField(
      {this.key,
      this.hint,
      this.label,
      this.validator,
      this.precision,
      this.onChanged,
      this.onAction,
      this.inputAction,
      this.focusNode,
      this.fillColor,
      this.focusColor,
      this.idleColor,
      // this.cursorColor,
      this.readOnly,
      this.controller,
      this.enabled,
      this.maxLine,
      this.maxLength,
      this.isDense = true,
      this.enabledBorder,
      this.disabledBorder,
      this.focusedBorder,
      this.errorBorder,
      this.focusedErrorBorder,
      this.suffix,
      this.prefix,
      this.obscureText,
      this.errorMessage})
      : super(key: key);

  @override
  State<CustomFormTextField> createState() => _CustomFormTextFieldState();
}

class _CustomFormTextFieldState extends State<CustomFormTextField> {
  FocusNode focusNode = FocusNode();
  Color fillColor = appLightGrey;
  bool valid = false;

  @override
  void initState() {
    // focusNode.addListener(() {
    //   if (focusNode.hasFocus) {
    //     setState(() {
    //       fillColor = widget.focusColor ?? appBgWhite;
    //     });
    //   } else {
    //     setState(() {
    //       fillColor = widget.idleColor ?? VccFillLoginField;
    //     });
    //   }
    // });
    super.initState();
  }

  // bool hasFocus = false;
  @override
  Widget build(BuildContext context) {
    // final focusNode = FocusNode();
    return TextFormField(
      readOnly: widget.readOnly ?? false,
      controller: widget.controller,
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
      style: TextStyle(
        color: appBgBlack,
        fontSize: 16.sp,
      ),
      decoration: InputDecoration(
        errorStyle: const TextStyle(fontSize: 12, color: appWarning),
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
          fontSize: 16.sp,
        ),
        labelStyle: TextStyle(
          fontSize: 16.sp,
          color: appBgBlack,
        ),
        hintText: widget.hint,
        hintStyle: TextStyle(
          fontSize: 16.sp,
        ),
        filled: true,
        fillColor: valid
            ? appValidateField
            : (widget.fillColor != null)
                ? widget.fillColor
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
                borderSide: BorderSide(
                    color: widget.fillColor != null
                        ? appDisabledTextField
                        : appDisabledTextField)),
        focusedBorder: widget.focusedBorder ??
            OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                    color: widget.fillColor ?? appButtonBlue, width: 1)),
        errorBorder: widget.errorBorder ??
            OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: appWarning)),
        focusedErrorBorder: widget.focusedErrorBorder ??
            OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: appWarning, width: 1.5)),
      ),
    );
  }
}

class ButtonConfirm extends StatefulWidget {
  final Function()? onTap;
  final String text;
  final double? width;
  final Color? color;
  final double? height;
  final double? textsize;
  final double? borderRadius;
  final double? verticalMargin;
  final double? padding;
  final FontWeight? fontWeight;
  final Key? key;

  const ButtonConfirm(
      {required this.text,
      this.textsize,
      this.onTap,
      this.width,
      this.height,
      this.key,
      this.color,
      this.borderRadius,
      this.verticalMargin,
      this.padding,
      this.fontWeight});

  @override
  _ButtonConfirmState createState() => _ButtonConfirmState();
}

class _ButtonConfirmState extends State<ButtonConfirm> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width ?? MediaQuery.of(context).size.width,
      height: widget.height,
      padding: EdgeInsets.all(widget.padding ?? 2),
      decoration: BoxDecoration(
        // border: Border.all(
        //     color: widget.onTap != null ? VccPrimary : VccDarkGray, width: 1.8),
        borderRadius: BorderRadius.circular(widget.borderRadius ?? 12),
        color: widget.color ?? appBtnBlue,
        // gradient: LinearGradient(
        //   begin: Alignment.topCenter,
        //   end: Alignment.bottomCenter,
        //   colors: widget.onTap != null
        //       ? [
        //           (widget.colour ?? VccButtonPurple),
        //           (widget.colour ?? VccButtonPurple),
        //         ]
        //       : [
        //           VccButtonLightGrey,
        //           VccButtonGrey,
        //         ],
        // ),
      ),
      child: TextButton(
        onPressed: widget.onTap,
        style: TextButton.styleFrom(
          // backgroundColor: widget.onTap != null ? VccPrimary : VccUnselect,
          shape: RoundedRectangleBorder(
              // side: BorderSide(
              //     color: widget.onTap != null ? VccPrimary : VccDarkGray,
              //     width: 1.8),
              borderRadius: BorderRadius.circular(widget.borderRadius ?? 4)),
        ),
        child: Container(
          margin: EdgeInsets.symmetric(vertical: widget.verticalMargin ?? 2),
          child: FittedBox(
            child: Text(
              widget.text,
              style: TextStyle(
                  fontWeight: widget.fontWeight ?? FontWeight.w500,
                  color: appBgWhite,
                  fontSize: widget.textsize ?? 14.sp,
                  overflow: TextOverflow.fade),
              maxLines: 1,
            ),
          ),
        ),
      ),
    );
  }
}

class MyAppBar extends StatefulWidget {
  const MyAppBar({super.key});

  @override
  State<MyAppBar> createState() => _MyAppBarState();
}

class _MyAppBarState extends State<MyAppBar> {
  @override
  Widget build(BuildContext context) {
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
}

class AppNavigationDrawer extends StatefulWidget {
  const AppNavigationDrawer({super.key});

  @override
  State<AppNavigationDrawer> createState() => _AppNavigationDrawerState();
}

class _AppNavigationDrawerState extends State<AppNavigationDrawer> {
  ScrollController ctrl = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: appBgWhite,
        child: ListView(
          controller: ctrl,
          padding: EdgeInsets.zero,
          children: [
            // DrawerHeader(
            //   child: Text('HRIS Mobile'),
            // ),
            SizedBox(height: 56.h),
            Theme(
              data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
              child: ExpansionTile(
                collapsedBackgroundColor: appBgWhite,
                leading: SizedBox(
                  height: 16.w,
                  width: 16.w,
                  child: SvgPicture.asset(
                    'assets/icons/home.svg',
                    fit: BoxFit.cover,
                  ),
                ),
                trailing: SizedBox(
                  width: 10.w,
                  height: 8.w,
                  child: SvgPicture.asset(
                    'assets/icons/chevron-down.svg',
                    fit: BoxFit.scaleDown,
                  ),
                ),
                title: Text(
                  'Home',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                children: [
                  ListTile(
                    tileColor: appBgWhite,
                    leading: const SizedBox(),
                    title: Text(
                      'Dashboard',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      context.router.push(const HomeRoute());
                    },
                  ),
                  ListTile(
                    tileColor: appBgWhite,
                    leading: const SizedBox(),
                    title: Text(
                      'Claim',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    onTap: () {},
                  ),
                  ListTile(
                    tileColor: appBgWhite,
                    leading: const SizedBox(),
                    title: Text(
                      'Absensi',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      context.router.push(const AbsentRoute());
                    },
                  ),
                  ListTile(
                    tileColor: appBgWhite,
                    leading: const SizedBox(),
                    title: Text(
                      'Cuti',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    onTap: () {},
                  ),
                  ListTile(
                    tileColor: appBgWhite,
                    leading: const SizedBox(),
                    title: Text(
                      'PJD',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    onTap: () {},
                  ),
                  ListTile(
                    tileColor: appBgWhite,
                    leading: const SizedBox(),
                    title: Text(
                      'Kalender',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    onTap: () {},
                  ),
                ],
              ),
            ),
      
            ListTile(
              tileColor: appBgWhite,
              leading: SizedBox(
                height: 16.w,
                width: 16.w,
                child: SvgPicture.asset(
                  'assets/icons/briefcase.svg',
                  fit: BoxFit.fill,
                ),
              ),
              // trailing: SizedBox(
              //   width: 10.w,
              //   height: 8.w,
              //   child: SvgPicture.asset(
              //     'assets/icons/chevron-down.svg',
              //     fit: BoxFit.scaleDown,
              //   ),
              // ),
              title: Text(
                'Activity',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              onTap: () {},
            ),
            ListTile(
              tileColor: appBgWhite,
              leading: SizedBox(
                height: 16.w,
                width: 16.w,
                child: SvgPicture.asset(
                  'assets/icons/notification.svg',
                  fit: BoxFit.fill,
                ),
              ),
              title: Text(
                'Notification',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              onTap: () {},
            ),
            ListTile(
              tileColor: appBgWhite,
              leading: SizedBox(
                height: 16.w,
                width: 16.w,
                child: SvgPicture.asset(
                  'assets/icons/profile.svg',
                  fit: BoxFit.fill,
                ),
              ),
              title: Text(
                'Profile',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              onTap: () {
                Navigator.pop(context);
                context.router.push(const ProfileRoute());
              },
            ),
            ListTile(
              tileColor: appBgWhite,
              leading: Icon(Icons.logout, size: 18.w, color: Colors.black),
              title: Text(
                'Logout',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              onTap: () {
                Navigator.pop(context);
                context.router.replace(const LoginRoute());
              },
            ),
          ],
        ),
      ),
    );
  }
}

class CommonMonthPicker extends StatefulWidget {
  final String? msg, title, buttonText, status;
  final double? buttonOkWidth;
  final Function(DateTime) onConfirm;
  const CommonMonthPicker({
    required this.onConfirm,
    this.buttonText,
    this.title,
    this.msg,
    this.status,
    this.buttonOkWidth,
    Key? key,
  }) : super(key: key);

  @override
  State<CommonMonthPicker> createState() => _CommonMonthPickerState();
}

class _CommonMonthPickerState extends State<CommonMonthPicker> {
  List<MonthModel> list = [];
  bool showConfirm = false;
  String title = "";
  late int? selectedMonth;
  ScrollController ctrl = ScrollController();

  onSelectedMonth(MonthModel mod) {
    if (!yearPick) {
      for (var e in list) {
        if (mod.name == e.name && e.isSelected == false) {
          e.isSelected = true;
          showConfirm = true;
          selectedMonth = mod.index;
          // log(selectedMonth.toString());
        } else if (mod.name == e.name && e.isSelected == true) {
          e.isSelected = false;
          showConfirm = false;
          selectedMonth = null;
        } else {
          e.isSelected = false;
          selectedMonth = null;
        }
      }
    }

    if (yearPick) {
      yearPick = !yearPick;
      if (mod.name != null) {
        title = mod.name!;
      }
      list.clear();
      onGenerateListMonth(reset);
    }
    setState(() {});
  }

  onGenerateListMonth(DateTime time) {
    for (int i = 1; i <= 12; i++) {
      list.add(MonthModel(
          i,
          DateFormat('MMMM')
              .format(DateTime(time.year, i, time.day))
              .toString(),
          false));
    }
  }

  DateTime reset = DateTime(1900, 0, 1);
  bool yearPick = false;

  DateTime date = DateTime.now();

  onChgDisplay() {
    yearPick = !yearPick;
    showConfirm = false;
    list.clear();
    for (int i = 0; i <= 12; i++) {
      list.add(MonthModel((date.year - i), (date.year - i).toString(), false));
    }
    setState(() {});
  }

  @override
  void initState() {
    selectedMonth = 0;
    onGenerateListMonth(reset);
    title = DateFormat('yyyy').format(date).toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.symmetric(
        vertical: 0.20.sh,
        horizontal: 0.05.sw,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: appBgWhite,
          borderRadius: BorderRadius.circular(12),
        ),
        // width: context.deviceWidth() * 0.4,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 8.h,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8, left: 32, right: 32),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // TextFormField(),
                  Visibility(
                    visible: !yearPick,
                    replacement: Text(
                      "Pilih tahun",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16.sp,
                      ),
                    ),
                    child: GestureDetector(
                      onTap: () => onChgDisplay(),
                      child: Text(
                        title,
                        style: TextStyle(
                          fontSize: 16.sp,
                        ),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: !yearPick,
                    replacement: const SizedBox(),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            date = DateTime(date.year - 1);
                            setState(() {});
                          },
                          child: HeroIcon(
                            HeroIcons.chevronLeft,
                            size: 24.sp,
                            color: appDivider,
                          ),
                        ),
                        SizedBox(width: 24.w),
                        GestureDetector(
                          onTap: () {
                            date = DateTime(date.year + 1);
                            setState(() {});
                          },
                          child: HeroIcon(
                            HeroIcons.chevronRight,
                            size: 24.sp,
                            color: appDivider,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 4.h,
            ),
            Visibility(
              visible: widget.title != null,
              child: Text(
                widget.title ?? "",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: appDivider.withOpacity(0.7),
                  fontSize: 16.sp,
                ),
              ),
            ),
            // Container(
            //   padding: EdgeInsets.all(3),
            //   decoration: BoxDecoration(
            //     shape: BoxShape.circle,
            //     color: VccSuccess,
            //   ),
            //   child: Icon(
            //     Icons.check,
            //     size: context.scaleFont(50),
            //     color: VccWhite,
            //   ),
            // ),
            SizedBox(
              height: 8.h,
            ),
            Expanded(
              child: NotificationListener<OverscrollIndicatorNotification>(
                onNotification: (OverscrollIndicatorNotification overScrl) {
                  overScrl.disallowIndicator();
                  return false;
                },
                child: GridView.builder(
                  controller: ctrl,
                  // dragStartBehavior: widget.dragStartBehavior,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 8.w,
                    mainAxisSpacing: 24.h,
                    mainAxisExtent: 42.h,
                  ),
                  itemBuilder: (context, index) {
                    var item = list[index];
                    return GestureDetector(
                      onTap: () => onSelectedMonth(item),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: item.isSelected == true
                                  ? appBtnBlue
                                  : appBgTransparent),
                          color: appBgWhite,
                          borderRadius: BorderRadius.circular(24),
                        ),
                        width: 48.w,
                        height: 12.h,
                        child: Center(
                          child: Semantics(
                            // selected: isSelected,
                            button: true,
                            child: Text(
                              item.name!,
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: list.length,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                ),
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 32),
              child: Visibility(
                visible: showConfirm,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        context.router.pop();
                      },
                      child: Text(
                        "Cancel",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: appBtnBlue,
                          fontSize: 14.sp,
                        ),
                      ),
                    ),
                    SizedBox(width: 24.w),
                    GestureDetector(
                      onTap: () {
                        for (var e in list) {
                          if (e.isSelected == true) {
                            selectedMonth = e.index;
                          }
                        }
                        if (selectedMonth != null) {
                          widget.onConfirm(
                              DateTime(int.parse(title), selectedMonth!, 1));
                        }
                      },
                      child: Text(
                        "Confirm",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: appBtnBlue,
                          fontSize: 14.sp,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
          ],
        ),
      ),
    );
  }
}

class CommonYearDatePicker extends StatefulWidget {
  final String? selectedDt, hintText;
  final Function(DateTime) onChange;
  final Icon? prefix;
  const CommonYearDatePicker({
    this.selectedDt,
    required this.onChange,
    this.hintText,
    this.prefix,
    super.key,
  });

  @override
  State<CommonYearDatePicker> createState() => _CommonYearDatePickerState();
}

class _CommonYearDatePickerState extends State<CommonYearDatePicker> {
  DateTime dateTime = DateTime.now();

  @override
  void didUpdateWidget(covariant CommonYearDatePicker oldWidget) {
    super.didUpdateWidget(oldWidget);
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return CommonMonthPicker(
              onConfirm: (v) {
                context.router.pop();
                // log(v.toString());
                widget.onChange(v);
              },
            );
          },
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
        height: 52,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: appDivider, width: 1.5),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                widget.prefix != null ? widget.prefix! : const SizedBox(),
                widget.prefix != null
                    ? const SizedBox(width: 12)
                    : const SizedBox(),
                Text(
                  (widget.selectedDt != null)
                      ? widget.selectedDt!
                      : (widget.hintText != null)
                          ? widget.hintText!
                          : "",
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: (widget.hintText != null) ? appDivider : appBgBlack,
                  ),
                ),
              ],
            ),
            HeroIcon(
              HeroIcons.chevronDown,
              size: 18.sp,
              color: appDivider,
            ),
          ],
        ),
      ),
    );
  }
}

failSnackBar({String? message}) {
  return SnackBar(
    duration: const Duration(seconds: 5),
    behavior: SnackBarBehavior.fixed,
    content: SelectableText(
      message ?? 'Failed, with no message!',
      style: const TextStyle(color: appBgWhite, fontSize: 16),
    ),
    backgroundColor: appSnackbarBgError,
  );
}


class CommonShimmer extends StatelessWidget {
  final Widget? child;
  final bool? isLoading;
  const CommonShimmer({
    Key? key,
    required this.child,
    required this.isLoading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 700),
      child: (isLoading!)
          ? Shimmer.fromColors(
              key: const ValueKey('1'),
              period: const Duration(milliseconds: 900),
              baseColor: Colors.grey.shade300.withOpacity(0.8),
              highlightColor: Colors.grey.shade100,
              child: child!,
            )
          : child!,
    );
  }
}
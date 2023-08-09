import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:owl_hris/config/routes/app.routes.dart';

import '../../config/themes/colors.dart';

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
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: appBgWhite,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          // DrawerHeader(
          //   child: Text('HRIS Mobile'),
          // ),
          SizedBox(height: 56.h),
          ExpansionTile(
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
            trailing: SizedBox(
              width: 10.w,
              height: 8.w,
              child: SvgPicture.asset(
                'assets/icons/chevron-down.svg',
                fit: BoxFit.scaleDown,
              ),
            ),
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
    );
  }
}

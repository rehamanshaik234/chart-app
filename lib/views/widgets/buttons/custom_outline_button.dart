import 'dart:ui';

import 'package:blyk_leave_management/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class CustomOutlineButton extends StatelessWidget {
   CustomOutlineButton({super.key,required this.onPressed,required this.child,required this.padding});
  VoidCallback onPressed;
  Widget child;
  EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20.h,
      child: OutlinedButton(
          onPressed: onPressed,
          style: ButtonStyle(
            padding: WidgetStatePropertyAll<EdgeInsets>(padding),
            backgroundColor: const WidgetStatePropertyAll<Color>(Colors.transparent),
            side: const WidgetStatePropertyAll<BorderSide>(BorderSide(color: AppColors.primaryColor)),
            shape: WidgetStatePropertyAll<RoundedRectangleBorder>(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.sp),
            ))
          ),
          child: child),
    );
  }
}

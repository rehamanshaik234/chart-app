import 'package:blyk_leave_management/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
          height: 30.h,
          width: 30.w,
          child: CircularProgressIndicator(color: AppColors.primaryColor,strokeWidth: 2.sp,)),
    );
  }
}

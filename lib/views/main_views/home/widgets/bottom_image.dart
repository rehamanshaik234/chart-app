import 'package:blyk_leave_management/utils/app_colors.dart';
import 'package:blyk_leave_management/utils/constants/assets_url.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomImage extends StatelessWidget {
  const BottomImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('“Ride the waves of work and leisure, and surf your way to blissful balance”',style: Theme.of(context).textTheme.headlineLarge?.copyWith(color: AppColors.primaryColor,fontSize: 16.sp),textAlign: TextAlign.center,),
        SizedBox(
          child: Image.asset(AssetsUrl.homeBottomImage),
        )
      ],
    );
  }
}

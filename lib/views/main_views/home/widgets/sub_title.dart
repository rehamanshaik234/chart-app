
import 'package:blyk_leave_management/utils/constants/constants.dart';
import 'package:blyk_leave_management/views/widgets/transitions/navigation_transitons.dart';
import 'package:blyk_leave_management/views/widgets/transitions/widget_transition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/app_colors.dart';
import '../../../widgets/buttons/custom_outline_button.dart';
class SubTitle extends StatelessWidget {
  SubTitle({super.key,required this.title,required this.buttonTitle,this.onPressed,this.showButton=true,this.textStyle});
  final String title;
  final String buttonTitle;
  VoidCallback? onPressed;
  final bool showButton;
  TextStyle? textStyle;
  @override
  Widget build(BuildContext context) {
    return TransitionWidget(
      transitionType: TransitionType.fade,
      duration: Constants.fastDuration,
      child: Row(
        mainAxisAlignment:showButton? MainAxisAlignment.spaceBetween:MainAxisAlignment.start,
        children: [
          Text(title,style:textStyle ??  Theme.of(context).textTheme.headlineLarge?.copyWith(fontSize: 16.sp),),
          Visibility(
            visible: showButton,
            child: CustomOutlineButton(onPressed: (){},
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Row(
                  children: [
                    Text(buttonTitle,style:Theme.of(context).textTheme.headlineMedium?.copyWith(color: AppColors.primaryColor,fontSize: 12.sp),),
                    Icon(Icons.arrow_forward,color: AppColors.primaryColor,size: 12.sp,)
                  ],
                )),
          )
        ],
      ),
    );
  }
}

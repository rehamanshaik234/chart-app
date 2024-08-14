import 'package:blyk_leave_management/utils/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
class CustomPopUps {
  static void showCustomPopUp(BuildContext context,String title,Color titleColor,String content,){
    showCupertinoDialog(context: context,
        builder: (context)=> CupertinoAlertDialog(
          title:title.isNotEmpty? Text(title,style: Theme.of(context).textTheme.headlineLarge?.copyWith(color:titleColor),):null,
          content: Text(content,style: Theme.of(context).textTheme.headlineMedium,),
          actions: [
            TextButton(onPressed: (){
              Navigator.of(context).pop();
            }, child: Text("Ok",style: Theme.of(context).textTheme.headlineMedium,))
          ],
        ));
  }

  static void showSnackBar(BuildContext context,String title,Color titleColor, Color bgColor,){
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            duration:const Duration(seconds: 2),
            content: Text(title,style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: titleColor),),
            backgroundColor: bgColor,
        ));
  }

  static void showLoadingPopUp(BuildContext context,String title,Color titleColor){
    showCupertinoDialog(context: context,
        builder: (context) => CupertinoAlertDialog(
          title: Text(title,style: Theme.of(context).textTheme.headlineLarge?.copyWith(color:titleColor),),
          content: Column(
            children: [
              SizedBox(height: 8.h,),
              SizedBox(
                height: 20.h,
                width: 20.h,
                child: CircularProgressIndicator(color: AppColors.primaryColor,strokeWidth: 2.sp,),
              ),
              SizedBox(height: 8.h,),
              Text("Please Wait",style: Theme.of(context).textTheme.headlineMedium,),
            ],
          ),
        ));
  }

  static void showLottiePopUp(BuildContext context,String lottiePath,Color titleColor){
    showCupertinoDialog(context: context,
        builder: (context) => CupertinoAlertDialog(
          title: SizedBox(
            height: 100.h,
            width: 100.h,
            child: Lottie.asset(lottiePath),
          ),
          content: Column(
            children: [
              SizedBox(height: 8.h,),
              Text("Please Wait..",style: Theme.of(context).textTheme.headlineMedium,),
            ],
          ),
        ));
  }
}
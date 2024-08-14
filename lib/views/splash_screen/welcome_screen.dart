
import 'package:blyk_leave_management/controller/storage/session.dart';
import 'package:blyk_leave_management/utils/app_colors.dart';
import 'package:blyk_leave_management/views/authentication/login_screen.dart';
import 'package:blyk_leave_management/views/widgets/combined_transitions/fade_scale_transition.dart';
import 'package:blyk_leave_management/views/widgets/buttons/custom_button.dart';
import 'package:blyk_leave_management/views/widgets/logo_with_bg.dart';
import 'package:blyk_leave_management/views/widgets/transitions/navigation_transitons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../main_views/navigator.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  bool loader=true;
  LoginSession session=LoginSession();
  @override
  void initState() {
    checkUserLogin();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:loader? SingleChildScrollView(
        child: Column(
          children: [
            const LogoWithBg(canAnimate: true,),
            SizedBox(height: 60.h,),
            FadeScaleTransition(
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.secondaryColor,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow:[
                            BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 1,
                            offset: const Offset(0, 2),),],),
                  margin: const EdgeInsets.symmetric(horizontal:40),
                  padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 12),
                  child: Text("Hey, you're back!\nTime to plan some quality time off!",
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: Colors.black.withOpacity(0.8),fontSize: 16.sp,),textAlign: TextAlign.center,),
            )),
            SizedBox(height: 60.h,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:40),
              child: FadeScaleTransition(child: CustomButton(
                onPressed: (){
                  Navigator.push(context, CustomRoute.createRoute(page: const LoginScreen(),
                      transitionType: TransitionType.slide,curve: Curves.ease,applyAnimation: false));
                },
                title: "Let's go!",
              )),
            )
          ],
        ),
      ):Center(
        child: CircularProgressIndicator(
          color: AppColors.primaryColor,
          strokeWidth: 2.sp,
        ),
      ),
    );
  }

  void checkUserLogin()async{
    final result=await session.isUserLoggedIn();
    if(result){
      Navigator.pushAndRemoveUntil(
          context,
          CustomRoute.createRoute(page: const NavigatorScreen(), transitionType: TransitionType.fade,
              applyAnimation: true,curve: Curves.ease),
              (route)=>false
      );
    }else{
      loader=false;
      setState(() {

      });
    }
  }
}

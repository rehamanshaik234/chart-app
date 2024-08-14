import 'package:blyk_leave_management/utils/app_colors.dart';
import 'package:blyk_leave_management/utils/constants/assets_url.dart';
import 'package:blyk_leave_management/views/splash_screen/welcome_screen.dart';
import 'package:blyk_leave_management/views/widgets/logo.dart';
import 'package:blyk_leave_management/views/widgets/transitions/navigation_transitons.dart';
import 'package:blyk_leave_management/views/widgets/transitions/widget_transition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    goToLogin();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(
          child: TransitionWidget(
              transitionType: TransitionType.fade,
              child: Logo(radius: 100)),
        ),
    );
  }

  void goToLogin()async{
    await Future.delayed(const Duration(seconds: 3),(){
      Navigator.pushReplacement(
        context,
        CustomRoute.createRoute(page: const WelcomeScreen(), transitionType: TransitionType.fade,applyAnimation: true,curve: Curves.ease),
      );
    });
  }
}

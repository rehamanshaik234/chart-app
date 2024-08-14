import 'package:blyk_leave_management/controller/repo/auth.dart';
import 'package:blyk_leave_management/controller/storage/session.dart';
import 'package:blyk_leave_management/models/User.dart';
import 'package:blyk_leave_management/utils/app_colors.dart';
import 'package:blyk_leave_management/utils/constants/constants.dart';
import 'package:blyk_leave_management/views/authentication/face_login.dart';
import 'package:blyk_leave_management/views/widgets/buttons/custom_button.dart';
import 'package:blyk_leave_management/views/widgets/buttons/custom_outline_textF.dart';
import 'package:blyk_leave_management/views/widgets/combined_transitions/fade_rtl_transition.dart';
import 'package:blyk_leave_management/views/widgets/combined_transitions/fade_scale_transition.dart';
import 'package:blyk_leave_management/views/widgets/logo_with_bg.dart';
import 'package:blyk_leave_management/views/widgets/popups/custom_pop_ups.dart';
import 'package:blyk_leave_management/views/widgets/transitions/navigation_transitons.dart';
import 'package:blyk_leave_management/views/widgets/transitions/widget_transition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../main_views/navigator.dart';
import '../widgets/combined_transitions/fade_ltr_transition.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController email=TextEditingController();
  TextEditingController password=TextEditingController();
  GlobalKey<FormState> key=GlobalKey<FormState>();
  AuthRepo authRepo=AuthRepo();
  bool loader=false;
  LoginSession session=LoginSession();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Focus(
            child: Form(
              key: key,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                   const LogoWithBg(canAnimate: false,applyLTRAnimation: true,),
                  SizedBox(height: 30.h,),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.0.w),
                    child: FadeLTRTransition(
                      duration: Constants.fastDuration,
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Welcome",style: Theme.of(context).textTheme.headlineLarge,),
                        SizedBox(
                          child: InkWell(
                            onTap: faceLogin,
                            child: Row(
                              children: [
                                Icon(Icons.face,color: AppColors.primaryColor,size: 20.sp,),
                                SizedBox(width: 4.w,),
                                Text("Face Sign",style: Theme.of(context).textTheme.headlineMedium?.copyWith(decoration:TextDecoration.underline,color: AppColors.primaryColor,
                                    decorationColor: AppColors.primaryColor),),
                              ],
                            ),
                          ),
                        )
                      ],
                    )),
                  ),
                  SizedBox(height: 16.h,),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.0.w),
                    child: FadeLTRTransition(
                      duration: Constants.fastDuration,
                        child: OutlineTextField(
                        controller: email,
                        icon: Icons.person_outline,hintText: "Email",)),
                  ),
                  SizedBox(height: 16.h,),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.0.w),
                    child: FadeLTRTransition(
                      duration: Constants.fastDuration,
                        child: OutlineTextField(
                      controller: password,
                      icon: Icons.lock_open,
                      hintText: "Password",isPassword:true,onDone:(){validateFields(context);},)),
                  ),
                  SizedBox(height: 30.h,),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.w),
                    child: FadeLTRTransition(
                      duration: Constants.fastDuration,
                        child: CustomButton(
                          loader: loader,
                          onPressed: ()=>validateFields(context),title: 'Sign In',)),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  faceLogin() {
    showModalBottomSheet(context: context, builder: (context)=>SizedBox(height: 0.8.sh, child: FaceLogin()),isScrollControlled: true);
  }

  void validateFields(BuildContext context){
    if(email.text.isNotEmpty && password.text.isNotEmpty){
      login();
    }else if(email.text.isEmpty){
      CustomPopUps.showSnackBar(context,"Please Enter Email",Colors.white,Colors.redAccent);
    }else if(password.text.isEmpty){
      CustomPopUps.showSnackBar(context,"Please Enter Password",Colors.white,Colors.redAccent);
    }
  }

  Future<void> login()async{
    loader=true;
    setState(() {});
    UserModel? user= await authRepo.loginWithIdPassword(email.text, password.text);
    if(user!=null){
      final result= await session.storeUserInfo(user);
      if(result) {
        setState(() {
          loader=false;
        });
        navigate();
      }
    }else{
      setState(() {
        loader=false;
      });
      CustomPopUps.showCustomPopUp(context, "Login Error", Colors.redAccent, "Invalid Credentials");
    }
  }

  void navigate() {
    Navigator.pushAndRemoveUntil(
      context,
      CustomRoute.createRoute(page: const NavigatorScreen(), transitionType: TransitionType.fade,
          applyAnimation: true,curve: Curves.ease),
        (route)=>false
    );
  }
}

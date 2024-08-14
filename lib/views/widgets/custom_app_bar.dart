import 'package:blyk_leave_management/controller/storage/session.dart';
import 'package:blyk_leave_management/models/User.dart';
import 'package:blyk_leave_management/views/authentication/login_screen.dart';
import 'package:blyk_leave_management/views/splash_screen/welcome_screen.dart';
import 'package:blyk_leave_management/views/widgets/transitions/navigation_transitons.dart';
import 'package:blyk_leave_management/views/widgets/transitions/widget_transition.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/app_colors.dart';
import '../../utils/constants/assets_url.dart';
import '../../utils/constants/constants.dart';
import 'logo.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({super.key, required this.homeScreen,required this.title});
  final bool homeScreen;
  final String title;
  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {

  bool animate=false;
  UserModel? userModel;
  @override
  void initState() {
    super.initState();
    getUserData();
    // Initial setup
    _startAnimation();
  }
  @override
  void didUpdateWidget(CustomAppBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Check if homeScreen changed
    if (widget.homeScreen != oldWidget.homeScreen) {
      _startAnimation();
    }
  }

  void _startAnimation() {
    // Reset animation states
    setState(() {
      animate = false;
    });

    // Trigger a new animation after the frame has been drawn
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        animate = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedContainer(
          height: animate? widget.homeScreen? 1.sh*0.35 : 1.sh*0.07:0,
          width: 1.sw,
          padding: EdgeInsets.only(bottom:widget.homeScreen? 24.h:0.h,top: 0.h,right: 16.w),
          decoration:  BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius:widget.homeScreen? const BorderRadius.only(bottomLeft: Radius.circular(40),
                  bottomRight:Radius.circular(40) ):BorderRadius.zero
          ), duration: Constants.fastDuration,
          child:animate? SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TransitionWidget(
                  transitionType: TransitionType.fade,
                  duration: Constants.fastDuration,
                  child: AppBar(
                    backgroundColor: Colors.transparent,
                    leading: Transform.scale(
                        scale:0.5,
                        child: Logo(radius: 20.sp,)),
                    centerTitle: true,
                    title: Text(widget.title,style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                          color: Colors.white,
                        ),),
                    actions: [
                      InkWell(onTap: (){

                      }, child: Icon(Icons.notifications_outlined,color: Colors.white,size: 24.sp,),),
                      SizedBox(width: 8.w,),
                      InkWell(onTap: ()async{

                      }, child: Icon(Icons.settings_outlined,color: Colors.white,size: 24.sp,),),
                    ],
                  ),
                ),
                Visibility(
                  visible: widget.homeScreen,
                  child: Container(
                    margin: EdgeInsets.only(top: 1.sh*0.055),
                    child: TransitionWidget(
                      transitionType: TransitionType.slide,
                      textDirection: TextDirection.ltr,
                      duration: Constants.fastDuration,
                      child: CircleAvatar(
                        radius: 40.sp,
                        backgroundColor: Colors.white,
                        child: Transform.scale(
                          scale: 2,
                            child: Image.asset(AssetsUrl.profile1,fit: BoxFit.fill,)),
                      ),
                    ),
                  ),
                ),
                Visibility(
                  visible: widget.homeScreen,
                  child: Container(
                    margin: EdgeInsets.only(top: 1.sh*0.055),
                    child: TransitionWidget(
                      transitionType: TransitionType.slide,
                      textDirection: TextDirection.ltr,
                      duration: Constants.fastDuration,
                      child: SizedBox(
                        child: Column(
                          children: [
                            Text('Welcome back,',style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                                color: Colors.white
                            ),),
                            Text(userModel?.fullName ?? "No Name",style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                                color: Colors.white,
                              fontSize: 20.sp
                            ),),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ): null,
        ),
        Positioned(
            top:widget.homeScreen?50:0,
            left: 0,
            child: Image.asset(AssetsUrl.bg_3,fit: BoxFit.fitWidth,)),
        Visibility(
          visible: widget.homeScreen,
          child: Positioned(
              bottom: -110,
              left: -10,
              child: Image.asset(AssetsUrl.bg_1,fit: BoxFit.fitWidth,)),
        ),
        Visibility(
          visible: widget.homeScreen,
          child: Positioned(
              bottom: -140,
              left: 0,
              child: Image.asset(AssetsUrl.bg_2,fit: BoxFit.fitWidth,)),
        ),
      ],
    );
  }

  void getUserData()async{
    userModel=await LoginSession().getUserInfo();
    setState(() {

    });
  }
}

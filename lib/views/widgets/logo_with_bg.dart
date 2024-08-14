import 'package:blyk_leave_management/utils/app_colors.dart';
import 'package:blyk_leave_management/utils/constants/assets_url.dart';
import 'package:blyk_leave_management/utils/constants/constants.dart';
import 'package:blyk_leave_management/views/widgets/combined_transitions/fade_ltr_transition.dart';
import 'package:blyk_leave_management/views/widgets/logo.dart';
import 'package:flutter/material.dart';
class LogoWithBg extends StatefulWidget {
  const LogoWithBg({super.key, this.canAnimate=false, this.applyLTRAnimation=false});
  final bool canAnimate;
  final bool applyLTRAnimation;

  @override
  State<LogoWithBg> createState() => _LogoWithBgState();
}

class _LogoWithBgState extends State<LogoWithBg> {
  bool animate=false;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_){
      setState(() {
        animate=true;
      });
    });
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return SizedBox(
      height: size.height*0.5+80+6,
      width: size.width,
      child: Stack(
        children: [
          FadeLTRTransition(
            applyAnimation: widget.applyLTRAnimation,
            duration: Constants.fastDuration,
            child: AnimatedContainer(
              height:widget.canAnimate? animate? size.height*0.5:0:size.height*0.5,
                width: size.width,
                decoration: const BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(40),
                      bottomRight:Radius.circular(40) )
                ), duration: Constants.animationDuration,
              ),
          ),
          Positioned(
              top: 80,
              left: 0,
              child: Image.asset(AssetsUrl.bg_3,fit: BoxFit.fitWidth,)),
          Positioned(
              bottom: 50,
              left: -33,
              child: Image.asset(AssetsUrl.bg_1,fit: BoxFit.fitWidth,)),
          Positioned(
              bottom: 50,
              left: 0,
              child: Image.asset(AssetsUrl.bg_2,fit: BoxFit.fitWidth,)),
          Positioned(
              bottom: 6,
              right: size.width*0.5-80,
              child: Logo(
                radius: 80,
                shadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 3,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],)
          )
        ],
      ),
    );
  }
}

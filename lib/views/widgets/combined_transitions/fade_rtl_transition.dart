import 'package:blyk_leave_management/utils/constants/constants.dart';
import 'package:blyk_leave_management/views/widgets/transitions/navigation_transitons.dart';
import 'package:blyk_leave_management/views/widgets/transitions/widget_transition.dart';
import 'package:flutter/material.dart';
class FadeRTLTransition extends StatelessWidget {
  final Widget child;
  final bool applyAnimation;
  final Duration duration;
  const FadeRTLTransition({super.key, required this.child,this.duration=Constants.animationDuration,this.applyAnimation=true});

  @override
  Widget build(BuildContext context) {
    return applyAnimation? TransitionWidget(
      duration: duration,
        transitionType: TransitionType.fade,
        child: TransitionWidget(
          duration: duration,
            transitionType: TransitionType.slide,
            textDirection: TextDirection.rtl,
            child: child)):child;
  }
}

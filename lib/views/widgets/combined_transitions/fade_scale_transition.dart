import 'package:blyk_leave_management/utils/constants/constants.dart';
import 'package:blyk_leave_management/views/widgets/transitions/navigation_transitons.dart';
import 'package:blyk_leave_management/views/widgets/transitions/widget_transition.dart';
import 'package:flutter/material.dart';
class FadeScaleTransition extends StatelessWidget {
  final Widget child;
  final Duration duration;
  final bool applyAnimation;
  const FadeScaleTransition({super.key, required this.child,this.duration =Constants.animationDuration,this.applyAnimation=true});

  @override
  Widget build(BuildContext context) {
    return applyAnimation? TransitionWidget(
        transitionType: TransitionType.fade,
        duration: duration,
        child: TransitionWidget(
          duration:duration,
          transitionType: TransitionType.scale,
            child: child)):child;
  }
}

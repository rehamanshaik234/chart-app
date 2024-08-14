import 'package:blyk_leave_management/utils/constants/constants.dart';
import 'package:blyk_leave_management/views/widgets/transitions/navigation_transitons.dart';
import 'package:blyk_leave_management/views/widgets/transitions/widget_transition.dart';
import 'package:flutter/material.dart';
class FadeLTRTransition extends StatelessWidget {
  final Widget child;
  final Duration duration;
  final bool applyAnimation;

  const FadeLTRTransition({super.key, required this.child,this.duration=Constants.animationDuration,this.applyAnimation=true});

  @override
  Widget build(BuildContext context) {
    return applyAnimation? TransitionWidget(
        transitionType: TransitionType.fade,
        duration: duration,
        child: TransitionWidget(
            transitionType: TransitionType.slide,
            textDirection: TextDirection.ltr,
            duration: duration,
            child: child)):child;
  }
}

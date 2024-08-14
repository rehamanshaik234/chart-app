import 'package:blyk_leave_management/utils/constants/constants.dart';
import 'package:flutter/material.dart';
enum TransitionType {
  fade,
  slide,
  scale,
  rotate,
}

class CustomRoute {
  static PageRoute createRoute({
    required Widget page,
    required TransitionType transitionType,
    Curve curve=Curves.ease,
    bool applyAnimation=false,
    RouteSettings? settings
  }) {
    return applyAnimation? PageRouteBuilder(
      transitionDuration: Constants.animationDuration,
      settings: settings,
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        CurvedAnimation curvedAnimation=CurvedAnimation(parent: animation, curve:curve);
        switch (transitionType) {
          case TransitionType.fade:
            return FadeTransition(
              opacity: curvedAnimation,
              child: child,
            );
          case TransitionType.slide:
            return SlideTransition(
              textDirection: TextDirection.ltr,
              position: Tween<Offset>(
                begin: const Offset(1.0, 0.0),
                end: Offset.zero,
              ).animate(curvedAnimation),
              child: child,
            );
          case TransitionType.scale:
            return ScaleTransition(
              scale: Tween<double>(
                begin: 0.0,
                end: 1.0,
              ).animate(curvedAnimation),
              child: child,
            );
          case TransitionType.rotate:
            return RotationTransition(
              turns: Tween<double>(
                begin: 0.0,
                end: 1.0,
              ).animate(curvedAnimation),
              child: child,
            );
          default:
            return child;
        }
      },
    ): MaterialPageRoute(builder: (context)=>page);
  }
}

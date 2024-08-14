import 'package:blyk_leave_management/utils/constants/constants.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

import 'navigation_transitons.dart';

class TransitionWidget extends StatefulWidget {
  final Widget child;
  final TransitionType transitionType;
  final Curve curve;
  final TextDirection textDirection;
  final Duration duration;

   const TransitionWidget({
    super.key,
    required this.child,
    required this.transitionType,
    this.curve=Curves.easeIn,
     this.textDirection=TextDirection.rtl,
     this.duration= Constants.animationDuration
  });

  @override
  _TransitionWidgetState createState() => _TransitionWidgetState();
}

class _TransitionWidgetState extends State<TransitionWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  late Animation<Offset> _offsetAnimation;
  late CurvedAnimation curvedAnimation;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_){
      setState(() {
        _controller.forward();
      });
    });
    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    );
    curvedAnimation=CurvedAnimation(parent: _controller, curve: widget.curve);

    switch (widget.transitionType) {
      case TransitionType.fade:
        _animation = Tween<double>(begin: 0.0, end: 1.0).animate(curvedAnimation);
        break;
      case TransitionType.slide:
        _offsetAnimation = Tween<Offset>(begin: const Offset(1.0, 0.0), end: Offset.zero).
        animate(curvedAnimation);
        break;
      case TransitionType.scale:
        _animation = Tween<double>(begin: 0.0, end: 1.0).animate(curvedAnimation);
        break;
      case TransitionType.rotate:
        _animation = Tween<double>(begin: 0.0, end: 1.0).animate(curvedAnimation);
        break;
    }

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        switch (widget.transitionType) {
          case TransitionType.fade:
            return FadeTransition(
              opacity: _animation,
              child: child,
            );
          case TransitionType.slide:
            return SlideTransition(
              position: _offsetAnimation,
              textDirection: widget.textDirection,
              child: child,
            );
          case TransitionType.scale:
            return ScaleTransition(
              scale: _animation,
              filterQuality: FilterQuality.high,
              child: child,
            );
          case TransitionType.rotate:
            return RotationTransition(
              turns: _animation,
              child: child,
            );
          default:
            return child!;
        }
      },
      child: widget.child,
    );
  }
}

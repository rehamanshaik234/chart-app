import 'package:blyk_leave_management/utils/constants/constants.dart';
import 'package:flutter/material.dart';

import '../../utils/constants/assets_url.dart';
class Logo extends StatelessWidget {
  Logo({super.key,required this.radius,this.padding=const EdgeInsets.all(8),this.shadow=const []});
  late double radius;
  late EdgeInsets padding;
  late List<BoxShadow> shadow;

  @override
  Widget build(BuildContext context) {
      return  Hero(
        tag: Constants.heroTagLogo,
        child: Container(
        decoration:  BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: shadow,
        ),
        child: CircleAvatar(
          backgroundColor: Colors.white,
          radius: radius,
          child: Center(
            child: Padding(
              padding: padding,
              child: ClipOval(
                child: Image.asset(
                    AssetsUrl.logo, // Replace with your asset path
                    fit: BoxFit.fitWidth,
                    width: radius*2, // Should match diameter (2 * radius)
                    height: radius*2, // Should match diameter (2 * radius)
                  ),
                ),
            ),
          ),
        ),
            ),
      );
  }
}

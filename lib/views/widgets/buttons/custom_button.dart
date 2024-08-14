import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/app_colors.dart';

class CustomButton extends StatelessWidget {
  final bool loader;
  final VoidCallback onPressed;
  final String title;

  const CustomButton({
    super.key,
    this.loader=false,
    required this.onPressed,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SizedBox(
          width: constraints.maxWidth,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 400),
                width: loader ? 80.w : constraints.maxWidth,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: const WidgetStatePropertyAll<Color>(AppColors.primaryColor),
                    shape: WidgetStatePropertyAll<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  onPressed: onPressed,
                  child: loader
                      ? SizedBox(
                    height: 20.h,
                    width: 20.w,
                    child: CircularProgressIndicator(
                      color: Colors.white,
                      strokeWidth: 3.w,
                    ),
                  )
                      : Text(
                    title,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

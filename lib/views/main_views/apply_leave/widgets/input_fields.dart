import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class InputFields extends StatelessWidget {
   InputFields({super.key,required this.title,required this.child});
  String title;
  Widget child;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: Colors.black.withOpacity(0.7),fontWeight: FontWeight.bold),),
            SizedBox(height: 8.h,),
            SizedBox(
              width: 1.sw-24.w,
              child: Card(
                margin: EdgeInsets.zero,
                elevation: 2,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.sp)
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                  child: child,
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}

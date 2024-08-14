import 'package:blyk_leave_management/utils/constants/constants.dart';
import 'package:blyk_leave_management/views/widgets/combined_transitions/fade_ltr_transition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class LeaveType extends StatelessWidget {
  LeaveType({super.key,required this.topIcon,required this.availableDays, required this.maxDays,required this.label});
  IconData topIcon;
  String availableDays;
  String maxDays;
  String label;
  @override
  Widget build(BuildContext context) {
    return FadeLTRTransition(
      duration: Constants.fastDuration,
      child: SizedBox(
        width: 1.sw/3-2*8.w,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.sp),
          ),
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.all(4.0.sp),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(topIcon,color: Colors.grey,size: 25.sp,)
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(availableDays,style: Theme.of(context).textTheme.headlineLarge?.copyWith(fontSize: 30.sp,height: 0.6),),
                    Text('/$maxDays',style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: Colors.grey,fontSize: 12.sp,height: 0.6),)
                  ],
                ),
                SizedBox(
                  height: 8.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(label,style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: Colors.grey,fontSize: 12.sp,height: 1.2,fontWeight: FontWeight.w600),
                       softWrap: true, overflow: TextOverflow.ellipsis,),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

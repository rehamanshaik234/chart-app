import 'package:blyk_leave_management/utils/app_colors.dart';
import 'package:blyk_leave_management/utils/constants/constants.dart';
import 'package:blyk_leave_management/views/widgets/combined_transitions/fade_ltr_transition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class UpcomingHolidays extends StatefulWidget {
  const UpcomingHolidays({super.key});

  @override
  State<UpcomingHolidays> createState() => _UpcomingHolidaysState();
}

class _UpcomingHolidaysState extends State<UpcomingHolidays> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 1.sw,
      height: 80.h*3,
      child: ListView.builder(
        itemCount: 3,
        physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context,index){
        return FadeLTRTransition(
          duration: Constants.fastDuration,
          child: SizedBox(
            width: 1.sw,
            height: 80.h,
            child: Card(
              elevation: 2,
              margin: EdgeInsets.only(bottom: 12.h),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.sp)
              ),
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 22.sp,
                      backgroundColor: AppColors.primaryColor,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('15',style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: Colors.white,height: 1,fontSize: 18.sp),),
                          Text('Aug',style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w100,fontSize: 10.sp,color: Colors.white,height: 1),),
                        ],
                      ),
                    ),
                    SizedBox(width: 8.w,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Independence Day',style: Theme.of(context).textTheme.headlineMedium,),
                        SizedBox(height: 4.h,),
                        Text('2 Days Left (Wed)',style: Theme.of(context).textTheme.headlineSmall?.copyWith(height: 0.8,fontWeight: FontWeight.w100,fontSize: 12.sp),),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}

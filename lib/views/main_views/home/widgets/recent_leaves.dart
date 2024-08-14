import 'package:blyk_leave_management/utils/app_colors.dart';
import 'package:blyk_leave_management/utils/constants/constants.dart';
import 'package:blyk_leave_management/views/widgets/combined_transitions/fade_ltr_transition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:blyk_leave_management/models/home/Leaves.dart';
class RecentLeaves extends StatefulWidget {
  const RecentLeaves({super.key});

  @override
  State<RecentLeaves> createState() => _RecentLeavesState();
}

class _RecentLeavesState extends State<RecentLeaves> {
  List<Leave> data=[
    Leave(title: "Annual Leave",fromDate: "1 Jan 2023 - 1 Jan 2023 (1 day)",reason: "Personal Matter"),
    Leave(title: "Annual Leave",fromDate: "1 Jan 2023 - 1 Jan 2023 (1 day)",reason: "Personal Matter"),
    Leave(title: "Annual Leave",fromDate: "1 Jan 2023 - 1 Jan 2023 (1 day)",reason: "Got COVID and need to be quarantine at least a week."),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80.h*3,
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: data.length,
          itemBuilder: (context,index){
            return FadeLTRTransition(
              duration: Constants.fastDuration,
              child: SizedBox(
                height: 80.h,
                child: Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.sp)
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.w,vertical: 8.h),
                    child: Row(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: 24.sp,
                              backgroundColor: AppColors.primaryColor,
                              child: Center(child: Icon(Icons.calendar_month,color: Colors.white,size: 25.sp,)),
                            )
                          ],
                        ),
                        SizedBox(width: 12.w,),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(data[index].title ?? "No Title",style: Theme.of(context).textTheme.headlineMedium,),
                              Text(data[index].fromDate ?? "No Title",style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: Colors.black.withOpacity(0.7),fontSize: 12.sp,fontWeight: FontWeight.w500),),
                              Text(data[index].reason ?? "No Title",style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: Colors.grey,fontSize: 12.sp,),overflow: TextOverflow.ellipsis,),
                            ],
                          ),
                        ),
                        Icon(Icons.arrow_forward_ios_outlined,color: AppColors.primaryColor,size: 20.sp,)
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

import 'package:blyk_leave_management/models/home/ColleaguesOnLeave.dart';
import 'package:blyk_leave_management/utils/app_colors.dart';
import 'package:blyk_leave_management/utils/constants/assets_url.dart';
import 'package:blyk_leave_management/utils/constants/constants.dart';
import 'package:blyk_leave_management/views/widgets/combined_transitions/fade_ltr_transition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ColleagueOnLeave extends StatefulWidget {
  const ColleagueOnLeave({super.key});

  @override
  State<ColleagueOnLeave> createState() => _ColleagueOnLeaveState();
}

class _ColleagueOnLeaveState extends State<ColleagueOnLeave> {
  List<ColleaguesOnLeave> data=[
    ColleaguesOnLeave(userId: 'jhhjbubduedveuw',userName: "Rehaman Shaik",leaveDate: "01/01/2023",profileUrl: AssetsUrl.profile1,),
    ColleaguesOnLeave(userId: 'jhhjbubduedveuw',userName: "Ruchi Mehta",leaveDate: "01/01/2023",profileUrl: AssetsUrl.profile1,),
    ColleaguesOnLeave(userId: 'jhhjbubduedveuw',userName: "Sahithi Reddy",leaveDate: "01/01/2023",profileUrl: AssetsUrl.profile1,),
    ColleaguesOnLeave(userId: 'jhhjbubduedveuw',userName: "Dileep Kumar",leaveDate: "01/01/2023",profileUrl: AssetsUrl.profile1,),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 1.sw,
      height: 60.h,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: data.length,
          itemBuilder: (context,index){
            return FadeLTRTransition(
              duration: Constants.fastDuration,
              child: Container(
                height: 60.h,
                margin: EdgeInsets.only(right: 16.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.sp),
                  color: AppColors.primaryColor
                ),
                child: Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                radius: 20.sp,
                                backgroundColor: Colors.white,
                                child: Transform.scale(
                                    scale: 1,
                                    child: Image.asset(AssetsUrl.profile1,fit: BoxFit.fill,)),
                              )
                            ],
                          ),
                          SizedBox(width: 8.w,),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(data[index].userName ?? "No Name",style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: Colors.white,fontWeight: FontWeight.w600),),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(Icons.date_range,color: Colors.white,size: 16.sp,),
                                  SizedBox(width: 4.w,),
                                  Text(data[index].leaveDate ?? "00|00|2000",style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: Colors.white,height: 0.8.h),),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                        right: 0,
                        child: Image.asset(AssetsUrl.bgColleagues))
                  ],
                ),
              ),
            );
      }),
    );
  }
}

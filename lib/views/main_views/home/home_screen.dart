import 'package:blyk_leave_management/controller/providers/home/home_provider.dart';
import 'package:blyk_leave_management/models/User.dart';
import 'package:blyk_leave_management/utils/app_colors.dart';
import 'package:blyk_leave_management/views/main_views/home/widgets/bottom_image.dart';
import 'package:blyk_leave_management/views/main_views/home/widgets/colleague_on_leave.dart';
import 'package:blyk_leave_management/views/main_views/home/widgets/dashboard/dashboard.dart';
import 'package:blyk_leave_management/views/main_views/home/widgets/dashboard/leave_type.dart';
import 'package:blyk_leave_management/views/main_views/home/widgets/recent_leaves.dart';
import 'package:blyk_leave_management/views/main_views/home/widgets/sub_title.dart';
import 'package:blyk_leave_management/views/main_views/home/widgets/upcoming_holidays.dart';
import 'package:blyk_leave_management/views/widgets/buttons/custom_outline_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../utils/constants/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey _columnKey = GlobalKey();
  double columnHeight=2.sh;
  bool startAnimation= false;


  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      initAnimation();
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context,provider,child) {
        return Scaffold(
          backgroundColor: Colors.transparent,
          body: Container(
            height:columnHeight,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topRight: Radius.circular(20.sp),topLeft: Radius.circular(20.sp)),
              color: Colors.white,
            ),
            child: LayoutBuilder(
              builder: (context, constraints) {
                return SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.0.w,vertical: 16.h),
                    child: Column(
                      key: _columnKey,
                      children: [
                       SubTitle(title: "Dashboard", buttonTitle: "Leave History", onPressed: (){}),
                        HomeDashboard(userLeaves: provider.userLeaves,),
                        SizedBox(height: 24.h,),
                        SubTitle(title: "Colleague's on Leave", buttonTitle: "view all", onPressed: (){}),
                        SizedBox(height: 12.h,),
                        const ColleagueOnLeave(),
                        SizedBox(height: 24.h,),
                        SubTitle(title: "Upcoming Holidays", buttonTitle: "view all", onPressed: (){}),
                        SizedBox(height: 12.h,),
                        const UpcomingHolidays(),
                        SizedBox(height: 12.h,),
                        SubTitle(title: "Your Recent Leaves", buttonTitle: "see more", onPressed: (){}),
                        SizedBox(height: 12.h,),
                        const RecentLeaves(),
                        SizedBox(height: 24.h,),
                        const BottomImage(),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        );
      }
    );
  }

  void initAnimation()async{
   await Future.delayed(Constants.fastDuration,checkColumnHeight);
  }

  void checkColumnHeight(){
    final renderBox = _columnKey.currentContext?.findRenderObject() as RenderBox?;
    if (renderBox != null) {
      final height = renderBox.size.height;
      columnHeight=height+0.04.sh;
      context.read<HomeProvider>().setColumnHeight(columnHeight);
      setState(() {});
    }
  }
}

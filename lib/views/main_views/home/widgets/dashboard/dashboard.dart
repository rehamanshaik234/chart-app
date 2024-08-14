import 'package:blyk_leave_management/models/home/UserLeaves.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'leave_type.dart';
class HomeDashboard extends StatefulWidget {
  HomeDashboard({super.key,this.userLeaves=const []});
  List<UserLeaves> userLeaves;

  @override
  State<HomeDashboard> createState() => _HomeDashboardState();
}

class _HomeDashboardState extends State<HomeDashboard> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              for(int i=0;i<widget.userLeaves.length;i++)
                LeaveType(topIcon: Icons.business, availableDays: widget.userLeaves[i].remainingDays.toString().padLeft(2,'0'), maxDays: widget.userLeaves[i].days.toString().padLeft(2,'0'), label: widget.userLeaves[i].leaveTitle ?? "")
            ],
          ),
          SizedBox(height: 12.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              LeaveType(topIcon: Icons.back_hand_rounded, availableDays: '03', maxDays: '03', label: "Compassionate"),
              SizedBox(width: 8.w,),
              LeaveType(topIcon: Icons.person_2_outlined, availableDays: '05', maxDays: '05', label: "Marriage"),
              SizedBox(width: 8.w,),
              LeaveType(topIcon: Icons.pregnant_woman, availableDays: '60', maxDays: '60', label: "Maternity"),
            ],
          ),
          SizedBox(height: 12.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              LeaveType(topIcon: Icons.change_circle_outlined, availableDays: '03', maxDays: '03', label: "Replacement"),
              SizedBox(width: 8.w,),
            ],
          ),
        ],
      ),
    );
  }
}

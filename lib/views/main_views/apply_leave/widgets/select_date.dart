import 'package:blyk_leave_management/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class SelectDate extends StatelessWidget {
  DateTime? date;
  SelectDate({super.key,this.date});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0.sp),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(date==null ?'Select Date':date.toString(),style: Theme.of(context).textTheme.headlineSmall?.copyWith(color:date==null? Colors.grey:Colors.black),),
          Icon(Icons.date_range,color: Colors.grey,size: 20.sp,)
        ],
      ),
    );
  }
}

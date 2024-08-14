import 'package:blyk_leave_management/models/LeavePeriod.dart';
import 'package:blyk_leave_management/models/LeaveSession.dart';
import 'package:blyk_leave_management/models/LeaveType.dart';
import 'package:blyk_leave_management/utils/constants/constants.dart';
import 'package:blyk_leave_management/views/main_views/apply_leave/state/apply_leave_state.dart';
import 'package:blyk_leave_management/views/main_views/apply_leave/widgets/input_fields.dart';
import 'package:blyk_leave_management/views/main_views/apply_leave/widgets/reason_textfield.dart';
import 'package:blyk_leave_management/views/main_views/apply_leave/widgets/select_date.dart';
import 'package:blyk_leave_management/views/main_views/home/widgets/sub_title.dart';
import 'package:blyk_leave_management/views/widgets/buttons/custom_button.dart';
import 'package:blyk_leave_management/views/widgets/combined_transitions/fade_ltr_transition.dart';
import 'package:blyk_leave_management/views/widgets/combined_transitions/fade_scale_transition.dart';
import 'package:blyk_leave_management/views/widgets/drop_down_button/custom_drop_down.dart';
import 'package:blyk_leave_management/views/widgets/transitions/navigation_transitons.dart';
import 'package:blyk_leave_management/views/widgets/transitions/widget_transition.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
class ApplyLeave extends StatefulWidget {
  const ApplyLeave({super.key});

  @override
  State<ApplyLeave> createState() => _ApplyLeaveState();
}

class _ApplyLeaveState extends State<ApplyLeave> {
  bool startAnimation= false;
  String? leaveType;
  bool hasFocus=false;
  ScrollController controller=ScrollController();
  FocusScopeNode focusNode=FocusScopeNode();
  List<Map<String,dynamic>> data=[LeaveType(leaveId: "nekjkje",leaveTitle: "Medical Leave").toJson(),
                                  LeaveType(leaveId: "nekjkje",leaveTitle: "Casual Leave").toJson(),
                                  LeaveType(leaveId: "nekjkje",leaveTitle: "Sick Leave").toJson()];
  List<Map<String,dynamic>> leavePeriodData=[LeavePeriod(leavePeriod: "Full-Day",id: Constants.fullDayId).toJson(), LeavePeriod(leavePeriod: "Half Day",id: Constants.halfDayId).toJson(),];
  List<Map<String,dynamic>> leaveSessionData=[LeaveSession(sessionId: Constants.morningSessionId,sessionTitle:"Morning").toJson(), LeaveSession(sessionId:Constants.afternoonSessionId,sessionTitle:"Afternoon").toJson(),];

  @override
  Widget build(BuildContext context) {
    return Consumer<ApplyLeaveState>(
      builder: (context,state,child) {
        return Scaffold(
          body: SingleChildScrollView(
            controller: controller,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 12.h,horizontal: 12.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SubTitle(title: 'Leave Application Form', buttonTitle: "",showButton: false,textStyle: Theme.of(context).textTheme.headlineLarge?.copyWith(fontSize: 18.sp)),
                  SizedBox(height: 8.h,),
                  Text('Please provide information about your leave.',style: Theme.of(context).textTheme.headlineSmall,),
                  SizedBox(height: 16.h,),
                  InputFields(title: "Leave Type :", child: CustomDropDown(selectedValue:state.leaveType?.toJson(),hintText: "Choose Leave Type",idKey: LeaveType.leaveIdKey,
                    titleKey: LeaveType.leaveTitleKey,data: data,onSelected:(val)=> selectLeaveType(val,state),)),
                  SizedBox(height: 16.h,),
                  InputFields(title: "Leave Period :", child: CustomDropDown(selectedValue: state.leavePeriod?.toJson(),hintText: "Choose Leave Period", data:leavePeriodData,
                    onSelected:(val)=>selectLeavePeriod(val,state), idKey: LeavePeriod.leavePeriodIdKey,titleKey: LeavePeriod.leavePeriodTitleKey,)),
                  SizedBox(height: 16.h,),
                  InkWell(
                      onTap:showStartDatePicker,
                      child: InputFields(title:state.leavePeriod?.id==Constants.halfDayId?"Leave Date :": "Leave Start Date :", child:  SelectDate(date: state.startDate,))),
                  SizedBox(height: 16.h,),
                  Visibility(
                    visible: state.leavePeriod==null || state.leavePeriod?.id==Constants.fullDayId,
                    child: InkWell(
                        onTap: showEndDatePicker,
                        child: InputFields(title: "Leave End Date :", child: SelectDate(date: state.endDate,))),
                  ),
                  Visibility(
                    visible: state.leavePeriod==null || state.leavePeriod?.id==Constants.fullDayId,
                    child: SizedBox(height: 16.h,),
                  ),
                  Visibility(
                    visible: state.leavePeriod==null || state.leavePeriod?.id==Constants.fullDayId,
                    child: InputFields(title: "Duration",child: Padding(
                      padding: EdgeInsets.all(8.0.sp),
                      child: Text('${getDifference(state)} - Days'),
                    ),),
                  ),
                  Visibility(
                    visible: state.leavePeriod?.id==Constants.halfDayId,
                    child: InputFields(title: "Leave Session :", child: CustomDropDown(selectedValue:state.leaveSession?.toJson(),hintText: "Choose Leave Session", data: leaveSessionData,onSelected: (val)=> selectLeaveSession(val,state),idKey: LeaveSession.leaveSessionIdKey,titleKey: LeaveSession.leaveSessionTitleKey,)),
                  ),
                  SizedBox(height: 16.h,),
                  InputFields(title: "Reason :", child: ReasonTextField(onFocusChanged: onFocusChanged, )),
                  SizedBox(height:hasFocus?200.h:0.h,),
                ],
              ),
            ),
          ),
          bottomNavigationBar: Container(
            margin: EdgeInsets.only(bottom: 160.h,right: 8.w,left: 8.w),
              child: CustomButton(onPressed: (){}, title: "Apply")),
        );
      }
    );
  }

  onFocusChanged(focus)async{
    hasFocus=focus;
    setState(() {});
    await Future.delayed(const Duration(milliseconds: 100),(){});
    if(focus){
      controller.position.animateTo(controller.position.maxScrollExtent,
          duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
    }
  }

  showEndDatePicker()async{
    ApplyLeaveState state=context.read<ApplyLeaveState>();
    if(state.startDate!=null) {
      DateTime? endDate = await showDatePicker(context: context,
          firstDate:state.startDate ?? DateTime.now(),
          lastDate: DateTime(2030),
          initialDate: state.endDate,
          helpText: "End Date");
      state.setEndDate(endDate);
    }
  }

  showStartDatePicker ()async{
    ApplyLeaveState state=context.read<ApplyLeaveState>();
    DateTime? startDate= await showDatePicker(context: context,
        initialDate: state.startDate,
        firstDate: DateTime.now(), lastDate: DateTime(2030),helpText: "Start Date");
    if(startDate!=null){
      state.setStartDate(startDate);
    }
  }

  selectLeavePeriod(val,ApplyLeaveState state){
    state.setLeavePeriod(LeavePeriod.fromJson(val));
  }

  selectLeaveType(val,state){
    state.setLeaveType(LeaveType.fromJson(val));
  }

  selectLeaveSession(val,ApplyLeaveState state){
    state.setLeaveSession(LeaveSession.fromJson(val));
  }

 String getDifference(ApplyLeaveState state) {
    return state.endDate != null && state.startDate != null
        ? state.endDate!.difference(state.startDate!).inDays.toString()
        : "0";
 }
}

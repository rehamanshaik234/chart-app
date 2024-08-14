import 'package:blyk_leave_management/models/LeavePeriod.dart';
import 'package:blyk_leave_management/models/LeaveSession.dart';
import 'package:blyk_leave_management/models/LeaveType.dart';
import 'package:flutter/cupertino.dart';

class ApplyLeaveState extends ChangeNotifier{
  DateTime? _endDate;
  DateTime? get endDate => _endDate;
  DateTime? _startDate;
  DateTime? get startDate => _startDate;
  LeavePeriod? _leavePeriod;
  LeavePeriod? get leavePeriod => _leavePeriod;
  LeaveType? _leaveType;
  LeaveSession? get leaveSession => _leaveSession;
  LeaveSession? _leaveSession;
  LeaveType? get leaveType => _leaveType;

  void setStartDate(DateTime? date){
    _startDate=date;
    notifyListeners();
  }

  void setEndDate(DateTime? date){
    _endDate=date;
    notifyListeners();
  }

  void setLeavePeriod(LeavePeriod period){
    _leavePeriod=period;
    notifyListeners();
  }


  void setLeaveType(LeaveType type){
    _leaveType=type;
    notifyListeners();
  }

  void setLeaveSession(LeaveSession session){
    _leaveSession=session;
    notifyListeners();
  }
}
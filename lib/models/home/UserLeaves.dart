/// user_id : 1
/// leave_type_id : 1
/// leave_title : "Sick"
/// days : 7
/// remaining_days : 5

class UserLeaves {
  UserLeaves({
      num? userId, 
      num? leaveTypeId, 
      String? leaveTitle, 
      num? days, 
      num? remainingDays,}){
    _userId = userId;
    _leaveTypeId = leaveTypeId;
    _leaveTitle = leaveTitle;
    _days = days;
    _remainingDays = remainingDays;
}

  UserLeaves.fromJson(dynamic json) {
    _userId = json['user_id'];
    _leaveTypeId = json['leave_type_id'];
    _leaveTitle = json['leave_title'];
    _days = json['days'];
    _remainingDays = json['remaining_days'];
  }
  num? _userId;
  num? _leaveTypeId;
  String? _leaveTitle;
  num? _days;
  num? _remainingDays;
UserLeaves copyWith({  num? userId,
  num? leaveTypeId,
  String? leaveTitle,
  num? days,
  num? remainingDays,
}) => UserLeaves(  userId: userId ?? _userId,
  leaveTypeId: leaveTypeId ?? _leaveTypeId,
  leaveTitle: leaveTitle ?? _leaveTitle,
  days: days ?? _days,
  remainingDays: remainingDays ?? _remainingDays,
);
  num? get userId => _userId;
  num? get leaveTypeId => _leaveTypeId;
  String? get leaveTitle => _leaveTitle;
  num? get days => _days;
  num? get remainingDays => _remainingDays;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['user_id'] = _userId;
    map['leave_type_id'] = _leaveTypeId;
    map['leave_title'] = _leaveTitle;
    map['days'] = _days;
    map['remaining_days'] = _remainingDays;
    return map;
  }

}
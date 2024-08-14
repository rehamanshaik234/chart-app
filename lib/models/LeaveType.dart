/// leave_id : "jhvdgvfvbfjbj"
/// description : "jfhufbvfgvfdj"
/// leave_title : "djbbvfdvfdj"
/// days : 1

class LeaveType {
  LeaveType({
      String? leaveId, 
      String? description, 
      String? leaveTitle, 
      num? days,}){
    _leaveId = leaveId;
    _description = description;
    _leaveTitle = leaveTitle;
    _days = days;
}

  static String leaveTitleKey='leave_title';
  static String leaveIdKey='leave_title';

  LeaveType.fromJson(dynamic json) {
    _leaveId = json['leave_id'];
    _description = json['description'];
    _leaveTitle = json['leave_title'];
    _days = json['days'];
  }
  String? _leaveId;
  String? _description;
  String? _leaveTitle;
  num? _days;
LeaveType copyWith({  String? leaveId,
  String? description,
  String? leaveTitle,
  num? days,
}) => LeaveType(  leaveId: leaveId ?? _leaveId,
  description: description ?? _description,
  leaveTitle: leaveTitle ?? _leaveTitle,
  days: days ?? _days,
);
  String? get leaveId => _leaveId;
  String? get description => _description;
  String? get leaveTitle => _leaveTitle;
  num? get days => _days;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['leave_id'] = _leaveId;
    map['description'] = _description;
    map['leave_title'] = _leaveTitle;
    map['days'] = _days;
    return map;
  }

}
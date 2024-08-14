/// user_id : "jvduvsdbkhc"
/// user_name : "rehaman"
/// leave_date : "01/02/2023"
/// profile_url : "bjb js cjhc dh"

class ColleaguesOnLeave {
  ColleaguesOnLeave({
    String? userId,
    String? userName,
    String? leaveDate,
    String? profileUrl,
    String? leaveId,
    String? leaveType,
  }) {
    _userId = userId;
    _userName = userName;
    _leaveDate = leaveDate;
    _profileUrl = profileUrl;
    _leaveId = leaveId;
    _leaveType = leaveType;
  }

  ColleaguesOnLeave.fromJson(dynamic json) {
    _userId = json['user_id'];
    _userName = json['user_name'];
    _leaveDate = json['leave_date'];
    _profileUrl = json['profile_url'];
    _leaveId = json['leave_id'];
    _leaveType = json['leave_type'];
  }

  String? _userId;
  String? _userName;
  String? _leaveDate;
  String? _profileUrl;
  String? _leaveId;
  String? _leaveType;

  ColleaguesOnLeave copyWith({
    String? userId,
    String? userName,
    String? leaveDate,
    String? profileUrl,
    String? leaveId,
    String? leaveType,
  }) => ColleaguesOnLeave(
    userId: userId ?? _userId,
    userName: userName ?? _userName,
    leaveDate: leaveDate ?? _leaveDate,
    profileUrl: profileUrl ?? _profileUrl,
    leaveId: leaveId ?? _leaveId,
    leaveType: leaveType ?? _leaveType,
  );

  String? get userId => _userId;
  String? get userName => _userName;
  String? get leaveDate => _leaveDate;
  String? get profileUrl => _profileUrl;
  String? get leaveId => _leaveId;
  String? get leaveType => _leaveType;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['user_id'] = _userId;
    map['user_name'] = _userName;
    map['leave_date'] = _leaveDate;
    map['profile_url'] = _profileUrl;
    map['leave_id'] = _leaveId;
    map['leave_type'] = _leaveType;
    return map;
  }
}

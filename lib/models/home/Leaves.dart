/// leave_id : "hbdgdcvdgsvcgscv"
/// leave_type_id : "hdsvgvgveh"
/// title : "Annual Leave"
/// from_date : "12-90"
/// to_date : "jhbj"
/// reason : "khbdvfh dgdfgvh df"

class Leave {
  Leave({
      String? leaveId, 
      String? leaveTypeId, 
      String? title, 
      String? fromDate, 
      String? toDate, 
      String? reason,}){
    _leaveId = leaveId;
    _leaveTypeId = leaveTypeId;
    _title = title;
    _fromDate = fromDate;
    _toDate = toDate;
    _reason = reason;
}

  Leave.fromJson(dynamic json) {
    _leaveId = json['leave_id'];
    _leaveTypeId = json['leave_type_id'];
    _title = json['title'];
    _fromDate = json['from_date'];
    _toDate = json['to_date'];
    _reason = json['reason'];
  }
  String? _leaveId;
  String? _leaveTypeId;
  String? _title;
  String? _fromDate;
  String? _toDate;
  String? _reason;
Leave copyWith({  String? leaveId,
  String? leaveTypeId,
  String? title,
  String? fromDate,
  String? toDate,
  String? reason,
}) => Leave(  leaveId: leaveId ?? _leaveId,
  leaveTypeId: leaveTypeId ?? _leaveTypeId,
  title: title ?? _title,
  fromDate: fromDate ?? _fromDate,
  toDate: toDate ?? _toDate,
  reason: reason ?? _reason,
);
  String? get leaveId => _leaveId;
  String? get leaveTypeId => _leaveTypeId;
  String? get title => _title;
  String? get fromDate => _fromDate;
  String? get toDate => _toDate;
  String? get reason => _reason;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['leave_id'] = _leaveId;
    map['leave_type_id'] = _leaveTypeId;
    map['title'] = _title;
    map['from_date'] = _fromDate;
    map['to_date'] = _toDate;
    map['reason'] = _reason;
    return map;
  }

}
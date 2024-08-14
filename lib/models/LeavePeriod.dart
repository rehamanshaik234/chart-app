/// leave_period : "Half-Day"
/// id : "hald-day"

class LeavePeriod {
  LeavePeriod({
      String? leavePeriod, 
      String? id,}){
    _leavePeriod = leavePeriod;
    _id = id;
}
  static String leavePeriodTitleKey='leave_period';
  static String leavePeriodIdKey='id';

  LeavePeriod.fromJson(dynamic json) {
    _leavePeriod = json['leave_period'];
    _id = json['id'];
  }
  String? _leavePeriod;
  String? _id;
LeavePeriod copyWith({  String? leavePeriod,
  String? id,
}) => LeavePeriod(  leavePeriod: leavePeriod ?? _leavePeriod,
  id: id ?? _id,
);
  String? get leavePeriod => _leavePeriod;
  String? get id => _id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['leave_period'] = _leavePeriod;
    map['id'] = _id;
    return map;
  }

}
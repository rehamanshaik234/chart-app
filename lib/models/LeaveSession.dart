/// session_id : "sjsvdgh"
/// session_title : "Morning"

class LeaveSession {
  LeaveSession({
      String? sessionId, 
      String? sessionTitle,}){
    _sessionId = sessionId;
    _sessionTitle = sessionTitle;
}
  static String leaveSessionTitleKey='session_title';
  static String leaveSessionIdKey='session_id';

  LeaveSession.fromJson(dynamic json) {
    _sessionId = json['session_id'];
    _sessionTitle = json['session_title'];
  }
  String? _sessionId;
  String? _sessionTitle;
LeaveSession copyWith({  String? sessionId,
  String? sessionTitle,
}) => LeaveSession(  sessionId: sessionId ?? _sessionId,
  sessionTitle: sessionTitle ?? _sessionTitle,
);
  String? get sessionId => _sessionId;
  String? get sessionTitle => _sessionTitle;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['session_id'] = _sessionId;
    map['session_title'] = _sessionTitle;
    return map;
  }

}
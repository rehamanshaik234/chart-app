
import 'package:blyk_leave_management/views/widgets/transitions/navigation_transitons.dart';

class RouteParams {
  RouteParams({
      bool? applyAnimation, 
      TransitionType? transitionType,
      var data,}){
    _applyAnimation = applyAnimation ?? false;
    _transitionType = transitionType ?? TransitionType.fade;
    _data = data;
}


  late bool _applyAnimation;
  late TransitionType _transitionType;
  var _data;

  bool get applyAnimation => _applyAnimation;
  TransitionType get transitionType => _transitionType;
  get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['apply_animation'] = _applyAnimation;
    map['transition_type'] = _transitionType;
    map['data'] = _data;
    return map;
  }

}
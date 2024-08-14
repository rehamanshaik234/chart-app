import 'package:blyk_leave_management/controller/repo/home_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../models/home/UserLeaves.dart';

class HomeProvider extends ChangeNotifier{
  double _columnHeight=2.sh;
  double get columnHeight => _columnHeight;

  bool _loader=true;
  bool get loader => _loader;
  HomeRepo homeRepo=HomeRepo();
  List<UserLeaves> _userLeaves = [];
  List<UserLeaves> get userLeaves => _userLeaves;
  void setColumnHeight(double height){
    _columnHeight=height;
    notifyListeners();
  }

  Future<void> getLeaves()async{
    _userLeaves= await homeRepo.getUserLeaves();
    notifyListeners();
  }

  Future<void> getData()async{
    await getLeaves();
    _loader=false;
    notifyListeners();
  }
}
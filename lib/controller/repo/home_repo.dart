import 'package:blyk_leave_management/controller/storage/session.dart';
import 'package:blyk_leave_management/models/User.dart';
import 'package:blyk_leave_management/models/home/UserLeaves.dart';
import 'package:blyk_leave_management/utils/supabase_functions/supabase_functions.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomeRepo{
  Supabase supabase=Supabase.instance;

  Future<List<UserLeaves>> getUserLeaves()async{
    try {
      List<UserLeaves> leaves=[];
      UserModel? userModel=await LoginSession().getUserInfo();
      List<dynamic> result=await supabase.client.rpc(SupabaseFunctions.leavesInfo,params: {'userid':userModel?.userId });
      for (var leave in result) {
       leaves.add(UserLeaves.fromJson(leave));
      }
      return leaves;
    } on Exception catch (e) {
      print(e);
      return [];
      // TODO
    }
  }
}
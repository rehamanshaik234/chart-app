import 'dart:convert';
import 'package:blyk_leave_management/models/User.dart';
import 'package:blyk_leave_management/utils/constants/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginSession{
  Future<SharedPreferences> getInstance()async{
    return await SharedPreferences.getInstance();
  }

  Future<bool> storeUserInfo(UserModel user)async{
    final preference=await getInstance();
    return await preference.setString(Constants.userCredentials, jsonEncode(user.toJson()));
  }


  Future<UserModel?> getUserInfo()async{
    final preference=await getInstance();
    String? userString= preference.getString(Constants.userCredentials);
    return userString==null? null : UserModel.fromJson(jsonDecode(userString));
  }

  Future<bool> isUserLoggedIn()async{
    return await getUserInfo()!=null;
  }

  Future<bool> clear()async{
    final preference=await getInstance();
    return await preference.clear();
  }
}
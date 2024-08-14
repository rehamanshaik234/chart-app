import 'package:blyk_leave_management/models/User.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthRepo{
  Supabase supabase=Supabase.instance;

  Future<UserModel?> loginWithIdPassword(String email,String password)async{
    try {
      final result = await supabase.client.schema('public').from('users').select('*').eq("email", email).eq('password', password).single();
      UserModel userModel=UserModel.fromJson(result);
      return userModel;
    }catch(e){
      return null;
    }
  }

  Future<List<UserModel>> getAllUsers()async{
    try{
      final users= await supabase.client.schema("public").from("users").select('*');
      List<UserModel> data=[];
      for (var user in users) {
        data.add(UserModel.fromJson(user));
      }
      return data;
    } catch(e){
      return [];
    }
  }

}
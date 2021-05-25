import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalHelper{
  static SharedPreferences sharedPreferences;
  static init()async{
    sharedPreferences=await SharedPreferences.getInstance();
  }
  static Future<bool> PutData({@required String key,@required bool value})async{
    return await sharedPreferences.setBool(key, value);
  }
  static bool getData({@required String key}){
    return sharedPreferences.getBool(key);
  }
}
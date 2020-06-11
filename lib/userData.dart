// This class will store the user details mainly name, weight and height.
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

class SharedPreferencesHelper{
  static SharedPreferencesHelper _instance;

  factory SharedPreferencesHelper() => _instance ??= new SharedPreferencesHelper._();
  SharedPreferencesHelper._();

  ///
  /// Instantiation of the SharedPreferences library
  ///
  static String _kUserName='username';
  static String _kUserWeight='userweight';
  static String _kUserHeight='userheight';
  static String _kFirstTimeUser='firstTimer';
  

  /// ------------------------------------------------------------
  /// Methods that saves and returns the user details
  /// ------------------------------------------------------------

  Future<bool> saveUserName(String name,SharedPreferences pref) async{

    return  pref.setString(_kUserName, name);

  }
  Future<String>getUserName(SharedPreferences pref)async{
   return pref.getString(_kUserName) == null ? 'User' : pref.getString(_kUserName);

 }

  Future<bool> saveUserWeight(String weight,SharedPreferences pref) async{
    return  pref.setString(_kUserWeight, weight);

  }
  Future<String>getUserWeight(SharedPreferences pref)async{
    return pref.getString(_kUserWeight);


  }

  Future<bool> saveUserHeight(String height,SharedPreferences pref) async{
    return  pref.setString(_kUserHeight, height);

  }
  Future<String>getUserHeight(SharedPreferences pref)async{
    return pref.getString(_kUserHeight );


  }
  Future<bool>setFirstTimeUser(SharedPreferences pref) async{

    return pref.setBool(_kFirstTimeUser, false);
  }

  Future<bool>getFirstTimeUser(SharedPreferences pref) async{
    return pref.getBool(_kFirstTimeUser);
  }


}
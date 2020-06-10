// This class will store the user details mainly name, weight and height.
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper{
  static SharedPreferencesHelper _instance;
  factory SharedPreferencesHelper() => _instance ??= new SharedPreferencesHelper._();

  SharedPreferencesHelper._();
  ///
  /// Instantiation of the SharedPreferences library
  ///
  static String _kUserName;
  static String _kUserWeight;
  static String _kUserHeight;

  /// ------------------------------------------------------------
  /// Methods that saves and returns the user details
  /// ------------------------------------------------------------

  Future<bool> saveUserName(String name) async{
    SharedPreferences pref= await SharedPreferences.getInstance();
    return  pref.setString(_kUserName, name);

  }
 Future<String>getUserName()async{
   SharedPreferences pref= await SharedPreferences.getInstance();
   return pref.getString(_kUserName)?? 'User';

 }

  Future<bool> saveUserWeight(String weight) async{
    SharedPreferences pref= await SharedPreferences.getInstance();
    return  pref.setString(_kUserWeight, weight);

  }
  Future<String>getUserWeight()async{
    SharedPreferences pref= await SharedPreferences.getInstance();
    return pref.getString(_kUserWeight) ?? '';


  }

  Future<bool> saveUserHeight(String height) async{
    SharedPreferences pref= await SharedPreferences.getInstance();
    return  pref.setString(_kUserHeight, height);

  }
  Future<String>getUserHeight()async{
    SharedPreferences pref= await SharedPreferences.getInstance();
    return pref.getString(_kUserHeight)?? '';


  }



}
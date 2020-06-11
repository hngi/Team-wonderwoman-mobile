import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ifitness/userData.dart';
import 'package:ifitness/screens/welcome.dart';
import 'package:ifitness/screens/home.dart';

class ControlScreen extends StatefulWidget {
  @override
  _ControlScreenState createState() => _ControlScreenState();
}

class _ControlScreenState extends State<ControlScreen> {

  bool firstTime=true;

  @override void initState() {

    super.initState();



    SharedPreferences.getInstance().then((prefs){
      SharedPreferencesHelper object=new SharedPreferencesHelper();

    // We check if first  timer first

    object.getFirstTimeUser(prefs).then((res){
      setState((){
      firstTime = res == null ? true : res; // FOr the very first time, its null
    });
    });




    object.setFirstTimeUser(prefs); // Set the first timer to be false
    });

  }
  @override
  Widget build(BuildContext context) {
    return firstTime ? WelcomeScreen() : HomePage();
  }
}

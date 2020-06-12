
import 'package:flutter/material.dart';
import 'package:ifitness/screens/home.dart';
import 'package:ifitness/widgets/bottom_navigation.dart';
import 'package:ifitness/widgets/control_screen.dart';
import 'screens/favourites.dart';
import 'screens/profile.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

        debugShowCheckedModeBanner: false,
        title: 'iFitness',
        theme: ThemeData(
          scaffoldBackgroundColor: Color(0xfff8f8f8),
//        textTheme: Theme.of(context).textTheme.apply(displayColor:Color(0xff2d438d)),


        ),
        home: Scaffold(
          bottomNavigationBar: BottomNavigation(),
            body: ControlScreen()),


    );
  }
}



import 'package:flutter/material.dart';
import 'package:ifitness/widgets/control_screen.dart';
import 'screens/favourites.dart';
import 'screens/profile.dart';
import 'screens/home.dart';

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
      home: ControlScreen(),
      routes: <String, WidgetBuilder>{
        '/favourites': (BuildContext context) => new FavouritesPage(),
        '/profile': (BuildContext context) => new ProfileScreen(),
        '/home':(BuildContext context)=> new HomePage(),
      },



    );

  }
}

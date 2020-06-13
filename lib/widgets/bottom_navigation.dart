// this is the bottom navigation widget that will be applied to different screens
import 'package:flutter/material.dart';

import '../screens/home.dart';
import '../screens/profile.dart';

class BottomNavigation extends StatefulWidget {
  @override
  _BottomNavigationBarState createState() => _BottomNavigationBarState();
}

class _BottomNavigationBarState extends State<BottomNavigation> {

  int _selectedIndex = 0;

  // function when the icon is tapped it takes the selected index and change the screen
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (_selectedIndex) {
      case 0:
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context){
              return  HomePage();
            }));
        break;
      case 1:
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context){
              return  ProfileScreen();
            }));
        break;
    }
  }

//  final List<Widget>_children=[
//    WelcomeScreen(),
//    UserDetails(),
//    HomePage(),
//    ProfileScreen(),
//
//  ];

  @override
  Widget build(BuildContext context) {

    return Container(
//      body: _children[_selectedIndex],

        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          selectedItemColor: Color(0xff2d438d),
          onTap: _onItemTapped,
          items:const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Exercises',
                style: TextStyle(
                    fontFamily: 'Work Sans/WorkSans-Regular'
                ),)
            ),

            BottomNavigationBarItem(
                icon: Icon(Icons.person_pin),
              title: Text('Profile',
              style: TextStyle(
                  fontFamily: 'Work Sans/WorkSans-Regular'
              ),)
            ),],
        ));

  }
//  void _onItemTapped(int index) {
//    setState(() {
//      _selectedIndex = index;
//    });
//  }
}



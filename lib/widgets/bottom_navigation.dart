// this is the bottom navigation widget that will be applied to different screens
import 'package:flutter/material.dart';
import '../screens/favourites.dart';
import '../screens/home.dart';
import '../screens/profile.dart';
import 'destination.dart';

class BottomNavigation extends StatefulWidget {
  @override
  _BottomNavigationBarState createState() => _BottomNavigationBarState();
}

class _BottomNavigationBarState extends State<BottomNavigation> {
  final fontStyle=new TextStyle(fontFamily: 'Work Sans/WorkSans-Regular');
  int _selectedIndex = 0;

  // function when the icon is tapped it takes the selected index and change the screen
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if(index==0){
         _selectedIndex = index;
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context){
              return new HomePage();
            }));
      }
      else if(index==1){
         _selectedIndex = index;
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context){
              return new FavouritesPage();
            }));
      }
      else{
         _selectedIndex = index;
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context){
              return new ProfileScreen();
            }));
      }

    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child:BottomNavigationBar(
          items: allDestinations.map((Destination destination) {
            return BottomNavigationBarItem(
                icon: Icon(destination.icon),
                backgroundColor: destination.color,
                title: Text(destination.title)
            );
          }).toList(),
        onTap: _onItemTapped,
//        selectedItemColor: destination.color,
      )
    );
  }
}




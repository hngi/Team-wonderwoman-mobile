// this is the bottom navigation widget that will be applied to different screens
import 'package:flutter/material.dart';
import '../screens/favourites.dart';
import '../screens/home.dart';
import '../screens/profile.dart';

class BottomNavigation extends StatefulWidget {
  @override
  _BottomNavigationBarState createState() => _BottomNavigationBarState();
}

class _BottomNavigationBarState extends State<BottomNavigation> {
 final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();
  int _currentTabIndex = 0;

  // int _selectedIndex = 0;

  // // function when the icon is tapped it takes the selected index and change the screen
  // void _onItemTapped(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //     if(index==0){
  //       _selectedIndex = index;
  //       Navigator.of(context).push(
  //           MaterialPageRoute(builder: (context){
  //             return  HomePage();
  //           }));
  //     }
  //     else if(index==1){
  //       _selectedIndex = index;
  //       Navigator.of(context).push(
  //           MaterialPageRoute(builder: (context){
  //             return  FavouritesPage();
  //           }));
  //     }
  //     else{
  //       _selectedIndex = index;
  //       Navigator.of(context).push(
  //           MaterialPageRoute(builder: (context){
  //             return  ProfileScreen();
  //           }));
  //     }

  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Navigator(key: _navigatorKey, onGenerateRoute: generateRoute),
      bottomNavigationBar: _bottomNavigationBar(),
    );
  }

   _onTap(int tabIndex) {
    switch (tabIndex) {
      case 0:
        _navigatorKey.currentState.pushReplacementNamed("Exercises");
        break;
      case 1:
        _navigatorKey.currentState.pushReplacementNamed("Favourites");
        break;
      case 2:
        _navigatorKey.currentState.pushReplacementNamed("Profile");
        break;
    }
    setState(() {
      _currentTabIndex = tabIndex;
    });
  }


  Widget _bottomNavigationBar(){

    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items:[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          title: Text('Exercises',style: TextStyle(fontFamily: 'Work Sans/WorkSans-Regular'),)
        ),

        BottomNavigationBarItem(
          icon:Icon(Icons.star),
          title: Text('Favourites',style: TextStyle(fontFamily: 'Work Sans/WorkSans-Regular'),)),

        BottomNavigationBarItem(
          icon: Icon(Icons.person_pin),
          title: Text('Profile',
          style: TextStyle(fontFamily: 'Work Sans/WorkSans-Regular'),)),

        ],
      currentIndex: _currentTabIndex,
      selectedItemColor: Color(0xff2d438d),
      onTap: _onTap
    );
    
  }

  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "Favourites":
        return MaterialPageRoute(builder: (context) => FavouritesPage());
      case "Profile":
        return MaterialPageRoute(builder: (context) => ProfileScreen());
      default:
        return MaterialPageRoute(builder: (context) => HomePage());
    }
  }

}


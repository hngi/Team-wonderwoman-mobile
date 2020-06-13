import 'package:flutter/material.dart';
import 'package:ifitness/screens/home.dart';
import 'package:ifitness/screens/profile.dart';
import 'package:ifitness/widgets/control_screen.dart';


class Navigation extends StatefulWidget {

  @override
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  // This navigator state will be used to navigate different pages
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();
  int _currentTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Navigator(key: _navigatorKey, onGenerateRoute: generateRoute),
        bottomNavigationBar: _bottomNavigationBar(),
      ),
    );
  }

  Widget _bottomNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          title: Text("Home"),
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.account_circle), title: Text("Account")),
        // BottomNavigationBarItem(
        //   icon: Icon(Icons.settings),
        //   title: Text("Settings"),
        // )
      ],
      onTap: _onTap,
      currentIndex: _currentTabIndex,
    );
  }

  _onTap(int tabIndex) {
    switch (tabIndex) {
      case 0:
        _navigatorKey.currentState.pushReplacementNamed("Home");
        break;
      case 1:
        _navigatorKey.currentState.pushReplacementNamed("Account");
        break;
      // case 2:
      //   _navigatorKey.currentState.pushReplacementNamed("Settings");
      //   break;
    }
    setState(() {
      _currentTabIndex = tabIndex;
    });
  }

  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "Account":
        return MaterialPageRoute(builder: (context) =>ProfileScreen());
      case "Home":
        return MaterialPageRoute(builder: (context) => HomePage());
      default:
        return MaterialPageRoute(builder: (context) =>  ControlScreen());
    }
  }
}
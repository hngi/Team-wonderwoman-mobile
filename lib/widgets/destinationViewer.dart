import 'package:flutter/material.dart';
import 'package:ifitness/screens/favourites.dart';
import 'package:ifitness/screens/home.dart';
import 'package:ifitness/screens/profile.dart';
import 'destination.dart';

class DestinationView extends StatefulWidget {
  const DestinationView({ Key key, this.destination }) : super(key: key);

  final Destination destination;

  @override
  _DestinationViewState createState() => _DestinationViewState();
}

class _DestinationViewState extends State<DestinationView> {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(
          settings: settings,
          builder: (BuildContext context) {
            switch(settings.name) {
              case '/':
                return HomePage(destination: widget.destination);
              case '/favourites':
                return FavouritesPage(destination: widget.destination);
              case '/profile':
                return ProfileScreen(destination: widget.destination);
            }
          },
        );
      },
    );
  }
}

class ViewNavigatorObserver extends NavigatorObserver {
  ViewNavigatorObserver(this.onNavigation);

  final VoidCallback onNavigation;

  void didPop(Route<dynamic> route, Route<dynamic> previousRoute) {
    onNavigation();
  }
  void didPush(Route<dynamic> route, Route<dynamic> previousRoute) {
    onNavigation();
  }
}

//class RootPage extends StatelessWidget {
//  const RootPage({ Key key, this.destination }) : super(key: key);
//
//  final Destination destination;
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text(destination.title),
//        backgroundColor: destination.color,
//      ),
//      backgroundColor: destination.color,
//      body: SizedBox.expand(
//        child: InkWell(
//          onTap: () {
//            Navigator.pushNamed(context, "/list");
//          },
//        ),
//      ),
//    );
//  }
//}
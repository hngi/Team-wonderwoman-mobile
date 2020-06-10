import 'package:flutter/material.dart';

import '../widgets/bottom_navigation.dart';

class FavouritesPage extends StatefulWidget {
  @override
  _FavouritesPageState createState() => _FavouritesPageState();
}

class _FavouritesPageState extends State<FavouritesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigation(),
      body:Container(
        child:Text('Hello there')
      )
    );
  }
}

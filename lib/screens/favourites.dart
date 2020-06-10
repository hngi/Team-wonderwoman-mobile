import 'package:flutter/material.dart';
import '../widgets/bottom_navigation.dart';

class FavouritesPage extends StatefulWidget {
  @override
  _FavouritesPageState createState() => _FavouritesPageState();
}

class _FavouritesPageState extends State<FavouritesPage> {

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      bottomNavigationBar: BottomNavigation(),
      body:SingleChildScrollView(
        child:Stack(
          children: <Widget>[
            Container(
                height: size.height * .35,
                decoration: BoxDecoration(
                    color: Color(0xff72c3f9),
                    image: DecorationImage(
                        alignment: Alignment.centerLeft,
                        image: AssetImage('images/coverbk.png')))),
            SafeArea(
              child: Container(
                child:Text('Your Favourite exercises go here')
              ),
            )

          ],
        )
      )
    );
  }
}

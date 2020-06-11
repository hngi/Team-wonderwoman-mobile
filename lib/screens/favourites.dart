import 'package:flutter/material.dart';
import '../widgets/bottom_navigation.dart';
import 'package:ifitness/widgets/destination.dart';

class FavouritesPage extends StatefulWidget {
  const FavouritesPage({ Key key, this.destination }) : super(key: key);

  final Destination destination;
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
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 45.0, left: 16),
                    child: Text('Favourites',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontFamily: 'Work Sans/WorkSans-Bold',
                        fontSize: 30.0,
                        color: Color(0xff2d438d),
                      ),),
                  ),
                ],
              ),
            )

          ],
        )
      )
    );
  }
}

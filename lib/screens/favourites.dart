import 'package:flutter/cupertino.dart';
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 45.0,left: 16.0),
                    child: Text('Favourites',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontFamily: 'Work Sans/WorkSans-Bold',
                        fontSize: 30.0,
                        color: Color(0xff2d438d),
                      ),),
                  ),
                  SizedBox(height: 180.0,),
                  Padding(
                    padding: const EdgeInsets.only(bottom:68.0,left:16.0),
                    child: Text('Your favourite Icons go here',
                    textAlign: TextAlign.center,
                    style:TextStyle(
                      fontSize: 36.0,
                      fontFamily: 'Work Sans/WorkSans-Regular',
                      fontWeight: FontWeight.w900,
                      color:Color(0xff2d438d)
                    )),
                  )
                ],
              ),
            )

          ],
        )
      )
    );
  }
}

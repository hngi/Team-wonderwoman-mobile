// This is the main page. It will contain the exercise that the users could work on.
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ifitness/widgets/bottom_navigation.dart';
import 'package:ifitness/widgets/category_card.dart';
import '../widgets/brandName.dart';
import 'details.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context)
    .size; // this will give us the total height and width of our device.
    print(size);
    return Scaffold(

      bottomNavigationBar: BottomNavigation(),
      body: Stack(
        children: <Widget>[
          Container(
            // the height of this container is 45% total of the height.
            height: size.height * .45,
            decoration: BoxDecoration(
              color:Color(0xff72c3f9),
              image:DecorationImage(
                alignment: Alignment.centerLeft,
                image:AssetImage('images/coverbk.png')
              )
            ),
          ),

          SafeArea(
              child:Padding(
                  padding: EdgeInsets.symmetric(horizontal:20.0,),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height:45.0),
                        Text('Good Evening, \nUser',
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontFamily: 'Work Sans/WorkSans-Bold',
                          fontSize: 30.0,
                          color: Color(0xff2d438d),

                        ),),
                        SizedBox(height:80.0),
                        Expanded(
                            child: GridView.count(
                              crossAxisCount: 2,
                              childAspectRatio: .85,
                              crossAxisSpacing: 20,
                              mainAxisSpacing: 20,
//                              scrollDirection: Axis.vertical,
                              children: <Widget>[
                                ExerciseCategory(
                                  title: "Running",
                                  svgSrc: "images/running.svg",
                                  press: () {},
                                ),
                                ExerciseCategory(
                                  title: "Yoga",
                                  svgSrc: "images/yoga.svg",
                                  press: () {},
                                ),
                                ExerciseCategory(
                                  title: "Pilates",
                                  svgSrc: "images/pilates.svg",
                                  press: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) {
                                        return DetailsScreen();
                                      }),
                                    );
                                  },
                                ),
                                ExerciseCategory(
                                  title: "Sit Ups",
                                  svgSrc: "images/situps.svg",
                                  press: () {},
                                ),
                              ],
                            ))
                      ],
              ),))
        ],
      )


    );
  }
}

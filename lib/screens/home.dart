// This is the main page. It will contain the exercise that the users could work on.
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ifitness/widgets/bottom_navigation.dart';
import 'package:ifitness/widgets/category_card.dart';
import 'package:ifitness/userData.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ifitness/widgets/destination.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key key, this.destination }) : super(key: key);

  final Destination destination;
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  SharedPreferencesHelper object=new SharedPreferencesHelper();
  String _name="";

  @override void initState() {
    // SharedPreferences pref;
    SharedPreferences.getInstance().then((prefs){
      // pref = prefs;

      object.getUserName(prefs).then((value){
      setState((){
        _name = value;
      });
    });
    });


    super.initState();
  }
  @override
   Widget build(BuildContext context) {

    var size=MediaQuery.of(context)
    .size; // this will give us the total height and width of our device.
    String greetingTime=greeting();

    return Scaffold(
        bottomNavigationBar: BottomNavigation(),
        body: Stack(
          children: <Widget>[
            Container(
              // the height of this container is 45% total of the height.
              height: size.height * .45,
              decoration: BoxDecoration(
                  color: Color(0xff72c3f9),
                  image: DecorationImage(
                      alignment: Alignment.centerLeft,
                      image: AssetImage('images/coverbk.png'))),
            ),
            SafeArea(
              child:Padding(
                  padding: EdgeInsets.symmetric(horizontal:20.0,),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height:45.0),
                        Text('$greetingTime, $_name',
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontFamily: 'Work Sans/WorkSans-Bold',
                          fontSize: 30.0,
                          color: Color(0xff2d438d),

                        ),),
                        SizedBox(height: 20.0),
                        Center(
                          child: Text('What would you like to do today?',
                          style: TextStyle(
                            fontFamily: 'Work Sans/WorkSans-Regular',
                            fontSize: 18.0,
                            color: Color(0xff2d438d),
                          ),),
                        ),
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
                                  time:"30-45 mins",

                                ),
                                ExerciseCategory(
                                  title: "Yoga",
                                  svgSrc: "images/yoga.svg",
                                  time: "30-45 mins",


                                ),
                                ExerciseCategory(
                                  title: "Pilates",
                                  svgSrc: "images/pilates.svg",
                                  time:"25-40 mins",

                                ),
                                ExerciseCategory(
                                  title: "Sit Ups",
                                  svgSrc: "images/situps.svg",
                                  time: "20 mins",


                                ),

                                ExerciseCategory(
                                  title: "Push Ups",
                                  svgSrc: "images/pushup.svg",
                                  time:"15-20 mins",

                                ),
                                ExerciseCategory(
                                  title: "Squats",
                                  svgSrc: "images/squats.svg",
                                  time:"7-15 mins",


                                ),
                                ExerciseCategory(
                                  title: "Aerobics",
                                  svgSrc: "images/workout.svg",
                                  time:"12 mins",

                                ),
                                ExerciseCategory(
                                  title: "Stretches",
                                  svgSrc: "images/stretches.svg",
                                  time:"3-7 mins",


                                ),
                              ],
                            ))
                      ],
              ),)),
        ],
      )


    );


  }
  //Updates the preferred name of user
  void updateName(String value){
    setState(() {
      this._name=value;
    });
  }

  // Looks at the time of the day and shows a particular greeting
  String greeting(){
    var now = new DateTime.now();
    var currentTime=now.hour;
    if(currentTime < 12){
      return 'Good Morning';
    }
    else if (currentTime > 12 && currentTime < 17){
      return 'Good Afternoon';
    }
    else{
      return 'Good Evening';
    }
  }
}

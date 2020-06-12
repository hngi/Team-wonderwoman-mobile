
// This page will contain the welcome screen for the user.
// The page contains a brief description of what the exercise app is all abou
import 'package:flutter/material.dart';
//import 'package:ifitness/widgets/brandName.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "iFitness App",
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          primaryColor: Colors.blue,
          //fontWeight: FontWeight.w100,
          fontFamily: 'Work Sans'
      ),
      home: WelcomeScreen(),
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/personal-trainers-01.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Expanded(
            child: Column(
              children: <Widget>[
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "iFitness",
                        style: Theme
                            .of(context)
                            .textTheme
                            .headline1,
                      ),
                      TextSpan(
                        text: "Welcome to iFitness, your exercise app for better results",
                        style: Theme
                            .of(context)
                            .textTheme
                            .bodyText1,
                      ),
                    ],
                  ),
                ),
                FittedBox(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 30,
                          vertical: 20
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.blue
                      ),
                      child: Row(
                        children: <Widget>[
                          Text(
                              "Get Started",
                              style: Theme.of(context).textTheme.button.copyWith(
                                  color: Colors.white
                              )
                          ),
                        ],
                      ),
                    )
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

//// This page will contain the welcome screen for the user.
//// The page contains a brief description of what the exercise app is all about.
//
//import 'package:flutter/cupertino.dart';
//import 'package:flutter/material.dart';
//import 'package:ifitness/screens/details.dart';
//import 'package:ifitness/widgets/brandName.dart';
//
//class WelcomeScreen extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    String message= 'Welcome to IFitness,Your Daily Exercise Timer.\n\nLET US GET YOU INTO SHAPE';
//    return Scaffold(
//      backgroundColor: Colors.white,
//      body: SafeArea(
//        child: Column(
//          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//          children: <Widget>[
//            brandName(),
//            Padding(
//              padding: const EdgeInsets.all(10.0),
//              child: Text(message
//             ,textAlign: TextAlign.center,
//                style: TextStyle(
//                  fontFamily: 'Work Sans/WorkSans-ExtraLight',
//                  fontSize: 30.0,
//
//                ),
//              ),
//            ),
//
//            MaterialButton(
//               elevation: 8.0,
//                child: Text('TAP TO GET STARTED',
//                  style:TextStyle(
//                  color: Colors.white,
//                  fontFamily: 'Work Sans/WorkSans-Regular'
//              )),
//                color: Color(0xff2d438d),
//                shape: RoundedRectangleBorder(
//                    borderRadius: BorderRadius.all(Radius.circular(20))
//                ),
//                onPressed: (){
//                  Navigator.push(context,
//                  MaterialPageRoute(builder: (context){
//                    return new UserDetails();
//                  }));
//                })
//
//          ],
//        ),
//      ),
//    );
//  }
//}


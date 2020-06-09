import 'package:flutter/material.dart';
import 'package:ifitness/widgets/brandName.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'iFitness',
      home:Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Center(
            child: Text('iFitness App',
              style: TextStyle(color: Colors.white,
                  fontSize: 25.0,
                  fontFamily: 'Work Sans'),
            ),
          ),
        ),
        body:brandName()
      )

    );
  }
}


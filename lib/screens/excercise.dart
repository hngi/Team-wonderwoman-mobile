// Shows a single exercise and a time countdown


import 'package:flutter/material.dart';
import 'package:ifitness/widgets/exercise_card.dart';


class SingleExercise extends StatelessWidget {
  SingleExercise({@required this.title,
    @required this.svgSrc,@required this.time});
  final title, svgSrc, time;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff72c3f9),
      appBar: AppBar(
      elevation: 0.0,
      backgroundColor: Colors.transparent
),
//      bottomNavigationBar: BottomNavigation(),
      body: SafeArea(
        child: ExerciseCard(title:title ,svgSrc:svgSrc ,time:time,),
      ),

    );
  }
}


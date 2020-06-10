import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../screens/excercise.dart';
import '../screens/excercise.dart';
import '../screens/excercise.dart';

//This class contains the cards that will be displayed on the home page of the app.
class ExerciseCategory extends StatefulWidget {
  final String svgSrc;
  final String title;
  final String time;


  ExerciseCategory({
    @required this.svgSrc,@required this.title,@required this.time

});

  @override
  _ExerciseCategoryState createState() => _ExerciseCategoryState();
}

class _ExerciseCategoryState extends State<ExerciseCategory> {


  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius:BorderRadius.circular(13.0),
        child: Container(
          decoration: BoxDecoration(
          color:Colors.white,
          borderRadius: BorderRadius.circular(13.0),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 17),
              blurRadius: 17,
              spreadRadius: -23,
              color: Color(0xffE6E6E6),
            ),
          ]
        ),
      // The material widget will enables the individual cards to be tapped on.
        child:Material(
          color:Colors.transparent,
          child: InkWell(
            onTap: (){

            },
            onDoubleTap: (){

            },
            child: Padding(
                padding: EdgeInsets.all(20.0),
              child: Column(
                children: <Widget>[
                  Align(
                    alignment: Alignment.topRight,
                    child:IconButton(
                        icon:Icon(Icons.favorite_border),
                        onPressed:(){
                          Navigator.push(context, MaterialPageRoute(builder:(context){
                             return SingleExercise(
                                 title: '${widget.title}',
                                 svgSrc:'${widget.svgSrc}',
                                 time:'${widget.time}');
                          }));
                        },
                    )
                  ),
                  Spacer(), // creates space between the children of the column widget
                  Expanded(child: SvgPicture.asset('${widget.svgSrc}')),
                  Spacer(),
                  Text(
                    '${widget.title}',
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        .copyWith(fontSize: 14.0),),

                ],
              ),
            ),
          ),
        ),
      ),

    );
  }
}


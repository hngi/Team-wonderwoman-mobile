import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:timer_count_down/timer_count_down.dart';

class ExerciseCard extends StatefulWidget {
  ExerciseCard(
      {@required this.title, @required this.svgSrc, @required this.time});
  final title, svgSrc, time;

  @override
  _ExerciseCardState createState() => _ExerciseCardState();
}

class _ExerciseCardState extends State<ExerciseCard> {
  final CountdownController controller = CountdownController();

  bool isPause = false;
  dynamic countTime;

  @override
  Widget build(BuildContext context) {
    countTime = widget.time;
    var size = MediaQuery.of(context)
        .size; // this will give us the total height and width of our device.
    return Stack(children: <Widget>[
      Container(
        height: size.height * .45,
        decoration: BoxDecoration(
          color: Color(0xff72c3f9),
        ),
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Text(
              widget.title,
              style: TextStyle(
                fontSize: 48.0,
                fontWeight: FontWeight.w900,
                fontFamily: 'Work sans/WorkSans-Bold',
                color: Color(0xff2d438d),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Align(
              alignment: Alignment.bottomRight,
                          child: Text('15 mins'
              ,style: TextStyle(
                      fontFamily: 'Work Sans/WorkSans-Bold',
                      fontSize: 18.0,
                      fontWeight: FontWeight.w900,
                      color: Color(0xff2d438d)),),
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              child: Center(
                
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SvgPicture.asset(widget.svgSrc, height: size.height * .15),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Countdown(
            controller: controller,
            seconds: 900,
            interval: Duration(milliseconds: 100),
            build: (_, times) => Text(
              times.toString(),
              style: TextStyle(
                  fontFamily: 'Work Sans/WorkSans-Bold',
                  fontSize: 30.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
            ),
            onFinished: () {
              setState(() {
                countTime = widget.time;
              });
            },
          ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          if (isPause == true) {
                            controller.resume();
                            setState(() {
                              isPause = false;
                            });
                          } else if (isPause == false) {
                            controller.pause();
                            setState(() {
                              isPause = true;
                            });
                          }
                        },
                        child: Container(
                          height: 35,
                          width: 90,
                          decoration: BoxDecoration(
                              color: Color(0xff2d438d),
                              borderRadius: BorderRadius.circular(30)),
                          child: Center(
                              child: Icon(
                                  isPause == true
                                      ? Icons.play_arrow
                                      : Icons.pause,
                                  color: Colors.white)),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    ]);
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Widget brandName(){
  return Row (
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment:MainAxisAlignment.center ,
    children: <Widget>[
       Expanded(
         child: SvgPicture.asset('images/dumbbell.svg',
           color: Color(0xffF982C6),
           height: 30.0,
           width: 30.0,
           ),
       ),
       Text('iFitness',
        style: TextStyle(
        color: Colors.black87,
        fontFamily: 'Pacifico',
        fontSize: 20.0
  ),)],
  );

}
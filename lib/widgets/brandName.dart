import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Widget brandName() {
  return Padding(
    padding: const EdgeInsets.only(right: 60.0,left: 60.0),
    child: Card(
      elevation:0.0,
      child: Center(
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 2.0),
          leading: Expanded(
              child: SvgPicture.asset('images/dumbbell.svg',
                color: Color(0xffF982C6),
                height: 30.0,
                width: 30.0,)),
          title: Text('iFitness',
            style: TextStyle(
                color: Colors.black87,
                fontFamily: 'Pacifico',
                fontSize: 20.0
            ),),
        ),
      ),
    ),
  );
}


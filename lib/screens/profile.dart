import 'package:flutter/material.dart';
import 'package:ifitness/widgets/bottom_navigation.dart';
import 'package:ifitness/userData.dart';
import 'dart:math';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ifitness/widgets/destination.dart';


class ProfileScreen extends StatefulWidget {
  const ProfileScreen({ Key key, this.destination }) : super(key: key);

  final Destination destination;
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool enable = false;
  String edit = 'EDIT';

  SharedPreferencesHelper object=new SharedPreferencesHelper();
  String _userName='';
  String _userWeight='';
  String _userHeight='';


  @override void initState() {
    //SharedPreferences pref;
    SharedPreferences.getInstance().then((prefs){
      //pref = prefs;

      object.getUserName(prefs).then(updateName);
    object.getUserWeight(prefs).then(updateWeight);
    object.getUserHeight(prefs).then(updateHeight);
    });


    super.initState();
  }

  @override
  Widget build(BuildContext context) {

  String bmi=bodyMassIndex(_userWeight, _userHeight).toString();

    var size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: BottomNavigation(),
      body: SingleChildScrollView(
        child: Stack(
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
                    padding: const EdgeInsets.only(top: 45.0, left: 16),
                    child: Text(
                      'Profile',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontFamily: 'Work Sans/WorkSans-Bold',
                        fontSize: 30.0,
                        color: Color(0xff2d438d),
                      ),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 40.0,
                      ),
                      child: CircleAvatar(
                        radius: 75,
                        backgroundImage: AssetImage(
                            'images/hng.jpg'),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          if (enable == false) {
                            edit = 'DONE';
                            enable = true;
                          } else if (enable == true) {
                            edit = 'EDIT';
                            enable = false;
                          }
                        });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Icon(
                            Icons.edit,
                            color: Color(0xFF2D438D),
                          ),
                          Text(edit,
                              style: TextStyle(
                                  color: Color(0xFF2D438D),
                                  fontWeight: FontWeight.bold))
                        ],
                      ),
                    ),
                  ),
                  ProfileField(
                    fieldName: 'Name',
                    fieldInput: _userName,
                    enable: enable,
                    keyboard: TextInputType.text,
                  ),
                  ProfileField(
                    fieldName: 'Weight',
                    fieldInput: _userWeight,
                    enable: enable,
                    keyboard: TextInputType.number,
                  ),
                  ProfileField(
                    fieldName: 'Height',
                    fieldInput: _userHeight,
                    enable: enable,
                    keyboard: TextInputType.number,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color(0xFF2D438D),
                      ),
                      height: 120,
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 16, horizontal: 24),
                            child: Text(
                              'Your BMI is :',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontFamily: 'Work Sans/static/WorkSans-Regular',
                              ),
                            ),
                          ),
                          Center(
                            child: Text(
                              bmi,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.w900,
                                fontFamily: 'Work Sans/static/WorkSans-Regular',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }



  void updateName(String name){
    setState(() {
      this._userName=name;
    });
  }

   void updateWeight(String weight){
    setState(() {
      this._userWeight=weight;
    });
  }

   void updateHeight(String height){
    setState(() {
      this._userHeight=height;
      
    });
  }

}

//Function to calculate body mass Index

int bodyMassIndex(String weight, String height){
  var newWeight=int.parse(weight);
  var newHeight=double.parse(height);
  

  int heightSquared=pow(newHeight,2);
  double result=newWeight/heightSquared;

  return result.round();

}



class ProfileField extends StatelessWidget {
  final String fieldName;
  final String fieldInput;
  final bool enable;
  final TextInputType keyboard;

  ProfileField({this.fieldName, this.fieldInput, this.enable, this.keyboard});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            fieldName,
            style: TextStyle(
              fontSize: 13,
              fontFamily: 'Work Sans/static/WorkSans-Regular',
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 40,
            child: Center(
              child: TextField(
                keyboardType: keyboard,
                enabled: enable,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[200],
                    hintText: fieldInput,
                    border: OutlineInputBorder().copyWith(
                        borderRadius: BorderRadius.circular(40),
                        borderSide: BorderSide.none),
                    contentPadding: EdgeInsets.only(top: 10, left: 20)),
              ),
            ),
          )
        ],
      ),
    );
  }
}

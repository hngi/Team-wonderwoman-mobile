import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:ifitness/screens/home.dart';
import 'package:ifitness/userData.dart';
import 'package:ifitness/widgets/brandName.dart';


class UserDetails extends StatelessWidget {
  final nameTextController = new TextEditingController();
  final heightTextController = new TextEditingController();
  final weightTextController = new TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var fontSytle = const TextStyle(
        fontFamily: 'Work Sans/WorkSans-Regular',
        fontSize: 14.0);
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: <Widget>[
              brandName(),
              Text(
                'Please fill in the details to get started',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Work Sans/WorkSans-Bold',
                  fontWeight: FontWeight.w900,
                  fontSize: 20.0
                ),
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    Text('What do we call you?',
                    style: fontSytle,),
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 20),
                        child: TextFormField(
                          controller: nameTextController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'you must enter your name';
                            }
                            return null;
                          },
                        )),
                    Text('How much do you weigh in Kgs?',
                    style: fontSytle,),
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 20),
                        child: TextFormField(
                          keyboardType: TextInputType.numberWithOptions(),
                          controller: weightTextController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'e.g 45'
                          ),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'you must enter your weight in Kgs';
                            }
                            return null;
                          },
                        )),
                    Text('How tall are you in Centimeters?',
                    style:fontSytle),
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 20),
                        child: TextFormField(
                          keyboardType: TextInputType.numberWithOptions(),
                          controller: heightTextController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'e.g 165',
                          ),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'The height field cannot be empty';
                            }
                            return null;
                          },
                        )),
                    MaterialButton(
                      elevation: 8.0,
                        child: Text("TAP TO CONTINUE",
                            style:TextStyle(
                                color: Colors.white,
                                fontFamily: 'Work Sans/WorkSans-Regular'
                            )),
                        color: Color(0xff2d438d),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                        onPressed: () async {
                          await saveCredentials();
                          _formKey.currentState.reset();
                           Navigator.push(context, MaterialPageRoute(builder: (context){
                             return HomePage();
                           })); //the next page after user feeds in necessary credentials
                        })
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

   saveCredentials() {
    SharedPreferencesHelper object=new SharedPreferencesHelper();
    FormState formState = _formKey.currentState;
    if (formState.validate()) {

     String name=nameTextController.text;
     String weight=weightTextController.text;
     String height=heightTextController.text;
     // save the details
     object.saveUserName(name);
     object.saveUserHeight(height);
     object.saveUserWeight(weight);
    }
  }
}
 

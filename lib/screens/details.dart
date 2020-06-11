import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:ifitness/screens/home.dart';
import 'package:ifitness/userData.dart';
import 'package:ifitness/widgets/brandName.dart';


class UserDetails extends StatefulWidget {
  @override
  _UserDetailsState createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  final nameTextController =  TextEditingController();
  final heightTextController = TextEditingController();
  final weightTextController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override 
  void dispose(){
    nameTextController.dispose();
    heightTextController.dispose();
    weightTextController.dispose();
    super.dispose();

  }
  @override
  Widget build(BuildContext context) {
    var fontSytle = const TextStyle(
        fontFamily: 'Work Sans/WorkSans-Regular',
        fontSize: 14.0);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: <Widget>[
              SizedBox(height: 15.0),
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
              SizedBox(height:12.0),
              Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    Text('What do we call you?',
                    style: fontSytle,),
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 20),
                        child: TextFormField(
                          keyboardType: TextInputType.text,
                          controller: nameTextController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder().copyWith(
                        borderRadius: BorderRadius.circular(40),
                        borderSide: BorderSide.none),
                            hintText: 'John Doe'
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
                          keyboardType: TextInputType.number,
                          controller: weightTextController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder().copyWith(
                        borderRadius: BorderRadius.circular(40),
                        borderSide: BorderSide.none),
                            hintText: 'e.g 45'
                          ),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'you must enter your weight in Kgs';
                            }
                            return null;
                          },
                        )),
                    Text('How tall are you in Meters?',
                    style:fontSytle),
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 20),
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          controller: heightTextController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder().copyWith(
                             borderRadius: BorderRadius.circular(40),
                             borderSide: BorderSide.none),
                            hintText: 'e.g 1.65',
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
                          //the next page after user feeds in necessary credentials
                           Navigator.push(context, MaterialPageRoute(builder: (context){
                             return HomePage();  
                           }));
                          
                            
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
    // FormState formState = _formKey.currentState;
    if (_formKey.currentState.validate()) {
     // save the details
     object.saveUserName(nameTextController.text);
     object.saveUserHeight(heightTextController.text);
     object.saveUserWeight(weightTextController.text);
    }
  }
}
 

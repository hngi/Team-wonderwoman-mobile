import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:ifitness/screens/home.dart';
import 'package:ifitness/userData.dart';


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
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Container(
                height: 100,
                child: Image.asset('name'),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Please fill in the details to get started',
                textAlign: TextAlign.center,
                style: fontSytle,
              ),
              Text('What do we call you?',
              style: fontSytle,),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 20),
                  child: TextFormField(
                    controller: nameTextController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
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
                      border: InputBorder.none,
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
                      border: InputBorder.none,
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'The height field cannot be empty';
                      }
                      return null;
                    },
                  )),
              MaterialButton(
                  child: Text("TAP TO CONTINUE"),
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
      ),
    );
  }

   saveCredentials() {
    SharedPreferencesHelper object;
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
 

import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';
import 'package:ifitness/database.dart';




class UserDetails extends StatelessWidget {
  final nameTextController = new TextEditingController();
  final heightTextController = new TextEditingController();
  final weightTextController = new TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final usersManager = UsersManager();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
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
              ),
              Text('What do we call you?'),
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
              Text('How much do you weigh?'),
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
              Text('How tall are you?'),
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
                  color: Colors.indigo,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                  onPressed: () async {
                    await saveCredentials();
                    _formKey.currentState.reset();
                    // Navigator.push(context, MaterialPageRoute(builder: (_)=> )); //the next page after user feeds in necessary credentials
                  })
            ],
          ),
        ),
      ),
    );
  }

   saveCredentials() {
    FormState formState = _formKey.currentState;
    if (formState.validate()) {
      USER user = new USER(name: nameTextController.text, weight: weightTextController.text, height: heightTextController.text);
      usersManager.insertUsers(user).then((user)=>print('$user has been added'));
    }
  }
}
 



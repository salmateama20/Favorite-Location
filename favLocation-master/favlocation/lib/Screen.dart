import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:favlocation/LocationDetails.dart';
import 'package:favlocation/LocationCreator.dart';
import 'package:flutter/material.dart';

final _formKey_1 = GlobalKey<FormState>();
final _formKey_2 = GlobalKey<FormState>();
CollectionReference _location =
    FirebaseFirestore.instance.collection('Locations');
var _user_login;
var _password_login;
var _user_signup;
var _password_signup;
var _password_temp;
var _temp_var;

class Login extends StatefulWidget {
  @override
  LoginForm createState() {
    return LoginForm();
  }
}

class LoginForm extends State<Login> {
  get child => null;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey_1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please Enter Your Email';
                }
                _user_login = value;
                return null;
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12.0)),
                ),
                hintText: 'Email',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please Enter Your Password';
                }
                return null;
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12.0)),
                ),
                hintText: 'Password',
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: ElevatedButton(
                child: Icon(Icons.login_rounded),
                onPressed: () => {
                  if (_formKey_1.currentState.validate())
                    {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => MyScreen())),
                    }
                },
              ),
            ),
          ),
          Center(
            child: TextButton(
              child: Text(
                "Don't have account, sign up!",
                style: TextStyle(color: Colors.lightBlue.withOpacity(1.0)),
              ),
              style: TextButton.styleFrom(
                primary: Color.fromRGBO(255, 255, 255, 1.0),
              ),
              onPressed: () => {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SignUpPage())),
              },
            ),
          ),
        ],
      ),
    );
  }
}

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up!"),
      ),
      body: SignUp(),
    );
  }
}

class SignUp extends StatefulWidget {
  @override
  SignUpForm createState() {
    return SignUpForm();
  }
}

class SignUpForm extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey_2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please Enter A Email';
                }
                _user_signup = value;
                _user_login = value;
                return null;
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12.0)),
                ),
                hintText: 'Email',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please Enter A Password';
                }
                _password_signup = value;
                return null;
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12.0)),
                ),
                hintText: 'Password',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: TextFormField(
              validator: (value) {
                if ((value == null || value.isEmpty)) {
                  return 'Please Enter The Password Again';
                }

                _password_temp = value;

                if (_password_signup.toString() != _password_temp.toString()) {
                  return 'Mismatch Make Sure That Pasword Is Correct';
                }
                return null;
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12.0)),
                ),
                hintText: 'Confirm Password',
              ),
            ),
          ),
          Center(
            child: ElevatedButton(
              child: Text("Register"),
              onPressed: () => {
                if (_formKey_2.currentState.validate())
                  {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MyScreen())),
                  }
              },
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: TextButton(
                child: Text(
                  "Already Have An Account, Login In!",
                  style: TextStyle(color: Colors.lightBlue.withOpacity(1.0)),
                ),
                style: TextButton.styleFrom(
                  primary: Color.fromRGBO(255, 255, 255, 1.0),
                ),
                onPressed: () => {
                  Navigator.pop(context),
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MyScreen extends StatefulWidget {
  @override
  Screen createState() {
    return Screen();
  }
}

class Screen extends State<MyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fav Location"),
      ),
      body: StreamBuilder(
        stream: _location.snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView(
            children: <Widget>[
              Column(
                children: snapshot.data.docs.map((result) {
                  return Container(
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 3.0, horizontal: 3.0),
                          child: ElevatedButton(
                            onPressed: () => {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          LocationDetails(result))),
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Color.fromRGBO(184, 212, 225, 1.0),
                            ),
                            child: Column(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 6.0, horizontal: 6.0),
                                  child: Image.network(
                                      result.get('imageUrl').toString()),
                                ),
                                Center(
                                    child: Text(result.get('name').toString())),
                                Center(
                                    child:
                                        Text(result.get('theme').toString())),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_circle),
        onPressed: () => {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => LocationCreator())),
        },
      ),
    );
  }
}

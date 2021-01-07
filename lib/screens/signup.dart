import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:globe_ui/Themes/colors.dart';
import '../Resources/images.dart';
import 'package:globe_ui/providers/state_provider.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  //created a formkey to save the state of the form

  final _formkey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  String _username = '';
  String _email = '';
  String _password = '';
  BuildContext ctx;

  // firebase instance

  final auth = FirebaseAuth.instance;

  //submit function is in async inorder to store the values in db

  void _trySubmit() async {
    final isValid = _formkey.currentState.validate();

    //to close keyboard after the user types in

    FocusScope.of(context).unfocus();

    try {
      AuthResult authResult;

      if (isValid) {
        _formkey.currentState.save();

        authResult = await auth.createUserWithEmailAndPassword(
            email: _email, password: _password);

        //to store values in firestore

        await Firestore.instance
            .collection('users')
            .document(authResult.user.uid)
            .setData({'username': _username, 'email': _email});

        //To navigate user to login page

        Navigator.pushNamed(context, '/login');
      }
    } on PlatformException catch (err) {
      var message = '';
      if (err.message != null) {
        message = err.message;
      }
      _scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text(message),
        backgroundColor: AppColors.COLOR_BLACK,
      ));
    } catch (err) {
      print(err);
    }

    print('sign -up email: $_email password: $_password: username: $_username');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Color(0xFF3b41e2),
      body: ListView(scrollDirection: Axis.vertical, children: [
        Container(
          margin: const EdgeInsets.fromLTRB(77, 80, 77, 80),
          child: Form(
              key: _formkey,
              child: Column(
                children: [
                  Image.asset(
                    Images.GLOBE,
                    width: 200.0,
                    height: 50.0,
                  ),
                  SizedBox(
                    height: 61.0,
                  ),
                  TextFormField(
                    key: ValueKey('username'),
                    validator: (input) {
                      if (input.length < 4 || input.isEmpty) {
                        return 'invalid username , should contain atleast 4 characters !';
                      }
                      return null;
                    },
                    onSaved: (input) {
                      _username = input;
                    },
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10.0),
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        fillColor: Color(0xFF0056bf),
                        filled: true,
                        labelText: 'Username',
                        labelStyle: TextStyle(
                            color: AppColors.COLOR_WHITE,
                            fontSize: 16.0,
                            letterSpacing: 2.5,
                            fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(
                    height: 24.0,
                  ),
                  TextFormField(
                    key: ValueKey('email'),
                    validator: (input) {
                      if (input.isEmpty || !input.contains('@')) {
                        return 'invalid email';
                      }
                      return null;
                    },
                    onSaved: (input) {
                      _email = input;
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xFF0056bf),
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10.0),
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        labelText: 'Email',
                        labelStyle: TextStyle(
                            color: AppColors.COLOR_WHITE,
                            fontSize: 16.0,
                            letterSpacing: 2.5,
                            fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(
                    height: 24.0,
                  ),
                  TextFormField(
                    key: ValueKey('password'),
                    obscureText: true,
                    validator: (input) {
                      if (input.length < 7) {
                        return 'password should have atleast 4 characters';
                      }
                      return null;
                    },
                    onSaved: (input) {
                      _password = input;
                    },
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xFF0056bf),
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10.0),
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        labelText: 'Password',
                        labelStyle: TextStyle(
                            color: AppColors.COLOR_WHITE,
                            fontSize: 16.0,
                            letterSpacing: 2.5,
                            fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(
                    height: 24.0,
                  ),
                  RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0)),
                      child: Text(
                        'sign up',
                        style: TextStyle(
                            color: AppColors.COLOR_WHITE,
                            fontSize: 16.0,
                            letterSpacing: 2.5,
                            fontWeight: FontWeight.bold),
                      ),
                      onPressed: () => _trySubmit()),
                  SizedBox(
                    height: 24.0,
                  ),
                  FlatButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/login');
                    },
                    child: Text(
                      'Already a user ?',
                      style: TextStyle(
                          color: AppColors.COLOR_WHITE,
                          fontSize: 16.0,
                          // letterSpacing: 2.5,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              )),
        ),
      ]),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:globe_ui/Themes/colors.dart';
import '../Resources/images.dart';
import 'package:globe_ui/providers/state_provider.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:globe_ui/core/services/login_submit.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formkey = GlobalKey<FormState>();
  final _scaffoldkey = GlobalKey<ScaffoldState>();

  String _email = '';
  String _password = '';

  _trySubmit() async {
    final auth = FirebaseAuth.instance;

    AuthResult authResult;

    final isValid = _formkey.currentState.validate();

    final stateprovider = Provider.of<StateProvider>(context, listen: false);
    // myModel.callUser();

    FocusScope.of(context).unfocus();

    try {
      if (isValid) {
        _formkey.currentState.save();

        authResult = await auth.signInWithEmailAndPassword(
            email: _email, password: _password);
        print('login email: $_email password: $_password');
        print('user id: ${authResult.user.uid}');

        Firestore.instance.collection('users').snapshots().listen((data) {
          print('data: $data');
          data.documents.forEach((document) {
            print('documents: ${document.documentID}');
            if (document.documentID == authResult.user.uid) {
              stateprovider.currentUser(document['username']);
              print('current user: ${document['username']}');
            }
          });
        });

        Navigator.pushNamed(context, '/home');
      }
    } on PlatformException catch (err) {
      var message = '';
      if (err.message != null) {
        message = err.message;
      }

      print('login: $err');
      _scaffoldkey.currentState.showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: AppColors.COLOR_BLACK,
        ),
      );
    } catch (err) {
      print('ex: $err');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldkey,
      backgroundColor: Color(0xFF3b41e2),
      body: ListView(scrollDirection: Axis.vertical, children: [
        Container(
          // padding: const EdgeInsets.fromLTRB(left, top, right, bottom),
          margin: const EdgeInsets.fromLTRB(77, 80, 77, 80),
          child: Form(
              key: _formkey,
              child: Column(
                // scrollDirection: Axis.vertical,
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
                        'Login',
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
                      Navigator.pushNamed(context, '/sign-up');
                    },
                    child: Text(
                      'Create an account ?',
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

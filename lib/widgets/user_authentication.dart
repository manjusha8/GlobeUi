import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:globe_ui/Themes/colors.dart';
import 'auth_form.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:globe_ui/providers/state_provider.dart';
import 'package:provider/provider.dart';

class UserAuthentication extends StatefulWidget {
  @override
  _UserAuthentication createState() => _UserAuthentication();
}

class _UserAuthentication extends State<UserAuthentication> {
  final auth = FirebaseAuth.instance;
  bool isLoading = false;
  void _submitForm(String username, String email, String password,
      bool isNewuser, BuildContext ctx) async {
    AuthResult authResult;
    try {
      // setState(() {
      //   isLoading = true;
      // });
      if (isNewuser) {
        authResult = await auth.createUserWithEmailAndPassword(
            email: email, password: password);
        print(
            'sign -up email: $email password: $password: username: $username');
        await Firestore.instance
            .collection('users')
            .document(authResult.user.uid)
            .setData({'username': username, 'email': email});

        // setState(() {
        //   isLoading = false;
        // });
        Navigator.pushNamed(context, '/login');
      } else {
        print('login');
        print('login $email');
        print('login $password');

        authResult = await auth.signInWithEmailAndPassword(
            email: email, password: email);

        Timer(Duration(seconds: 2),
            () => {print('home...!'), Navigator.pushNamed(context, '/home')});
      }
    } on PlatformException catch (err) {
      var message = '';
      if (err.message != null) {
        message = err.message;
      }
      Scaffold.of(ctx).showSnackBar(SnackBar(
        content: Text(message),
        backgroundColor: AppColors.COLOR_BLACK,
      ));
      // setState(() {
      //   isLoading = false;
      // });
    } catch (err) {
      print(err);
      // setState(() {
      //   isLoading = false;
      // });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Color(0xFF3b41e2),
      // body: AuthForm(_submitForm, isLoading)));
    ));
  }
}

// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:provider/provider.dart';
// import 'package:globe_ui/providers/state_provider.dart';
// import 'package:globe_ui/themes/colors.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
//
// class LoginSubmit {
//   void _trySubmit() async {
//     final auth = FirebaseAuth.instance;
//
//     AuthResult authResult;
//
//     final isValid = _formkey.currentState.validate();
//
//     final stateprovider = Provider.of<StateProvider>(context, listen: false);
//     // myModel.callUser();
//
//     FocusScope.of(context).unfocus();
//
//     try {
//       if (isValid) {
//         _formkey.currentState.save();
//
//         authResult = await auth.signInWithEmailAndPassword(
//             email: _email, password: _password);
//         print('login email: $_email password: $_password');
//         print('user id: ${authResult.user.uid}');
//
//         Firestore.instance.collection('users').snapshots().listen((data) {
//           print('data: $data');
//           data.documents.forEach((document) {
//             print('documents: ${document.documentID}');
//             if (document.documentID == authResult.user.uid) {
//               stateprovider.currentUser(document['username']);
//               print('current user: ${document['username']}');
//             }
//           });
//         });
//
//         Navigator.pushNamed(context, '/home');
//       }
//     } on PlatformException catch (err) {
//       var message = '';
//       if (err.message != null) {
//         message = err.message;
//       }
//
//       print('login: $err');
//       _scaffoldkey.currentState.showSnackBar(
//         SnackBar(
//           content: Text(message),
//           backgroundColor: AppColors.COLOR_BLACK,
//         ),
//       );
//     } catch (err) {
//       print('ex: $err');
//     }
//   }
// }

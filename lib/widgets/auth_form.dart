// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:globe_ui/Themes/colors.dart';
// import '../Resources/images.dart';
// import 'package:globe_ui/providers/state_provider.dart';
// import 'package:provider/provider.dart';
//
// class AuthForm extends StatefulWidget {
//   AuthForm(this.submitFn, this.isLoading);
//
//   final bool isLoading;
//
//   final void Function(String username, String email, String password,
//       bool isNewuser, BuildContext ctx) submitFn;
//
//   @override
//   _AuthFormState createState() => _AuthFormState();
// }
//
// class _AuthFormState extends State<AuthForm> {
//   final _formkey = GlobalKey<FormState>();
//   String _username = '';
//   String _email = '';
//   String _password = '';
//
//   var _isNewuser = true;
//
//   _trySubmit() {
//     final isValid = _formkey.currentState.validate();
//
//     final myModel = Provider.of<StateProvider>(context, listen: false);
//     // myModel.callUser();
//     // print('provider: ${myModel.callUser('hey')}');
//
//     FocusScope.of(context).unfocus();
//
//     if (isValid) {
//       _formkey.currentState.save();
//       widget.submitFn(_username, _email, _password, _isNewuser, context);
//       // print(_username);
//       // print(_email);
//       // print(_password);
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return ListView(scrollDirection: Axis.vertical, children: [
//       Container(
//         // padding: const EdgeInsets.fromLTRB(left, top, right, bottom),
//         margin: const EdgeInsets.fromLTRB(77, 80, 77, 80),
//         child: Form(
//             key: _formkey,
//             child: Column(
//               // scrollDirection: Axis.vertical,
//               children: [
//                 Image.asset(
//                   Images.GLOBE,
//                   width: 200.0,
//                   height: 50.0,
//                 ),
//                 SizedBox(
//                   height: 61.0,
//                 ),
//                 if (_isNewuser)
//                   TextFormField(
//                     key: ValueKey('username'),
//                     validator: (input) {
//                       if (input.length < 4 || input.isEmpty) {
//                         return 'invalid username , should contain atleast 4 characters !';
//                       }
//                       return null;
//                     },
//                     onSaved: (input) {
//                       _username = input;
//                     },
//                     decoration: InputDecoration(
//                         contentPadding: const EdgeInsets.symmetric(
//                             horizontal: 20.0, vertical: 10.0),
//                         enabledBorder: InputBorder.none,
//                         focusedBorder: InputBorder.none,
//                         fillColor: Color(0xFF0056bf),
//                         filled: true,
//                         labelText: 'Username',
//                         labelStyle: TextStyle(
//                             color: AppColors.COLOR_WHITE,
//                             fontSize: 16.0,
//                             letterSpacing: 2.5,
//                             fontWeight: FontWeight.bold)),
//                   ),
//                 SizedBox(
//                   height: 24.0,
//                 ),
//                 TextFormField(
//                   key: ValueKey('email'),
//                   validator: (input) {
//                     if (input.isEmpty || !input.contains('@')) {
//                       return 'invalid email';
//                     }
//                     return null;
//                   },
//                   onSaved: (input) {
//                     _email = input;
//                   },
//                   keyboardType: TextInputType.emailAddress,
//                   decoration: InputDecoration(
//                       filled: true,
//                       fillColor: Color(0xFF0056bf),
//                       contentPadding: const EdgeInsets.symmetric(
//                           horizontal: 20.0, vertical: 10.0),
//                       enabledBorder: InputBorder.none,
//                       focusedBorder: InputBorder.none,
//                       labelText: 'Email',
//                       labelStyle: TextStyle(
//                           color: AppColors.COLOR_WHITE,
//                           fontSize: 16.0,
//                           letterSpacing: 2.5,
//                           fontWeight: FontWeight.bold)),
//                 ),
//                 SizedBox(
//                   height: 24.0,
//                 ),
//                 TextFormField(
//                   key: ValueKey('password'),
//                   obscureText: true,
//                   validator: (input) {
//                     if (input.length < 7) {
//                       return 'password should have atleast 4 characters';
//                     }
//                     return null;
//                   },
//                   onSaved: (input) {
//                     _password = input;
//                   },
//                   decoration: InputDecoration(
//                       filled: true,
//                       fillColor: Color(0xFF0056bf),
//                       contentPadding: const EdgeInsets.symmetric(
//                           horizontal: 20.0, vertical: 10.0),
//                       enabledBorder: InputBorder.none,
//                       focusedBorder: InputBorder.none,
//                       labelText: 'Password',
//                       labelStyle: TextStyle(
//                           color: AppColors.COLOR_WHITE,
//                           fontSize: 16.0,
//                           letterSpacing: 2.5,
//                           fontWeight: FontWeight.bold)),
//                 ),
//                 SizedBox(
//                   height: 24.0,
//                 ),
//                 if (widget.isLoading) CircularProgressIndicator(),
//                 if (!widget.isLoading)
//                   RaisedButton(
//                       shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(25.0)),
//                       child: Text(
//                         _isNewuser ? 'sign up' : 'Login',
//                         style: TextStyle(
//                             color: AppColors.COLOR_WHITE,
//                             fontSize: 16.0,
//                             letterSpacing: 2.5,
//                             fontWeight: FontWeight.bold),
//                       ),
//                       onPressed: () => _trySubmit()),
//                 SizedBox(
//                   height: 24.0,
//                 ),
//                 FlatButton(
//                   onPressed: () {
//                     setState(() {
//                       _isNewuser = !_isNewuser;
//                     });
//                   },
//                   child: Text(
//                     !_isNewuser ? 'Create an account ?' : 'Already a user ?',
//                     style: TextStyle(
//                         color: AppColors.COLOR_WHITE,
//                         fontSize: 16.0,
//                         // letterSpacing: 2.5,
//                         fontWeight: FontWeight.bold),
//                   ),
//                 )
//               ],
//             )),
//       ),
//     ]);
//   }
// }

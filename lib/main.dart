import 'package:flutter/material.dart';
import 'package:globe_ui/Widgets/netflix_widget.dart';
import 'package:globe_ui/Widgets/prime_widget.dart';
import 'package:globe_ui/Widgets/signup.dart';
import 'package:globe_ui/Widgets/suggestions_widget.dart';
import 'Screens/globe_ui.dart';
import 'Themes/themes.dart';
import 'package:globe_ui/Widgets/user_authentication.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:globe_ui/Widgets/profile_widget.dart';
import 'package:globe_ui/Screens/second_route.dart';
import './providers/state_provider.dart';
import 'package:provider/provider.dart';
import 'package:globe_ui/Widgets/signup.dart';
import 'package:globe_ui/Widgets/login.dart';
import 'package:globe_ui/widgets/payment.dart';
import 'package:globe_ui/providers/counter_provider.dart';

void main() {
  // runApp(ChangeNotifierProvider(
  //     create: (context) => StateProvider(), child: MyApp()));

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => StateProvider()),
        ChangeNotifierProvider(create: (context) => CounterProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: Themes.lightTheme,
      // named routes,
      routes: {
        '/sign-up': (context) => SignUp(),
        '/login': (context) => Login(),
        '/home': (context) => GlobeUi(),
        '/profile': (context) => ProfileWidget(),
        '/find-out-more': (context) => SecondRoute(),
        '/netflix-view-all': (context) => NetflixWidget(),
        '/prime-view-all': (context) => PrimeWidget(),
        '/suggestions-view-all': (context) => SuggestionsWidget(),
        '/payment': (context) => Payment()
      },

      home: StreamBuilder(
          stream: FirebaseAuth.instance.onAuthStateChanged,
          builder: (ctx, userSnapshot) {
            //only if the state has the user , redirects to home page
            if (userSnapshot.hasData) {
              print('has user: ${userSnapshot.hasData} ');
              return GlobeUi();
            }
            // else redirects back to sign up page
            print('no user: ${userSnapshot.hasData} ');

            return SignUp();
          }),
    );
  }
}

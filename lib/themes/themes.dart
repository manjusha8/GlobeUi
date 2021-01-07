import 'package:flutter/material.dart';
import 'colors.dart';

class Themes {
  Themes._();
  static final ThemeData darkTheme = ThemeData(
      scaffoldBackgroundColor: Color.fromRGBO(0, 0, 0, 0),
      cardTheme: CardTheme(color: Colors.black),
      buttonColor: Colors.green,
      primaryColor: Colors.white,
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
      textTheme: ThemeData.light().textTheme.copyWith(
          subtitle1: TextStyle(
              color: Colors.white, fontSize: 14.0, letterSpacing: 0.16),
          subtitle2: TextStyle(
              color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.bold),
          headline6: TextStyle(
              fontSize: 14.0, color: Colors.white, fontWeight: FontWeight.bold),
          headline2: TextStyle(
              color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold),
          headline1: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              letterSpacing: 2.5)),
      appBarTheme: AppBarTheme(
          // backgroundColor: Colors.white,
          // elevation: 0,

          textTheme: ThemeData.light().textTheme.copyWith(
              headline6: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25.0,
                  letterSpacing: 2.5))));

  //lightTheme

  static final ThemeData lightTheme = ThemeData(
      scaffoldBackgroundColor: Colors.white,
      cardTheme: CardTheme(color: Colors.white),
      buttonColor: Colors.green,
      primaryColor: Colors.black,
      primaryTextTheme: TextTheme(
        subtitle1:
            TextStyle(color: Colors.white, fontSize: 14.0, letterSpacing: 0.16),
      ),
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
      textTheme: ThemeData.light().textTheme.copyWith(
          subtitle1: TextStyle(
              color: AppColors.COLOR_WHITE,
              fontSize: 14.0,
              letterSpacing: 0.16),
          subtitle2: TextStyle(
              color: AppColors.COLOR_WHITE,
              fontSize: 18.0,
              fontWeight: FontWeight.bold),
          headline6: TextStyle(
              color: AppColors.COLOR_BLUE,
              fontSize: 13.0,
              fontWeight: FontWeight.bold),
          headline5: TextStyle(
              color: AppColors.COLOR_WHITE,
              fontSize: 14.0,
              fontWeight: FontWeight.bold),
          headline2: TextStyle(
              color: Colors.black,
              fontSize: 20.0,
              fontWeight: FontWeight.bold)),
      appBarTheme: AppBarTheme(
          elevation: 0,
          textTheme: ThemeData.light().textTheme.copyWith(
              headline6: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25.0,
                  letterSpacing: 2.5))));
}

// appBarTheme: AppBarTheme(
// textTheme: ThemeData.light().textTheme.copyWith(
// headline6: TextStyle(
// color: Colors.white,
// fontWeight: FontWeight.bold,
// fontSize: 25.0,
// letterSpacing: 2.5)
// )
// )

import 'package:flutter/material.dart';
import '../Widgets/ott_platform.dart';
import 'package:globe_ui/Themes/colors.dart';

class Lifestyle extends StatefulWidget {
  @override
  _LifestyleState createState() => _LifestyleState();
}

class _LifestyleState extends State<Lifestyle> {
  //Shader class to create LinearGradient text

  final Shader linearGradient =
      LinearGradient(colors: <Color>[Color(0xFF3023AE), Color(0xFFC86DD7)])
          .createShader(Rect.fromLTWH(0, 0, 200, 70));

  @override
  Widget build(BuildContext context) {
    // lifeStyle screen starts here
    return Scaffold(
      body: ListView(scrollDirection: Axis.vertical, children: [
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Text(
            'Have More fun ',
            style: TextStyle(
                foreground: Paint()..shader = linearGradient,
                fontWeight: FontWeight.bold,
                fontSize: 22.0),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Text(
            'with Globe!',
            // painting the text with linearGradient variable
            style: TextStyle(
                foreground: Paint()..shader = linearGradient,
                fontWeight: FontWeight.bold,
                fontSize: 22.0),
          ),
        ),
        SizedBox(
          height: 20.0,
        ),
        //calls the OttPlatform() reusable widget
        OttPlatform()
      ]),
    );
  }
}

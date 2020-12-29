import 'dart:ui';
import '../Resources/Strings.dart';
import 'package:flutter/material.dart';
import '../Resources/images.dart';

class LatestPromos extends StatelessWidget {
  // final String category;
  //
  // LatestPromos(this.category);
  //
  final Shader linearGradient = LinearGradient(
    colors: <Color>[Color(0xFF3023AE), Color(0xFFC86DD7)],
  ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: const EdgeInsets.fromLTRB(24.0, 0.0, 24.0, 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Latest Promos',
                  style: TextStyle(
                      // color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                      letterSpacing: -0.5,
                      foreground: Paint()..shader = linearGradient),
                ),
                Text(
                  Strings.VIEW_ALL,
                  style: TextStyle(
                      color: Color(0xFF5056FF),
                      fontSize: 13.0,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          Container(
            width: 140.0,
            height: 168.0,
            padding: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 14.0),
            margin: const EdgeInsets.only(right: 10.0),
            decoration: BoxDecoration(
                image: new DecorationImage(
                    image: new AssetImage(Images.LATEST_PROMOS))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(Images.SPOTIFY),
                Padding(
                  padding: const EdgeInsets.only(top: 15.0, bottom: 24.0),
                  child: Text('Spotify Premium',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.0,
                          letterSpacing: -0.5)),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

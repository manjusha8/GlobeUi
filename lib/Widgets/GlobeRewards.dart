import 'package:flutter/material.dart';
import '../Resources/images.dart';

class GlobeRewards extends StatelessWidget {
  final Shader linearGradient = LinearGradient(
    colors: <Color>[Color(0xFF3023AE), Color(0xFFC86DD7)],
  ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Globe Rewards',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                  letterSpacing: -0.5,
                  foreground: Paint()..shader = linearGradient)),
          Container(
              margin: const EdgeInsets.only(top: 12.0),
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.orange,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text('Your Reward Points',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 11.0,
                              letterSpacing: 0.12,
                              fontWeight: FontWeight.bold)),
                      Padding(
                        padding: const EdgeInsets.only(top: 4.0),
                        child: Text(
                          '7250 Pts',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              letterSpacing: -0.69,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                  Image.asset(
                    Images.GLOBE_REWARDS,
                    height: 57.0,
                    width: 43.0,
                  )
                ],
              )),
        ],
      ),
    );
  }
}

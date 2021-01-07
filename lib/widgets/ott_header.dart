import 'package:flutter/material.dart';

class OttHeader extends StatelessWidget {
  final Shader linearGradient =
      LinearGradient(colors: [Color(0xFFffa8a8), Color(0xFF656afc)])
          .createShader(Rect.fromLTWH(0, 0, 200.0, 70.0));

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'My Subscriptions',
          style: Theme.of(context).textTheme.subtitle1,
        ),
        SizedBox(
          height: 20.0,
        ),
        Text(
          'With remaining 12GB,you can watch 640 min of video',
          style: TextStyle(
              foreground: Paint()..shader = linearGradient,
              fontSize: 18.0,
              fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}

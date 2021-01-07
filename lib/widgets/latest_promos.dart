import 'dart:ui';
import 'package:globe_ui/themes/themes.dart';

import '../Resources/strings.dart';
import 'package:flutter/material.dart';
import 'package:globe_ui/containers/latest_promos_containers.dart';
import '../Resources/images.dart';
import '../Widgets/common/latest_data.dart';
import 'latest_promos_cards.dart';

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
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                      letterSpacing: -0.5,
                      foreground: Paint()..shader = linearGradient),
                ),
                Text(
                  Strings.VIEW_ALL,
                  style: Theme.of(context).textTheme.headline6,
                )
              ],
            ),
          ),

          //calls Latest Promos Container
          Container(
            height: 168.0,
            child: LatestPromosContainers(),
          )
        ],
      ),
    );
  }
}

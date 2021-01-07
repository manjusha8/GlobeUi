import 'package:flutter/material.dart';

import '../Resources/strings.dart';

import 'package:globe_ui/containers/balance_card_container.dart';
import 'package:globe_ui/containers/recommended_containers.dart';

class BannerWidget extends StatelessWidget {
  final Shader linearGradient =
      LinearGradient(colors: <Color>[Color(0xFF4E4E4E), Color(0xFF9C9C9C)])
          .createShader(Rect.fromLTWH(0, 0, 200, 70));
  @override
  Widget build(BuildContext context) {
    // this holds the load balance and recommended cards
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          color: Color(0xFFE1E1F3),
        ),
        padding: const EdgeInsets.fromLTRB(20.0, 32.0, 0.0, 33.0),
        child: Column(
          children: [
            // calls load balance card
            Container(
              height: 153.0,
              child: BalanceDataContainer(),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 27.0, bottom: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(Strings.RECOMMENDED,
                      style: TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold,
                          foreground: Paint()..shader = linearGradient)),
                  Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: Text(Strings.VIEW_ALL,
                        style: Theme.of(context).textTheme.headline6),
                  )
                ],
              ),
            ),
            // calls load balance card

            Container(
              height: 63.0,
              child: RecommendedContainer(),
              // child: ListView(
              //     scrollDirection: Axis.horizontal,
              //     children: RecommendedCardData.map(
              //             (data) => RecommendedCard(data.title, data.days))
              //         .toList()
              // ),
            )
          ],
        ));
  }
}

import 'package:flutter/material.dart';
import '../CommonWidgets/BalanceCard.dart';
import '../CommonWidgets/RecommendedCard.dart';
import '../Resources/Strings.dart';
import '../CommonWidgets/BalanceCardData.dart';
import '../CommonWidgets/RecommendedCardData.dart';
import '../CommonWidgets/RecommendedCardCategory.dart';

class BannerWidget extends StatelessWidget {
  final Shader linearGradient =
      LinearGradient(colors: <Color>[Color(0xFF4E4E4E), Color(0xFF9C9C9C)])
          .createShader(Rect.fromLTWH(0, 0, 200, 70));
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          color: Color(0xFFE1E1F3),
        ),
        padding: const EdgeInsets.fromLTRB(20.0, 32.0, 0.0, 33.0),
        child: Column(
          children: [
            Container(
              height: 153.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: BalanceCardData.map((data) =>
                        BalanceCard(data.category, data.data, data.validity))
                    .toList(),
              ),
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
                        style: TextStyle(
                            color: Color(0xFF5056FF),
                            fontSize: 13.0,
                            fontWeight: FontWeight.bold)),
                  )
                ],
              ),
            ),
            Container(
              height: 63.0,
              child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: RecommendedCardData.map(
                          (data) => RecommendedCard(data.title, data.days))
                      .toList()),
            )
          ],
        ));
  }
}

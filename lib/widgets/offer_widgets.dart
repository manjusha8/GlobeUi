import 'dart:ui';
import '../Resources/strings.dart';
import 'package:flutter/material.dart';
import '../Resources/images.dart';
import '../Widgets/common/latest_data.dart';
import 'latest_promos_cards.dart';

class OfferWidgets extends StatelessWidget {
  // final String category;
  //
  // LatestPromos(this.category);
  //

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
            child: Text(
              'Here is what you can get',
              style: TextStyle(
                color: Color(0xFF7b7bb3),
                fontWeight: FontWeight.bold,
                fontSize: 15.0,
                letterSpacing: -0.5,
              ),
            ),
          ),
          Container(
            height: 168.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: OffersData.map((data) => LatestPromosCard(
                  data.id,
                  data.category_1,
                  data.category_2,
                  data.images,
                  data.images_icon)).toList(),
            ),
          )
        ],
      ),
    );
  }
}

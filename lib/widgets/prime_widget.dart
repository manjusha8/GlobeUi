import 'package:flutter/material.dart';
import 'ott_header.dart';
import 'netflix_data.dart';
import 'netflix_category_item.dart';
import '../Resources/images.dart';

class PrimeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: const EdgeInsets.only(top: 24.0, bottom: 13.0),
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                child: Row(
              children: [
                Text(
                  'Latest on',
                  style: Theme.of(context).textTheme.subtitle2,
                ),
                SizedBox(
                  width: 4.0,
                ),
                Image.asset(Images.PRIME),
              ],
            )),
            GestureDetector(
              child: Text(
                'View All',
                style: Theme.of(context).textTheme.headline6,
              ),
              onTap: () {
                Navigator.pushNamed(context, '/prime-view-all');
              },
            ),
          ],
        ),
        Container(
          height: 190.0,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: PrimeData.map((data) => NetflixCategoryItem(data.images))
                .toList(),
          ),
        )
      ]),
    );
  }
}

import 'package:flutter/material.dart';

class LatestPromosCard extends StatelessWidget {
  final String category_1;
  final String category_2;
  final String images;
  final String images_icon;
  final int id;

  LatestPromosCard(
      this.id, this.category_1, this.category_2, this.images, this.images_icon);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: 140.0,
      height: 168.0,
      margin: const EdgeInsets.only(right: 10.0),
      decoration: BoxDecoration(
          image: new DecorationImage(image: new AssetImage(images))),
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(5.0, 24.0, 16.0, 14.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(images_icon),
                SizedBox(
                  height: 15.0,
                ),
                Text(category_1,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.0,
                        letterSpacing: -0.5)),
              ], // SizedBox(
              //   height: 24.0,
              // ),
            ),
          ),
        ],
      ),
    );
  }
}

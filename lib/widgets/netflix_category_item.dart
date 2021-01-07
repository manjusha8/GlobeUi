import 'package:flutter/material.dart';

class NetflixCategoryItem extends StatelessWidget {
  final String images;

  NetflixCategoryItem(this.images);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        height: 190.0,
        width: 140.0,
        margin: const EdgeInsets.only(right: 10.0, top: 13.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            image: new DecorationImage(image: new AssetImage(images))));
  }
}

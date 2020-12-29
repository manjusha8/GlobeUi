import 'package:flutter/material.dart';
import '../Resources/images.dart';

class BalanceCard extends StatelessWidget {
  final String category;
  final String data;
  final String validity;

  BalanceCard(this.category, this.data, this.validity);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: 136.0,
      height: 153.0,
      margin: const EdgeInsets.only(right: 12.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
          color: Color(0xFF3B41E2), borderRadius: BorderRadius.circular(27.0)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(Images.PLAY_ICON_IMAGE),
          Padding(
            padding: const EdgeInsets.only(top: 28.0),
            child: Text(category,
                style: TextStyle(color: Colors.white, fontSize: 12.0)),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Text(data,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold)),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: Text(validity,
                style: TextStyle(color: Colors.white, fontSize: 12.0)),
          )
        ],
      ),
    );
  }
}

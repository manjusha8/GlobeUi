import 'package:flutter/material.dart';

class RecommendedCard extends StatelessWidget {
  final String title;
  final String days;

  RecommendedCard(this.title, this.days);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: 158.0,
      height: 63.0,
      padding: const EdgeInsets.all(16.0),
      margin: const EdgeInsets.only(right: 8.0),
      decoration: BoxDecoration(
          color: Color(0xFF3B41E2), borderRadius: BorderRadius.circular(8.0)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(color: Colors.white, fontSize: 12.0),
          ),
          Text(
            days,
            style: TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          )
        ],
      ),
    );
  }
}

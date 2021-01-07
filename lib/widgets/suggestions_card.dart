import 'package:flutter/material.dart';

class SuggestionsCard extends StatelessWidget {
  final Color colors;
  final String images;

  SuggestionsCard(
    this.colors,
    this.images,
  );

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 190.0,
      width: 140.0,
      margin: const EdgeInsets.only(right: 10.0, top: 13.0),
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(20.0), color: colors
              // image: new DecorationImage(image: new AssetImage(images)
              // )
              ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(22.0, 31, 16.0, 26.0),
            child: Image.asset('images/hq.jpg'),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(16, 14, 14, 27),
            width: double.infinity,
            decoration: new BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              gradient: new LinearGradient(
                colors: [
                  Color.fromRGBO(0, 0, 0, 0.3),
                  Color.fromRGBO(0, 0, 0, 0.6)
                ],
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Subscribe for',
                  style: TextStyle(color: Colors.white, fontSize: 14.0),
                ),
                SizedBox(
                  height: 4.0,
                ),
                Text('P 129.00',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold))
              ],
            ),
          )
        ],
      ),
    );
  }
}

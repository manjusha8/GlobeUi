import 'package:flutter/material.dart';
import '../Resources/Strings.dart';

class HeaderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.fromLTRB(20.0, 32.0, 20.0, 19.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            Strings.MY_PREPAID,
            style: TextStyle(
                fontSize: 12.0, color: Colors.grey, fontFamily: 'Avenir Next'),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 6.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Row(
                    children: [
                      Text(
                        Strings.NUMBER,
                        style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            letterSpacing: -0.2),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 6.0),
                        child: Icon(Icons.keyboard_arrow_down),
                      )
                    ],
                  ),
                ),
                Icon(Icons.add),
              ],
            ),
          )
        ],
      ),
    );
  }
}

//
// Column(
// children: [
// Row(
// children: [
// Icon(Icons.add),
// Container(
// child :Row(
// children: [
//
// ],
// )
// )
// ],
// )
// ],
// )

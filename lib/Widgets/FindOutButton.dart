import 'package:flutter/material.dart';
import '../Resources/Strings.dart';

class FindOutButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 36.0),
      child: OutlineButton(
          color: Colors.black,
          highlightedBorderColor: Colors.black,
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Text(
            Strings.FIND_OUT_MORE_BUTTON,
            style: TextStyle(color: Colors.black),
          ),
          onPressed: null,
          shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(8.0))),
    );
  }
}

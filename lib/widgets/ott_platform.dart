import 'package:flutter/material.dart';
import 'ott_header.dart';
import 'netflix_widget.dart';
import 'prime_widget.dart';
import 'suggestions_widget.dart';

class OttPlatform extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0), color: Colors.black),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 40.0, 0.0, 32.0),
          child: Column(
            children: [
              OttHeader(),
              NetflixWidget(),
              PrimeWidget(),
              SuggestionsWidget()
            ],
          ),
        ));
  }
}

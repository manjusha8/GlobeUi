import 'package:flutter/material.dart';
import 'ott_header.dart';
import 'suggestions_data.dart';
import 'suggestions_card.dart';

class SuggestionsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: const EdgeInsets.only(top: 24.0, bottom: 13.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          child: Text(
            'You might also like',
            style: Theme.of(context).textTheme.subtitle2,
          ),
        ),
        Container(
          height: 190.0,
          child: ListView(
              scrollDirection: Axis.horizontal,
              children: SuggestionsData.map(
                  (e) => SuggestionsCard(e.colors, e.images)).toList()),
        )
      ]),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:globe_ui/core/services/recommended_cards_services.dart';
import 'package:globe_ui/Widgets/common/recommended_card.dart';

class RecommendedContainer extends StatefulWidget {
  @override
  _RecommendedContainerState createState() => _RecommendedContainerState();
}

class _RecommendedContainerState extends State<RecommendedContainer> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: FutureBuilder(
          future: Services().getRecommendedData(context),
          builder: (context, snapshot) {
            if (snapshot.hasData)
              return Container(
                height: 63.0,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    for (var i = 0;
                        i < snapshot.data.recommendedData.length;
                        i++)
                      RecommendedCard(
                        id: snapshot.data.recommendedData[i].id,
                        title: snapshot.data.recommendedData[i].title,
                        days: snapshot.data.recommendedData[i].days,
                      )
                  ],
                ),
              );
            else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            return CircularProgressIndicator();
          }),
    );
  }
}

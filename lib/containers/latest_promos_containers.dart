import 'package:flutter/material.dart';
import 'package:globe_ui/core/services/latest_promos_services.dart';
import '../Widgets/latest_promos_cards.dart';

class LatestPromosContainers extends StatefulWidget {
  @override
  _LatestPromosContainersState createState() => _LatestPromosContainersState();
}

class _LatestPromosContainersState extends State<LatestPromosContainers> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: FutureBuilder(
        future: Services().getBalanceData(context),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            print(' latest promos ');
            return Container(
                height: 168,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    for (var i = 0; i < snapshot.data.latestPromos.length; i++)
                      LatestPromosCard(
                          snapshot.data.latestPromos[i].id,
                          snapshot.data.latestPromos[i].title,
                          snapshot.data.latestPromos[i].subtitle,
                          snapshot.data.latestPromos[i].images,
                          snapshot.data.latestPromos[i].images_icon)
                  ],
                ));
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }
}

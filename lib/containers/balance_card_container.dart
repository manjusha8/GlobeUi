import 'package:flutter/material.dart';
import 'package:globe_ui/core/services/balance_data_card_services.dart';
import '../Widgets/common/balance_card.dart';

class BalanceDataContainer extends StatefulWidget {
  @override
  _BalanceDataContainerState createState() => _BalanceDataContainerState();
}

class _BalanceDataContainerState extends State<BalanceDataContainer> {
  // void _activeCard(
  //     int id
  //     )
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
          future: Services().getBalanceData(context),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Container(
                  height: 180,
                  child: ListView(scrollDirection: Axis.horizontal, children: [
                    for (var index = 0;
                        index < snapshot.data.balancedata.length;
                        index++)
                      BalanceCard(
                        snapshot.data.balancedata[index].id,
                        snapshot.data.balancedata[index].image,
                        snapshot.data.balancedata[index].category,
                        snapshot.data.balancedata[index].data,
                        snapshot.data.balancedata[index].validity,
                        index,
                      )
                  ]));
            } else if (snapshot.hasError) {
              return new Text("${snapshot.error}");
            }
            return new CircularProgressIndicator();
          }),
    );
  }
}

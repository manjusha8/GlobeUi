import 'package:flutter/material.dart';
import '../Widgets/latest_promos.dart';
import '../Widgets/offer_widgets.dart';
import '../Widgets/globe_rewards.dart';
import '../Widgets/header_widget.dart';

class WalletWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: ListView(
        children: [
          HeaderWidget(), GlobeRewards(),
          // OfferWidgets()
        ],
      ),
    );
  }
}

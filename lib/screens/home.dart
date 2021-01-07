import 'package:flutter/material.dart';
import '../Widgets/header_widget.dart';
import '../Widgets/banner_widget.dart';
import '../Widgets/common/promos_and_plans.dart';
import '../Widgets/latest_promos.dart';
import '../Widgets/globe_rewards.dart';
import '../Widgets/find_out_button.dart';
import '../Widgets/ott_platform.dart';
import '../Resources/images.dart';
import '../Widgets/offer_widgets.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView(
      scrollDirection: Axis.vertical,
      children: [
        HeaderWidget(),
        BannerWidget(),
        PromosAndPlans(Images.SPECIAL_PROMOS, 'Special Promos', 'GoSakto',
            'Create What Matters', 'Promo that’s all you! ', 'packs'),
        LatestPromos(),
        // LatestData.map((data) => LatestPromos(data.category)).toList(),
        PromosAndPlans(Images.ROAMING_PLANS, 'Roaming Plans', 'GoSakto',
            'Planing for a foreign trip?', 'Roam worry free!', 'packs'),
        GlobeRewards(),
        OfferWidgets(),
        FindOutButton(),
        OttPlatform()
      ],
    );
  }
}

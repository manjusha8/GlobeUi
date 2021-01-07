import 'package:flutter/material.dart';
import '../Widgets/latest_promos.dart';
import '../Widgets/common/promos_and_plans.dart';
import '../Resources/images.dart';

class MoreWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: ListView(
      children: [
        PromosAndPlans(Images.SPECIAL_PROMOS, 'Special Promos', 'GoSakto',
            'Create What Matters', 'Promo that’s all you! ', 'packs'),
        PromosAndPlans(Images.ROAMING_PLANS, 'Roaming Plans', 'GoSakto',
            'Planing for a foreign trip?', 'Roam worry free!', 'packs'),
      ],
    ));
  }
}

import 'package:flutter/material.dart';
import 'HeaderWidget.dart';
import '../CommonWidgets/NameCardWidget.dart';
import '../Screens/BannerWidget.dart';
import '../CommonWidgets/PromosAndPlans.dart';
import 'LatestPromos.dart';
import 'GlobeRewards.dart';
import 'FindOutButton.dart';
import '../CommonWidgets/LatestDataCategory.dart';
import '../CommonWidgets/LatestData.dart';

class GlobeUi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          // elevation: 0,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,

          actions: [
            Padding(
              padding: const EdgeInsets.only(left: 120.0, right: 23.0),
              child: Icon(
                Icons.notifications,
              ),
            ),
            ProfileCardWidget()
          ],
        ),
        drawer: Drawer(),
        body: ListView(
          scrollDirection: Axis.vertical,
          children: [
            HeaderWidget(),
            BannerWidget(),
            PromosAndPlans('Special Promos', 'GoSakto', 'Create What Matters',
                'Promo that’s all you! ', 'packs'),
            LatestPromos(),
            // LatestData.map((data) => LatestPromos(data.category)).toList(),
            PromosAndPlans('Roaming Plans', 'GoSakto',
                'Planing for a foreign trip?', 'Roam worry free!', 'packs'),
            GlobeRewards(),
            FindOutButton()
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          // backgroundColor: ,
          currentIndex: 0,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.black,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.mobile_off_rounded), label: 'Mobile'),
            BottomNavigationBarItem(
                icon: Icon(Icons.people), label: 'Lifestyle'),
            BottomNavigationBarItem(
                icon: Icon(Icons.wallet_travel), label: 'Wallet'),
            BottomNavigationBarItem(icon: Icon(Icons.more), label: 'More'),
          ],
        ),
      ),
    );
  }
}

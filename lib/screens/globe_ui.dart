import 'package:flutter/material.dart';
import 'package:globe_ui/Themes/colors.dart';
import 'package:provider/provider.dart';
import '../Widgets/common/name_card_widget.dart';
import 'lifestyle.dart';
import 'home.dart';
import '../Widgets/drawer_widget.dart';
import '../Widgets/appbar_widget.dart';
import 'wallet_widget.dart';
import 'more_widget.dart';
import 'package:globe_ui/providers/state_provider.dart';
import 'package:globe_ui/providers/counter_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class GlobeUi extends StatefulWidget {
  @override
  _GlobeUiState createState() => _GlobeUiState();
}

class _GlobeUiState extends State<GlobeUi> {
  int _selectedIndex = 0;

  // this function is called in order to show an alert box before the user exists the app

  Future<bool> _onBackPressed() {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text(
                'Do you really want to exit the app ?',
                style: TextStyle(color: AppColors.COLOR_BLACK),
              ),
              actions: <Widget>[
                FlatButton(
                    onPressed: () {
                      Navigator.pop(context, false);
                    },
                    child: Text('NO')),
                FlatButton(
                    onPressed: () {
                      Navigator.pop(context, true);
                    },
                    child: Text('YES'))
              ],
            ));
  }

  // created a list to store the navigated indices

  List<int> _navigationList = List();

  GlobalKey<ScaffoldState> _key = new GlobalKey<ScaffoldState>();

  // the widgets of the bottom bar

  static List<Widget> _widgets = <Widget>[
    Home(),
    Lifestyle(),
    WalletWidget(),
    MoreWidget()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (!_navigationList.contains(_selectedIndex))
      _navigationList.add(_selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    // to handle back buttons
    return WillPopScope(
      onWillPop: () {
        if (_navigationList.isEmpty) {
          _onBackPressed();
          // return true;
        } else {
          setState(() {
            _selectedIndex = _navigationList.last;
            _navigationList.removeLast();
          });
        }
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: PreferredSize(
            preferredSize: const Size(double.infinity, kToolbarHeight),
            child: AppBarWidget(),
          ),
          drawer: DrawerWidget(),
          body: _widgets.elementAt(_selectedIndex),
          floatingActionButton: new FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              Provider.of<CounterProvider>(context, listen: false)
                  .incrementCount();
            },
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          // to call bottom navigation bar
          bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              iconSize: 12.0,
              currentIndex: _selectedIndex,
              selectedItemColor: Colors.orange,
              unselectedItemColor: Colors.black,
              onTap: _onItemTapped,
              items: [
                BottomNavigationBarItem(
                    icon: Image.asset('images/mobile.png'), label: 'Mobile'),
                BottomNavigationBarItem(
                    icon: Image.asset('images/lifestyle-s.png'),
                    label: 'Lifestyle'),
                BottomNavigationBarItem(
                    icon: Image.asset('images/wallet-s.png'), label: 'Wallet'),
                BottomNavigationBarItem(
                    icon: Image.asset('images/more-s.png'), label: 'More'),
              ]),
        ),
      ),
    );
  }
}

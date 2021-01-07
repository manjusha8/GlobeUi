import 'package:flutter/material.dart';
import '../Widgets/common/name_card_widget.dart';
import 'profile_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DrawerWidget extends StatelessWidget {
  // profileTap() {}

  @override
  Widget build(BuildContext context) {
    // Drawer widget
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
              padding: const EdgeInsets.fromLTRB(20, 25, 20, 20),
              decoration: BoxDecoration(color: Color(0xFF3e44f4)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //calling profile card widget
                  ProfileCardWidget(),
                  SizedBox(height: 10.0),
                  Text(
                    'My Prepaid',
                    style: TextStyle(fontSize: 16.0, color: Colors.white),
                  ),
                  SizedBox(height: 6.0),
                  Text(
                    '092787368820',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                        color: Colors.white),
                  )
                ],
              )),
          // onTap of this ListTile will take user to profile page
          ListTile(
            title: Text(
              'Profile',
              style: TextStyle(
                fontSize: 12.0,
              ),
            ),
            onTap: () {
              Navigator.pushNamed(context, '/profile');
            },
          ),
          // onTap of this ListTile will take user to payment page

          ListTile(
            title: Text(
              'Payment',
              style: TextStyle(
                fontSize: 12.0,
              ),
            ),
            onTap: () {
              Navigator.pushNamed(context, '/payment');
            },
          ),
          // onTap of this ListTile will take user to logout page

          ListTile(
            title: Text(
              'Logout',
              style: TextStyle(fontSize: 12.0),
            ),
            onTap: () {
              FirebaseAuth.instance.signOut();
              Navigator.pushNamed(context, '/sign-up');
            },
          )
        ],
      ),
    );
  }
}

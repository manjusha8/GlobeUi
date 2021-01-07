import 'package:flutter/material.dart';
import 'header_widget.dart';
import '../Widgets/common/name_card_widget.dart';
import 'package:provider/provider.dart';
import 'package:globe_ui/providers/state_provider.dart';

class ProfileWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // reusable profile widget
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF3b41e2),
        // title: Text('My Profile'),
        title: Text('Welcome ' +
            Provider.of<StateProvider>(context, listen: false).username),

        actions: [ProfileCardWidget()],
      ),
      body: ListView(
        children: [HeaderWidget()],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:globe_ui/providers/state_provider.dart';

class Payment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // calling provider incrementCount() method in provider
    final stateProvider = Provider.of<StateProvider>(context);
    return Scaffold(
      body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '${stateProvider.count}',
            ),
            RaisedButton(
              onPressed: () {
                stateProvider.incrementCount();
              },
              child: Text('Counter'),
            )
          ])),
    );
  }
}

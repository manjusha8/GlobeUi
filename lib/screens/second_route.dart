import 'package:flutter/material.dart';

class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // SecondRote starts here
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF3b41e2),
        title: Text('Routing'),
      ),
      body: Center(
        child: Text('Routing'),
      ),
    );
  }
}

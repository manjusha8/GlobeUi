import 'package:flutter/material.dart';
import '../../Resources/images.dart';

class ProfileCardWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.only(right: 20.0),
      child: CircleAvatar(
        backgroundImage: AssetImage(Images.PROFILE),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../Resources/images.dart';

class PromosAndPlans extends StatelessWidget {
  final String heading;
  final String subtitle;
  final String title;
  final String description;
  final String plans;

  PromosAndPlans(
      this.heading, this.subtitle, this.title, this.description, this.plans);

  final Shader linearGradient = LinearGradient(
    colors: <Color>[Color(0xFF3023AE), Color(0xFFC86DD7)],
  ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      // width: double.infinity,
      height: 156.0,
      width: 320.0,
      margin: const EdgeInsets.only(
          left: 20.0, top: 32.0, right: 20.0, bottom: 40.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            heading,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
                letterSpacing: -0.5,
                foreground: Paint()..shader = linearGradient),
          ),
          Container(
            margin: const EdgeInsets.only(top: 12.0),
            padding: const EdgeInsets.only(
                left: 20.0, top: 20, right: 20.0, bottom: 17.0),
            decoration: BoxDecoration(
                image: new DecorationImage(
                    image: new AssetImage(Images.SPECIAL_PROMOS))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  subtitle,
                  style: TextStyle(
                      color: Colors.white, fontSize: 14.0, letterSpacing: 0.16),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 13.0),
                  child: Text(
                    description,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12.0,
                      letterSpacing: -0.34,
                    ),
                  ),
                ),
                // Container(
                //   color: Colors.black,
                //   padding: const EdgeInsets.only(top: 18.0, bottom: 17.0),
                //   child: Row(
                //     children: [
                //       Padding(
                //         padding: const EdgeInsets.only(right: 10.3),
                //         child: Text(
                //           'Create your own Promo',
                //           style: TextStyle(color: Colors.white),
                //         ),
                //       ),
                //       Icon(Icons.arrow_forward)
                //     ],
                //   ),
                // )
              ],
            ),
          )
        ],
      ),
    );
  }
}

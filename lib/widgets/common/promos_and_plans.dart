import 'package:flutter/material.dart';
import '../../Resources/images.dart';
import '../../Themes/themes.dart';

class PromosAndPlans extends StatelessWidget {
  final String images;
  final String heading;
  final String subtitle;
  final String title;
  final String description;
  final String plans;

  PromosAndPlans(this.images, this.heading, this.subtitle, this.title,
      this.description, this.plans);

  final Shader linearGradient = LinearGradient(
    colors: <Color>[Color(0xFF3023AE), Color(0xFFC86DD7)],
  ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      // width: double.infinity,

      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            // height: MediaQuery.of(context).orientation == Orientation.landscape
            //     ? MediaQuery.of(context).size.height * 0.4
            //     : MediaQuery.of(context).size.height * 0.2,
            // width: MediaQuery.of(context).orientation == Orientation.landscape
            //     ? MediaQuery.of(context).size.width * 0.9
            //     : MediaQuery.of(context).size.width * 0.9,
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
                  height: 156.0,
                  width: 320.0,
                  // height: MediaQuery.of(context).orientation ==
                  //         Orientation.landscape
                  //     ? MediaQuery.of(context).size.height * 0.4
                  //     : MediaQuery.of(context).size.height * 0.2,
                  // width: MediaQuery.of(context).orientation ==
                  //         Orientation.landscape
                  //     ? MediaQuery.of(context).size.width * 0.9
                  //     : MediaQuery.of(context).size.width * 0.9,
                  margin: const EdgeInsets.only(top: 12.0),
                  decoration: BoxDecoration(
                      image:
                          new DecorationImage(image: new AssetImage(images))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(
                            left: 20.0, top: 20, right: 20.0, bottom: 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              subtitle,
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                            SizedBox(height: 8.0),
                            Text(
                              title,
                              style: Theme.of(context).textTheme.subtitle2,
                            ),
                            SizedBox(height: 10.0),
                            Text(
                              description,
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 13.0,
                      ),
                      Container(
                        // height: MediaQuery.of(context).orientation ==
                        //         Orientation.landscape
                        //     ? MediaQuery.of(context).size.height * 0.4
                        //     : MediaQuery.of(context).size.height * 0.4,
                        // width: MediaQuery.of(context).orientation ==
                        //         Orientation.landscape
                        //     ? MediaQuery.of(context).size.width * 0.9
                        //     : MediaQuery.of(context).size.width * 0.9,
                        padding: const EdgeInsets.fromLTRB(20, 12, 20, 15),
                        // width: double.infinity,
                        decoration: new BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          gradient: new LinearGradient(
                            colors: [
                              Color.fromRGBO(0, 0, 0, 0.3),
                              Color.fromRGBO(0, 0, 0, 0.6)
                            ],
                          ),
                        ),
                        child: Row(
                          children: [
                            Text(
                              'Create your own Promo',
                              style: Theme.of(context).textTheme.headline5,
                            ),
                            Icon(
                              Icons.keyboard_arrow_right,
                              color: Colors.white,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

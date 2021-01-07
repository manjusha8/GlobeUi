import 'package:flutter/material.dart';
import '../Widgets/common/name_card_widget.dart';
import 'package:provider/provider.dart';
import 'package:globe_ui/providers/state_provider.dart';
import 'package:globe_ui/providers/counter_provider.dart';

class AppBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // app bar
    return AppBar(
      iconTheme: IconThemeData(color: Colors.black),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      //to place the icons
      actions: [
        Padding(
            padding: const EdgeInsets.only(left: 120.0, top: 15, right: 23.0),
            child: new Stack(
              children: <Widget>[
                Icon(
                  Icons.notifications,
                  size: 30.0,
                ),
                SizedBox(
                  height: 15.0,
                ),
                new Positioned(
                  top: 0,
                  right: 0,
                  child: new Container(
                    padding: const EdgeInsets.all(0.0),
                    child: Center(child: Consumer<CounterProvider>(
                      builder: (context, count, child) {
                        return Text(
                          '${count.count}',
                          style: TextStyle(color: Colors.white),
                        );
                      },
                    )),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(17.0),
                        color: Colors.redAccent),
                    width: 18.0,
                    height: 18.0,
                  ),
                )
              ],
            )),
        ProfileCardWidget()
      ],
    );
  }
}

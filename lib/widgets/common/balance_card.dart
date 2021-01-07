import 'package:flutter/material.dart';
import 'package:globe_ui/Themes/colors.dart';
import '../../Resources/images.dart';

class BalanceCard extends StatefulWidget {
  @override
  _BalanceCardState createState() => _BalanceCardState();

  final int id;
  final String image;
  final String category;
  final String data;
  final String validity;
  final int index;
  // final void Function(int id)activeForm;

  BalanceCard(
    this.id,
    this.image,
    this.category,
    this.data,
    this.validity,
    this.index,
    // this.activeForm
  );
}

class _BalanceCardState extends State<BalanceCard> {
  var active = false;
  Color selectedTextColor = Color(0xFF131415);
  Color selectedBoldTextColor = AppColors.COLOR_BLACK;
  Color activeContainer = AppColors.COLOR_WHITE;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return GestureDetector(
      // onTapCancel: (){},
      onTap: () {
        if (widget.id == widget.id)
          setState(() {
            selectedTextColor = AppColors.COLOR_WHITE;
            selectedBoldTextColor = AppColors.COLOR_WHITE;
            activeContainer = Color(0xFF3B41E2);
            active = true;
          });
        print('id : ${widget.id} and active : $active');
      },
      child: Container(
        width: 136.0,
        height: 153.0,
        margin: const EdgeInsets.only(right: 12.0),
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
            color: activeContainer,
            // color: active ? Color(0xFF3B41E2) : Colors.white,
            borderRadius: BorderRadius.circular(27.0)),
        child: Column(
          key: ValueKey(widget.id),
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(Images.PLAY_ICON_IMAGE),
            Padding(
              padding: const EdgeInsets.only(top: 28.0),
              child: Text(widget.category,
                  style: TextStyle(
                      color: selectedTextColor,
                      // color: active ? Colors.white : Color(0xFF131415),
                      fontSize: 12.0)),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Text(widget.data,
                  style: TextStyle(
                      color: selectedBoldTextColor,
                      // color: active ? Colors.white : AppColors.COLOR_BLACK,
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: Text(widget.validity,
                  style: TextStyle(
                      color: selectedTextColor,
                      // color: active ? Colors.white : Color(0xFF131415),
                      fontSize: 12.0)),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:globe_ui/themes/colors.dart';
import '../Resources/strings.dart';
import 'package:provider/provider.dart';
import 'package:globe_ui/providers/state_provider.dart';

class HeaderWidget extends StatefulWidget {
  @override
  _HeaderWidgetState createState() {
    return new _HeaderWidgetState();
  }
}

class _HeaderWidgetState extends State<HeaderWidget> {
  bool toggle = false;

  final _formkey = GlobalKey<FormState>();

  Widget getTextWidgets(List<int> num) {
    return new Column(
        children: num.map((item) => Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: new Text(item.toString(),
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0)),
            )).toList());
  }

  onShowNumberField() {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Form(
                  key: _formkey,
                  child: TextFormField(
                    validator: (input) {
                      if (input.isEmpty) {
                        return 'invalid email';
                      } else if (input.length < 10) {
                        return 'less than 10 digits not valid';
                      } else if (input.length > 10) {
                        return 'greater than 10 digits not valid';
                      }
                      return null;
                    },
                    onSaved: (input) {
                      print('num: ${int.parse(input)}');
                      mobileNumber = int.parse(input);
                    },
                    style: TextStyle(color: AppColors.COLOR_BLACK),
                    decoration: InputDecoration(
                      labelText: 'Enter your number',
                    ),
                  )),
              actions: <Widget>[
                FlatButton(
                    onPressed: () {
                      Navigator.pop(context, false);
                    },
                    child: Text('CANCEL')),
                FlatButton(
                    onPressed: () {
                      _submit();
                    },
                    child: Text('OK'))
              ],
            ));
  }

  void _submit() {
    final isValid = _formkey.currentState.validate();
    if (isValid) {
      _formkey.currentState.save();
      Provider.of<StateProvider>(context, listen: false)
          .displayNumber(mobileNumber);
      Navigator.pop(context);
    }
  }

  int mobileNumber;

  onToggle() {
    setState(() {
      toggle = !toggle;
    });
  }

  @override
  Widget build(BuildContext context) {
    final stateprovider = Provider.of<StateProvider>(context, listen: false);

    // Reusable HeaderWidget()
    return Padding(
      padding: const EdgeInsets.fromLTRB(20.0, 32.0, 20.0, 19.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            Strings.MY_PREPAID,
            style: TextStyle(
                fontSize: 12.0, color: Colors.grey, fontFamily: 'Avenir Next'),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Row(
                    children: [
                      Text(
                        Strings.NUMBER,
                        style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            letterSpacing: -0.2),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 6.0),
                        child: IconButton(
                          icon: Icon(!toggle
                              ? Icons.keyboard_arrow_down
                              : Icons.keyboard_arrow_up),
                          onPressed: () => onToggle(),
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  child: Icon(Icons.add),
                  onTap: () {
                    onShowNumberField();
                  },
                ),
              ],
            ),
          ),
          toggle
              ? stateprovider.number.isNotEmpty
                  ? getTextWidgets(stateprovider.number)
                  : Container(
                      child: Text(
                        'no numbers added!',
                        style: TextStyle(color: AppColors.COLOR_RED),
                      ),
                    )
              : Container(
                  child: Text(''),
                )
        ],
      ),
    );
  }
}

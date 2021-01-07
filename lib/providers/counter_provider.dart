import 'package:flutter/cupertino.dart';

class CounterProvider extends ChangeNotifier {
  int count = 0;
  int get getCount => count;

  incrementCount() {
    count++;
    print('count: $count');
    notifyListeners();
  }
}

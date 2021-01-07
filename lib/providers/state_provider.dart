import 'package:flutter/material.dart';

class StateProvider extends ChangeNotifier {
  String username = 'user';
  String get getUsername => username;
  int count = 0;
  int get getCount => count;
  List<int> number = [];
  List<int> get getNumber => number;
  // UnmodifiableListView get number {
  //   return UnmodifiableListView(number);
  // }

  currentUser(uname) {
    username = uname;
  }

  incrementCount() {
    count++;
    print('count: $count');
    notifyListeners();
  }

  displayNumber(num) {
    print('number : $num');
    number.add(num);
    print('list of num: $number');
    notifyListeners();
  }
}

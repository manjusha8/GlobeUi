import 'dart:convert';
import 'dart:async' show Future;
import 'package:flutter/material.dart';
import 'package:globe_ui/core/models/models.dart';

class Services {
  Future<Welcome> getBalanceData(BuildContext context) async {
    String jsonString = await DefaultAssetBundle.of(context)
        .loadString('mock/balance_data.json');
    Map balanceData = jsonDecode(jsonString);
    final BalanceList = Welcome.fromJson(balanceData);
    print('balance : $BalanceList');
    return BalanceList;
  }
}

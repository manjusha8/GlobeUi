import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:globe_ui/core/models/latest_promos_models.dart';
import 'dart:async' show Future;

class Services {
  Future<LatestPromos> getBalanceData(BuildContext context) async {
    String jsonString = await DefaultAssetBundle.of(context)
        .loadString('mock/latest_promos.json');
    Map mapData = jsonDecode(jsonString);
    print('mapdata: $mapData');
    final listData = LatestPromos.fromJson(mapData);
    print('listdata: $listData');
    return listData;
  }
}

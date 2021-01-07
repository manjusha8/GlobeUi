import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:globe_ui/core/models/recommended_data_models.dart';
import 'dart:async' show Future;

class Services {
  Future<Welcome> getRecommendedData(BuildContext context) async {
    String jsonString = await DefaultAssetBundle.of(context)
        .loadString('mock/recommended_data.json');
    Map mapData = jsonDecode(jsonString);
    final listData = Welcome.fromJson(mapData);
    print('recommended data: $listData');
    return listData;
  }
}

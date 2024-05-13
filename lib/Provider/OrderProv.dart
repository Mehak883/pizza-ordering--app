import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'dart:core';

class OrderProv with ChangeNotifier {
  Map<DateTime, List<dynamic>> _orderMap = {};
  Map<DateTime, List<dynamic>> get orderMap => _orderMap;

  void addall(List<dynamic> orderList) {
    // int i = 1;
    List<dynamic> newList = [];
    for (List<dynamic>ol in orderList) {
      newList.add([
        ol[0],
        ol[1],
        ol[2],
        ol[3],
        ol[4]
      ]);
      // _orderMap.addAll({DateTime.now(): orderList});
    }
    _orderMap[DateTime.now()] = newList;
    print(_orderMap);
    notifyListeners();
  }
}

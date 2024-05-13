import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pixzzaapp/Provider/HomeProv.dart';

class LikesProv with ChangeNotifier {
  List<dynamic> _favItem = [];
  List<dynamic> get favItem => _favItem;

  void addItem(int id) {
    HomeProv hp = HomeProv();

    _favItem.add([
      hp.pd[id].Ccolor,
      hp.pd[id].Pdesp,
      hp.pd[id].price,
      hp.pd[id].Pimage,
      hp.pd[id].Pname,
      hp.pd[id].id
    ]);
    notifyListeners();
  }

  void removeItem(int id) {
    _favItem.removeAt(id);
    notifyListeners();
  }

  bool getItem(int id) {
    HomeProv hp = HomeProv();

    for (int i = 0; i < favItem.length; i++) {
      if (favItem[i][5] == hp.pd[id].id) {
        return true;
      }
    }
    return false;
  }

  int getId(int id) {
    HomeProv hp = HomeProv();
    for (int i = 0; i < favItem.length; i++) {
      if (favItem[i][5] == hp.pd[id].id) {
        return i;
      }
    }
    return -1;
  }
}

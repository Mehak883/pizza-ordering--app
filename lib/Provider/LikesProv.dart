import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pixzzaapp/Provider/HomeProv.dart';

class LikesProv with ChangeNotifier {
  List<dynamic> _favItem = [
    // [
    //   'images/pizza-png-15.png',
    //   'Canadian Pizza',
    //   '20',
    //   false,
    //   'This delicious mushroom pizza is smothered in sautéed mushrooms, onions and garlic, and layers of mozzarella and fresh-grated parmesan',
    // ],
    // [
    //   'images/pizza-png-15.png',
    //   'Baby Corn Pizza',
    //   '30',
    //   false,
    //   'This delicious mushroom pizza is smothered in sautéed mushrooms, onions and garlic, and layers of mozzarella and fresh-grated parmesan',
    // ],
    // [
    //   'images/pizza-png-15.png',
    //   'Tandoori Pizza',
    //   '15',
    //   false,
    //   'This delicious mushroom pizza is smothered in sautéed mushrooms, onions and garlic, and layers of mozzarella and fresh-grated parmesan',
    // ],
    // [
    //   'images/pizza-png-15.png',
    //   'Mushooms Olives Pizza',
    //   '30',
    //   false,
    //   'This delicious mushroom pizza is smothered in sautéed mushrooms, onions and garlic, and layers of mozzarella and fresh-grated parmesan',
    // ],
    // [
    //   'images/pizza-png-15.png',
    //   'Canadian Pizza',
    //   '20',
    //   false,
    //   'This delicious mushroom pizza is smothered in sautéed mushrooms, onions and garlic, and layers of mozzarella and fresh-grated parmesan',
    // ]
  ];
  List<dynamic> get favItem => _favItem;
  void likeItem(int value) {
    _favItem[value][3] = true;
    notifyListeners();
  }

  void addItem(int id) {
    HomeProv hp = HomeProv();
    
    _favItem.add(hp.pd[id]);
    notifyListeners();
  }

  void removeItem(int id) {
    _favItem.removeAt(id);
    notifyListeners();
  }

  void dislikeItem(int value) {
    _favItem[value][3] = false;
    notifyListeners();
  }
}

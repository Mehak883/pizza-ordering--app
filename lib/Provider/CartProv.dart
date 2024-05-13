import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class CartProv with ChangeNotifier {
  List<dynamic> _cartItems = [];
  List<dynamic> get cartItems => _cartItems;
  void addItem(List<dynamic> cd) {
    _cartItems.add(cd);
    notifyListeners();
  }
  // Pname,
  // Pimage,
  // Pdesp,
  // Pprice * quantity,
  // quantity

  void removeItem(int index) 
  {
    _cartItems.removeAt(index);
    notifyListeners();
  }
  void removeAll() 
  {
    _cartItems.clear();
    notifyListeners();
  }
}

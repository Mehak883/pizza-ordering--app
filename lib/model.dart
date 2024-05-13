import 'package:flutter/material.dart';

class PizzaDetails {
  final String Pimage;
  final String Pname;
  final String Pdesp;
  final Color Ccolor;
  final int price;
  int pprice=0;

  final int id;

  PizzaDetails(
      this.Pimage, this.Pname, this.Pdesp, this.Ccolor, this.price, this.id);
}

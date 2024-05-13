import 'dart:async';
import 'dart:core';

Future<void> main() async {
  List a = [
    [1, 'fidid'],
    [2, 'ghjkk']
  ];
  print();
  Map<DateTime, dynamic> m = {};
  m[DateTime.now()] = a;
  // await Future.delayed(Duration(seconds: 5));
  a = [
    [3, 'qqqd']
  ];
  m[DateTime.now()] = a;

  print(m);
}

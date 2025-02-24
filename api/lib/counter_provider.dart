import 'package:flutter/material.dart';

class CounterProvider extends ChangeNotifier {
  int _count = 0;
  bool _isdark = false;

  int get count => _count;
  bool get dark => _isdark;

  void increment() {
    _count++;
    notifyListeners();
  }

  toggleMode() {
    _isdark = !_isdark;
    notifyListeners();
  }
}

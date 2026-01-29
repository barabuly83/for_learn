import 'package:flutter/foundation.dart';

class CounterNotifier extends ChangeNotifier {
  int _count = 0;

  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }

  void decrement() {
    _count--;
    notifyListeners();
  }

  bool reset() {
    if (_count != 0) {
      _count = 0;
      notifyListeners();
      return true;
    }
    return false;
  }
}

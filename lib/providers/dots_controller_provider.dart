import 'package:flutter/material.dart';

class DotsController extends ChangeNotifier {
  double _currentIndex = 0;
  int _primaryBullet = 15;
  int _secondaryBullet = 12;

  double get currentIndex {
    return _currentIndex;
  }

  set currentIndex(double currentIndex) {
    _currentIndex = currentIndex;
    notifyListeners();
  }

  int get primaryBullet {
    return _primaryBullet;
  }

  set secondaryBullet(int secondaryBullet) {
    _secondaryBullet = secondaryBullet;
    notifyListeners();
  }

  int get secondaryBullet {
    return _secondaryBullet;
  }

  set primaryBullet(int primaryBullet) {
    _primaryBullet = primaryBullet;
    notifyListeners();
  }
}

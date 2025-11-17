// lib/viewmodels/bottom_tab_viewmodel.dart
import 'package:flutter/material.dart';

class HomeMainModel extends ChangeNotifier {
  int _currentIndex = 0; // default tab

  int get currentIndex => _currentIndex;

  void changeTab(int index) {
    _currentIndex = index;
    notifyListeners(); // UI ko update karne ke liye
  }
}

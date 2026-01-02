import 'package:flutter/material.dart';

class AddToCartLogic extends ChangeNotifier {

  List<Map<String, dynamic>> cartItems = [];

  void addItem(Map<String, dynamic> item) {
    cartItems.add(item);
    notifyListeners();
  }

  void removeItem(int index) {
    cartItems.removeAt(index);
    notifyListeners();
  }

  
}
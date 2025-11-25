import 'package:cartapp/core/app_colors.dart';
import 'package:flutter/material.dart';

// 1. TextModel: यह लॉजिक और डेटा को रखता है
class HomeMainLogic extends ChangeNotifier {
  // इनपुट को नियंत्रित करने के लिए Controller
  final TextEditingController _textController = TextEditingController();
  TextEditingController get textController => _textController;

  // Example images for demo (replace with your assets)
final List<String> categoryImages = [
  'assets/images/veg.png',
  'assets/images/fruit.png',
  'assets/images/beverage.png',
  'assets/images/grocery.png',
  'assets/images/oil.png',
  'assets/images/household.png',
];

final List<Color> categoryColors = [
  AppColors.vegFresh,
  AppColors.fruitPeach,
  AppColors.beverageCream,
  AppColors.groceryLavender,
  AppColors.oilAqua,
  AppColors.householdRose,
];


final List<String> categoryNames = [
  'Vegetables',
  'Fruits',
  'Beverages',
  'Grocery',
  'Oil',
  'Household',
];


  // इनपुट टेक्स्ट को स्टोर करने के लिए एक स्ट्रिंग
  String _currentText = '';
  String get currentText => _currentText;

  // 2. Logic Function
  void updateText(String newText) {
    _currentText = newText;
    // यह फ़ंक्शन सभी सुनने वाले विजेट्स (Consumers) को बताता है कि डेटा बदल गया है
    notifyListeners();
  }

  // 3. Controller को dispose करने के लिए (ज़रूरी)
  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }
}
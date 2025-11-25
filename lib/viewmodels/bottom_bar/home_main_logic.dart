import 'package:cartapp/core/app_colors.dart';
import 'package:cartapp/core/app_images.dart';
import 'package:flutter/material.dart';

// 1. TextModel: यह लॉजिक और डेटा को रखता है
class HomeMainLogic extends ChangeNotifier {
  // इनपुट को नियंत्रित करने के लिए Controller
  final TextEditingController _textController = TextEditingController();
  TextEditingController get textController => _textController;

  // Example images for demo (replace with your assets)
  final List<String> categoryImages = [
    AppImages.vagetables,
    AppImages.fruits,
    AppImages.beverages,
    AppImages.groceries,
    AppImages.edibleOils,
    AppImages.vacuum,
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

  // 3. Controller को dispose करने के लिए (ज़रूरी)
  // @override
  // void dispose() {
  //   _textController.dispose();
  //   super.dispose();
  // }
}
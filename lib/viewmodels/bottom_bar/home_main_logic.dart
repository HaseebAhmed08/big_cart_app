import 'package:cartapp/core/app_colors.dart';
import 'package:cartapp/core/app_images.dart';
import 'package:flutter/material.dart';

// 1. TextModel: 
class HomeMainLogic extends ChangeNotifier {
  // Controller
  final TextEditingController _textController = TextEditingController();
  TextEditingController get textController => _textController;

  // Example images for demo (replace with your assets)
 

  final List<Color> categoryColors = [
    AppColors.vegFresh,
    AppColors.fruitPeach,
    AppColors.beverageCream,
    AppColors.groceryLavender,
    AppColors.oilAqua,
    AppColors.householdRose,
  ];
 final List categoryImages = [
    AppImages.vegetables,
    AppImages.fruits,
    AppImages.beverages,
    AppImages.groceries,
    AppImages.edibleOils,
    AppImages.vacuum,
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
  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }
}
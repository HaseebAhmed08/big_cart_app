import 'package:cartapp/core/app_colors.dart';
import 'package:cartapp/core/app_images.dart';
import 'package:cartapp/views/home_screens/widgets/home_itemCard.dart';
import 'package:flutter/material.dart';

// 1. TextModel:
class HomeMainLogic extends ChangeNotifier {
  // Controller
  final TextEditingController _textController = TextEditingController();
  TextEditingController get textController => _textController;


   final Map<String, bool> _favorites = {};

  bool isFavorite(String id) {
    return _favorites[id] ?? false;
  }

// var favorites = false;
  void toggleFavorite(String id) {
    _favorites[id] = !(_favorites[id] ?? false);
    notifyListeners();
  }


  List<Map<String, dynamic>> get favoriteProducts {
    return [
      {"id": "p1", "imageUrl": AppImages.aocado, "title": "Fresh Peach", "subtitle": "dozen", "price": 12.99, "isNew": false, "badge": null, "discount": null},
      {"id": "p2", "imageUrl": AppImages.broccoli, "title": "Avocado", "subtitle": "2.0 lbs", "price": 7.00, "isNew": true, "badge": null, "discount": null},
      {"id": "p3", "imageUrl": AppImages.grapes, "title": "Pineapple", "subtitle": "1.50 lbs", "price": 3.90, "isNew": false, "badge": null, "discount": null},
      {"id": "p4", "imageUrl": AppImages.peach, "title": "Black Grapes", "subtitle": "5.0 lbs", "price": 7.05, "isNew": false, "badge": null, "discount": "-16%"},
      {"id": "p5", "imageUrl": "assets/images/pomegranate.png", "title": "Pomegranate", "subtitle": "1.50 lbs", "price": 2.09, "isNew": true, "badge": null, "discount": null},
      {"id": "p6", "imageUrl": AppImages.broccoli, "title": "Fresh Broccoli", "subtitle": "1 kg", "price": 3.00, "isNew": false, "badge": null, "discount": null},
    ].where((p) => _favorites[p['id']] ?? false).toList();
  }

final List<ProductCard> products = [
  ProductCard(
    id: 'p1',
    imageUrl: AppImages.aocado,
    title: 'Fresh Peach',
    subtitle: 'dozen',
    price: 12.99,
    isNew: false,
    badge: null,
    discount: null,
  ),
  ProductCard(
    id: 'p2',
    imageUrl: AppImages.broccoli,
    title: 'Avocado',
    subtitle: '2.0 lbs',
    price: 7.00,
    isNew: true,
    badge: null,
    discount: null,
  ),
  ProductCard(
    id: 'p3',
    imageUrl: AppImages.grapes,
    title: 'Pineapple',
    subtitle: '1.50 lbs',
    price: 3.90,
    isNew: false,
    badge: null,
    discount: null,
  ),
  ProductCard(
    id: 'p4',
    imageUrl: AppImages.peach,
    title: 'Black Grapes',
    subtitle: '5.0 lbs',
    price: 7.05,
    isNew: false,
    badge: null,
    discount: '-16%',
  ),
  ProductCard(
    id: 'p5',
    imageUrl: 'assets/images/pomegranate.png',
    title: 'Pomegranate',
    subtitle: '1.50 lbs',
    price: 2.09,
    isNew: true,
    badge: null,
    discount: null,
  ),
  ProductCard(
    id: 'p6',
    imageUrl: AppImages.broccoli,
    title: 'Fresh Broccoli',
    subtitle: '1 kg',
    price: 3.00,
    isNew: false,
    badge: null,
    discount: null,
  ),
];






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

import 'package:cartapp/models/splash_data.dart';
import 'package:cartapp/core/app_images.dart';
import 'package:flutter/material.dart';

class SplashViewModel extends ChangeNotifier {
  final List<SplashData> _splashItems = [
    SplashData(
      title: 'Get Discounts\nOn All Products',
      description: 'Fresh Fruits, Handpicked Daily\nHealthy, Juicy & Delivered to Your Doorstep!',
      image: AppImages.splash1,
    ),
    SplashData(
      title: 'Organic Vegetables\nStraight from Farm',
      description: 'Crisp, Fresh & Healthy\nDelivered Fast to Your Home',
      image: AppImages.splash2,
    ),
    SplashData(
      title: 'Daily Dairy\nFresh & Pure',
      description: 'Milk, Butter & Cheese\nStraight from Local Farms',
      image: AppImages.splash3,
    ),
  ];

  int _currentIndex = 0;

  // Getters
  List<SplashData> get splashItems => _splashItems;
  int get currentIndex => _currentIndex;
  SplashData get currentSplashData => _splashItems[_currentIndex];
  int get totalSplashCount => _splashItems.length;

  // Methods
  void setCurrentIndex(int index) {
    if (index >= 0 && index < _splashItems.length) {
      _currentIndex = index;
      notifyListeners();
    }
  }

  void nextSplash() {
    if (_currentIndex < _splashItems.length - 1) {
      _currentIndex++;
      notifyListeners();
    }
  }

  void previousSplash() {
    if (_currentIndex > 0) {
      _currentIndex--;
      notifyListeners();
    }
  }

  bool get isLastSplash => _currentIndex == _splashItems.length - 1;
  bool get isFirstSplash => _currentIndex == 0;








  // Add PageController here
  final PageController pageController = PageController();




  // Dispose PageController when ViewModel is disposed
  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}



import 'package:cartapp/utils/splash_button.dart';
import 'package:cartapp/viewmodels/splash_logic/splash_logic.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cartapp/core/app_colors.dart';
import 'package:cartapp/core/app_textstyle.dart';

class SplashFirst extends StatefulWidget {
  const SplashFirst({super.key});

  @override
  State<SplashFirst> createState() => _SplashFirstState();
}

class _SplashFirstState extends State<SplashFirst> {
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  // Next Page or Finish
  void _nextPage(SplashViewModel viewModel) {
    final total = viewModel.totalSplashCount;
    final current = viewModel.currentIndex;

    if (current < total - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      // Last page — go to home
      Navigator.pushReplacementNamed(context, '/home');
      // Ya jo route chahiye: '/login', '/onboarding', etc.
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SplashViewModel>(
      builder: (context, viewModel, child) {
        return Scaffold(
          body: Stack(
            children: [
              // PageView with image + text
              PageView.builder(
                controller: _pageController,
                itemCount: viewModel.totalSplashCount,
                onPageChanged: (index) {
                  viewModel.setCurrentIndex(index);
                },
                itemBuilder: (context, index) {
                  final item = viewModel.splashItems[index];
                  return Stack(
                    fit: StackFit.expand,
                    children: [
                      // Background image
                      item.image.isNotEmpty
                          ? Image.asset(
                              item.image,
                              fit: BoxFit.cover,
                            )
                          : Container(color: AppColors.background),

                      // Dark overlay
                      // Container(color: Colors.black26),

                      // Text overlay
                      SafeArea(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 60, left: 20, right: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                item.title,
                                textAlign: TextAlign.center,
                                style: appTextTheme.titleLarge
                              ),
                              const SizedBox(height: 20),
                              Text(
                                item.description,
                                textAlign: TextAlign.center,
                                style: appTextTheme.bodyMedium
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),

              // Dots
              Positioned(
                bottom: 140,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    viewModel.totalSplashCount,
                    (dotIndex) => AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      width: viewModel.currentIndex == dotIndex ? 10 : 10,
                      height: 10,
                      decoration: BoxDecoration(
                        color: viewModel.currentIndex == dotIndex
                            ? AppColors.primary
                            : Colors.white70,
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                ),
              ),

              // Get Started Button
              Positioned(
                bottom: 60,
                left: 20,
                right: 20,
                child: SplashButton(
                  width: double.infinity,
                  height: 56,
                  onTap: () {
                    Navigator.pushReplacementNamed(context, '/welcomeToLogin');
                  },
                  child: Text('Get Started',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
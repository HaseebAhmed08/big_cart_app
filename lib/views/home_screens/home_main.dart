// home_main.dart
import 'package:cartapp/core/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cartapp/core/app_images.dart';
import 'package:cartapp/viewmodels/bottom_bar/home_main_logic.dart';

class HomeMain extends StatelessWidget {
  const HomeMain({super.key});

  @override
Widget build(BuildContext context) {
    final bottomVM = Provider.of<HomeMainModel>(context, listen: true);

    final List<String> iconPaths = [
      AppImages.home,
      AppImages.profile,
      AppImages.favourite,
      AppImages.cart,
    ];

    return Scaffold(
      extendBody: true, // Important for floating effect
      body: IndexedStack(
        clipBehavior: Clip.none,  // Yeh line sabse zaroori hai
        index: bottomVM.currentIndex,
        children: const [
          Center(child: Text("Home Screen", style: TextStyle(fontSize: 20))),
          Center(child: Text("Profile Screen", style: TextStyle(fontSize: 20))),
          Center(child: Text("Favourite Screen", style: TextStyle(fontSize: 20))),
          Center(child: Text("Cart Screen", style: TextStyle(fontSize: 20))),
        ],
      ),

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        child: Material(
          elevation: 20,
          borderRadius: BorderRadius.circular(40),
          child: Container(
            height: 70,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(40),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(iconPaths.length, (index) {
                bool isSelected = index == bottomVM.currentIndex;

                return GestureDetector(
                  onTap: () => bottomVM.changeTab(index),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeOutCubic,
                    // Selected icon ko thoda upar uthane ke liye
                    transform: Matrix4.translationValues(
                      0, 
                      isSelected ? -30 : 0, 
                      0
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Green Circle Background (only on selected)
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          height: isSelected ? 52 : 0,
                          width: isSelected ? 52 : 0,
                          decoration: BoxDecoration(
                            color: AppColors.primary, // Green
                            shape: BoxShape.circle,
                            boxShadow: isSelected
                                ? const [
                                    BoxShadow(
                                      color:  AppColors.primary,
                                      blurRadius: 15,
                                      spreadRadius: 3,
                                    )
                                  ]
                                : null,
                          ),
                          child: Center(
                            child: Image.asset(
                              iconPaths[index],
                              width: 26,
                              height: 26,
                              color: isSelected ? Colors.white : Colors.grey.shade600,
                            ),
                          ),
                        ),

                        // Normal icon (jab not selected)
                        if (!isSelected)
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Image.asset(
                              iconPaths[index],
                              width: 26,
                              height: 26,
                              color: Colors.grey.shade600,
                            ),
                          ),

                        // Thoda space to balance
                        if (!isSelected) const SizedBox(height: 18),
                      ],
                    ),
                  ),
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}
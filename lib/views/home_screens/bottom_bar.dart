
// home_main.dart (Refined)
import 'package:cartapp/core/app_colors.dart';
import 'package:cartapp/viewmodels/bottom_bar/bottom_bar_logic.dart';
import 'package:cartapp/views/home_screens/favourite.dart';
import 'package:cartapp/views/home_screens/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cartapp/core/app_images.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({super.key});

  // Helper method for icon paths
  static final List<String> iconPaths = [
    AppImages.home,
    AppImages.profile,
    AppImages.favourite,
    AppImages.cart,
  ];

  @override
  Widget build(BuildContext context) {
    final bottomVM = Provider.of<BottomBarLogic>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      extendBody: true, // Floating effect के लिए महत्वपूर्ण
      body: IndexedStack(
        clipBehavior: Clip.none, // Floating Icon को overflow होने देने के लिए महत्वपूर्ण
        index: bottomVM.currentIndex,
        children: const [
          HomeScreen(),
          Center(child: Text("Profile Screen", style: TextStyle(fontSize: 20))),
          Favorite(),
        ],
      ),

      bottomNavigationBar: SafeArea(
        minimum: const EdgeInsets.fromLTRB(24, 0, 24, 16),
        child: Material(
          elevation: 20,
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(40),
          child: Container(
            height: 72,
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
                  child: SizedBox( // Size to match the largest icon/circle combination
                    width: 60, // Sufficient width for the effect
                    height: 100, // Sufficient height to accommodate the floating effect
                    child: Stack( // Stack to place the circle and icon relative to each other
                      alignment: Alignment.topCenter,
                      clipBehavior: Clip.none,
                      children: [
                        // Floating Green Circle and White Icon (Always in the stack)
                        AnimatedPositioned(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeOutCubic,
                          // If selected, move it up by -30 (relative to the top of the SizedBox)
                          top: isSelected ? -30 : (100 - 70) / 2 + 5, // 5 is a padding to center it vertically when not selected
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeOutCubic,
                            height: isSelected ? 52 : 36, // Smaller size when not selected
                            width: isSelected ? 52 : 36, // Smaller size when not selected
                            decoration: BoxDecoration(
                              color: isSelected ? AppColors.primary : Colors.white,
                              shape: BoxShape.circle,
                              boxShadow: isSelected
                                  ? const [
                                      BoxShadow(
                                        color: AppColors.primary,
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
                        ),
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
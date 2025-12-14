import 'package:cartapp/core/app_colors.dart';
import 'package:cartapp/viewmodels/bottom_bar/home_main_logic.dart'; // Import HomeMainLogic
import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Import provider

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      body: Consumer<HomeMainLogic>( // Use Consumer to access HomeMainLogic
        builder: (context, homeMainLogic, child) {
          return Column(
            children: [
              Container(
                height: 115,
                color: AppColors.background,
                child: Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Row(
                    children: [
                      // LEFT: Back button
                      IconButton(
                        onPressed: () => Navigator.of(context).pop(),
                        icon: const Icon(Icons.arrow_back),
                      ),

                      // CENTER: Categories Text
                      const Expanded(
                        child: Center(
                          child: Text(
                            'Categories',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),

                      // RIGHT: Tune icon
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.tune),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: GridView.builder(
                  padding: const EdgeInsets.all(16.0),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, // 3 containers horizontally
                    crossAxisSpacing: 16.0,
                    mainAxisSpacing: 16.0,
                    childAspectRatio: 1.0, // For 120x120 containers
                  ),
                  itemCount: homeMainLogic.categoryNames.length,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 120, // Specified height
                      width: 120, // Specified width
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 32, // Replicate size from home screen
                            backgroundColor: homeMainLogic.categoryColors[index], // Use category color
                            child: Padding(
                              padding: const EdgeInsets.all(10), // Padding as in home screen
                              child: SizedBox( // Ensure image fits
                                height: 32, // Specified height
                                width: 29, // Specified width
                                child: Image.asset(
                                  homeMainLogic.categoryImages[index],
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            homeMainLogic.categoryNames[index],
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
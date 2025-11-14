import 'package:cartapp/core/app_colors.dart';
import 'package:cartapp/core/app_textstyle.dart';
import 'package:flutter/material.dart';

class SplashFirst extends StatelessWidget {
  const SplashFirst({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: 
     Scaffold(
      backgroundColor: AppColors.background,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Page title
            Text('Welcome', style: appTextTheme.titleLarge),

            const SizedBox(height: 20),

            // Section heading
            Text('Your Cart', style: appTextTheme.titleMedium),

            const SizedBox(height: 10),

            // Paragraph / body
            Text(
              'You have 3 items in your cart.',
              style: appTextTheme.bodyMedium,
            ),

            const SizedBox(height: 20),

            // Button / label
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
              ),
              child: Text('Checkout', style: appTextTheme.labelMedium),
            ),

            const SizedBox(height: 10),

            // Link text
            Text(
              'Continue shopping',
              style: appTextTheme.labelMedium!.copyWith(
                color: AppColors.textLink,
              ),
            ),
          ],
        ),
      ),
    )
    );
  }
}
import 'package:cartapp/views/home_screens/form_filling.dart';
import 'package:flutter/material.dart';
import 'package:cartapp/utils/splash_button.dart'; // Apna SplashButton import karo

// Agar aapke pass AppImages class hai
import 'package:cartapp/core/app_images.dart'; // Yeh path apne according adjust kar lena

class OrderSuccessScreen extends StatelessWidget {
  const OrderSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(height: 60), // Top space

              // Main Content (Center)
              Column(
                children: [
                  // Congrats Animation Image
                  Image.asset(
                    AppImages.congrates, // Yeh wahi image hai jo aapne batayi
                    width: 220,
                    height: 220,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(height: 40),

                  // Congrats Text
                  const Text(
                    'Congrats!',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Order Details Text
                  Text(
                    'Your Order #123456 is\nSuccessfully Received',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey[600],
                      height: 1.5,
                    ),
                  ),
                ],
              ),

              // Bottom Button
              Padding(
                padding: const EdgeInsets.only(bottom: 40.0),
                child: SplashButton(
                  onTap: () {
                    // Go to Home Screen (apna home screen yahan daalo)
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (_) => const CheckoutScreen()), // Ya HomeScreen()
                      (route) => false, // Sab pages clear kar do
                    );
                  },
                  width: double.infinity,
                  height: 56,
                  child: const Text(
                    'Go to Home',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
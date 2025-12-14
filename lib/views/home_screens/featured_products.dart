import 'package:flutter/material.dart';

class FeaturedProductsScreen extends StatelessWidget {
  const FeaturedProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Featured Products'),
      ),
      body: const Center(
        child: Text('Featured Products Screen'),
      ),
    );
  }
}

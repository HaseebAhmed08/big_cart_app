import 'package:flutter/material.dart';

class AddTocart extends StatelessWidget {
  const AddTocart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add to Cart'),
      ),
      body: const Center(
        child: Text('Add to Cart Screen'),
      ),
    );
  }
}
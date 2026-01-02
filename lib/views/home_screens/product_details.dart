import 'package:cartapp/core/app_colors.dart';
import 'package:cartapp/utils/splash_button.dart';
import 'package:cartapp/viewmodels/bottom_bar/home_main_logic.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductDetailsScreen extends StatefulWidget {
  final String? productImage;
  final String? productName;
  final double? productPrice;
  final String? productWeight;
  final String? productDescription;

  const ProductDetailsScreen({
    super.key,
    this.productImage,
    this.productName,
    this.productPrice,
    this.productWeight,
    this.productDescription,
  });

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int _itemCount = 1;
  bool _showFullDescription = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Image
            Center(
              child: SizedBox(
                height: 324,
                width: 324,
                child: Image.asset(
                  widget.productImage!,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(Icons.image_not_supported, size: 100);
                  },
                ),
              ),
            ),
            const SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Price
                  Text(
                    '\$${widget.productPrice!.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                    ),
                  ),
                  const SizedBox(height: 8),

                  // Product Name
                  Text(
                    widget.productName!,
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 6),

                  // Weight
                  Text(
                    widget.productWeight!,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Rating
                  Row(
                    children: List.generate(5, (index) {
                      return Icon(
                        Icons.star,
                        color: index < 4 ? Colors.amber : Colors.grey.shade300,
                        size: 22,
                      );
                    }),
                  ),
                  const SizedBox(height: 24),

                  // Description with Read More
                  Text(
                    widget.productDescription!,
                    maxLines: _showFullDescription ? null : 6,
                    overflow: _showFullDescription ? TextOverflow.visible : TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 15,
                      height: 1.5,
                      color: Colors.grey[800],
                    ),
                  ),

                  // Read More Button (only if text is long)
                  if (!_showFullDescription &&
                      (widget.productDescription!.length > 200)) // Better check
                    TextButton(
                      onPressed: () {
                        setState(() {
                          _showFullDescription = true;
                        });
                      },
                      child: Text(
                        'Read More',
                        style: TextStyle(
                          color: AppColors.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                  if (_showFullDescription)
                    TextButton(
                      onPressed: () {
                        setState(() {
                          _showFullDescription = false;
                        });
                      },
                      child: const Text(
                        'Show Less',
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

              
                  const SizedBox(height: 30),

                  // Add to Cart Button (Consumer bahar, button andar)
                  // Consumer<HomeMainLogic>(
                  //   builder: (context, logic, child) {
                  //     return SplashButton(
                  //       onTap: () {
                  //         // Add product with quantity
                  //         final productData = {
                  //           'id': widget.productName, // Better to use unique ID if possible
                  //           'title': widget.productName,
                  //           'subtitle': widget.productWeight,
                  //           'price': widget.productPrice,
                  //           'imageUrl': widget.productImage,
                  //           'quantity': _itemCount, // Quantity add ki!
                  //         };

                  //         logic.addToCart(productData);

                  //         ScaffoldMessenger.of(context).showSnackBar(
                  //           SnackBar(
                  //             content: Text('Added $_itemCount × ${widget.productName} to cart!'),
                  //             duration: const Duration(seconds: 2),
                  //           ),
                  //         );
                  //       },
                  //       width: double.infinity,
                  //       height: 56,
                  //       child: const Text(
                  //         'Add to Cart',
                  //         style: TextStyle(
                  //           fontFamily: 'Poppins',
                  //           fontWeight: FontWeight.bold,
                  //           color: Colors.white,
                  //           fontSize: 18,
                  //         ),
                  //       ),
                  //     );
                  //   },
                  // ),

                  const SizedBox(height: 40),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
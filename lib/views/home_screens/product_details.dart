import 'package:cartapp/core/app_colors.dart';
import 'package:cartapp/widgets/custum_button.dart'; // Import the custom button
import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatefulWidget {
  final String? productImage;
  final String? productName;
  final double? productPrice ;
   final String? productWeight;
   final String? productDescription;
  const ProductDetailsScreen({super.key, this.productImage, this.productName, this.productPrice, this.productWeight, this.productDescription});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int _itemCount = 1; // For the quantity selector
  bool _showFullDescription = false;

  // // Placeholder data for product details
  // final String _productImage = AppImages.aocado;
  // final String _productName = 'Fresh Peach';
  // final double _productPrice = 12.99;
  // final String _productWeight = '1.5 lbs';
  // final String _productDescription =
  //     'A fresh and juicy peach, hand-picked for quality. Perfect for snacks, desserts, or adding to your favorite recipes. Rich in vitamins and natural sweetness. Enjoy the taste of summer all year round.';

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
            // Top Center Image
            Center(
              child: SizedBox(
                height: 324,
                width: 324,
                child: Image.asset(
                  widget.productImage!,
                  fit: BoxFit.contain,
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
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary, // Light green color
                    ),
                  ),
                  const SizedBox(height: 8),

                  // Product Name
                  Text(
                    widget.productName!,
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),

                  // Quantity/Weight
                  Text(
                    widget.productWeight!,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 12),

                  // 5-Star Rating
                  Row(
                    children: List.generate(5, (index) {
                      return Icon(
                        Icons.star,
                        color: index < 4 ? Colors.amber : Colors.grey.shade400, // Example 4 out of 5 stars
                        size: 20,
                      );
                    }),
                  ),
                  const SizedBox(height: 20),

                  // Product Detail (max 6 lines + "Read More")
                  Text(
                    widget.productDescription!,
                    maxLines: _showFullDescription ? null : 6,
                    overflow: _showFullDescription ? TextOverflow.visible : TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey[800],
                    ),
                  ),
                  if (widget.productDescription!.length > 6 * 20 && !_showFullDescription) // Simple check for long text
                    Align(
                      alignment: Alignment.centerLeft,
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            _showFullDescription = true;
                          });
                        },
                        child: Text(
                          'Read More',
                          style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  const SizedBox(height: 20),

                  // Quality/Quantity Selector
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Quality',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.remove_circle_outline, color: AppColors.primary),
                            onPressed: () {
                              setState(() {
                                if (_itemCount > 1) _itemCount--;
                              });
                            },
                          ),
                          Text(
                            '$_itemCount',
                            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          IconButton(
                            icon: Icon(Icons.add_circle_outline, color: AppColors.primary),
                            onPressed: () {
                              setState(() {
                                _itemCount++;
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),

                  // Custom Button
                  GradientButton(
                    text: 'Add to Cart',
                    onTap: () {
                      // Handle add to cart logic
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Added $_itemCount of ${widget.productName} to cart!')),
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

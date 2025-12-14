import 'package:cartapp/core/app_colors.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String imageUrl; // only assets path
  final String? badge;
  final bool isNew;
  final String title;
  final String subtitle;
  final double price;
  final String? discount;

  const ProductCard({
    super.key,
    required this.imageUrl,
    this.badge,
    required this.isNew,
    required this.title,
    required this.subtitle,
    required this.price,
    this.discount,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/product_details');
      },
      child: LayoutBuilder(
        builder: (context, constraints) {
          final double cellWidth = constraints.maxWidth;

          return Container(
            margin: const EdgeInsets.all(0),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.12),
                  blurRadius: 10,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // IMAGE + BADGES
                SizedBox(
                  height: 85,
                  child: Stack(
                    children: [
                      Center(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: SizedBox(
                            width: 130,
                            height: 85,
                            child: Image.asset(
                              imageUrl,
                              fit: BoxFit.contain,
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  color: Colors.grey[200],
                                  child: const Center(child: Icon(Icons.image_not_supported)),
                                );
                              },
                            ),
                          ),
                        ),
                      ),

                      // Discount Badge (TOP LEFT)
                      if (discount != null)
                        Positioned(
                         
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Text(
                              discount!,
                              style: const TextStyle(
                                  color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12),
                            ),
                          ),
                        ),

                      // Custom Badge
                      if (badge != null)
                        Positioned(
                          top: 6,
                          left: 6 + (discount != null ? 50 : 0), // avoid overlap
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: const Color(0xFF6B4EFF),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Text(
                              badge!,
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),

                      // NEW Badge (TOP RIGHT)
                      if (isNew)
                        Positioned(
                          top: 6,
                          right: 6,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: Colors.amber,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: const Text('NEW',
                                style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
                          ),
                        ),
                    ],
                  ),
                ),

                const SizedBox(height: 8),

                // Favorite icon
                Align(
                  alignment: Alignment.centerRight,
                  child:
                      Icon(Icons.favorite, color: discount != null ? Colors.red : Colors.grey[350], size: 20),
                ),

                const SizedBox(height: 6),

                // Title + Subtitle
                Text(title,
                    style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis),
                Text(subtitle,
                    style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis),

                const Spacer(),

                // Price
                Text('\$${price.toStringAsFixed(2)}',
                    style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),

                const SizedBox(height: 6),
  Divider(
                  color: AppColors.primary,
                  ),
                // Add to cart row
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  
                    Icon(Icons.shopping_bag_outlined, size: 18, color:AppColors.primary),
                    const SizedBox(width: 6),
                    Text(
                      'Add to cart',
                      style: TextStyle(fontSize: 13, color: AppColors.black),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

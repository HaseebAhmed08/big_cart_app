import 'package:cartapp/core/app_colors.dart';
import 'package:cartapp/viewmodels/bottom_bar/home_main_logic.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductCard extends StatelessWidget {
  final String? id;
  final String imageUrl;
  final String? badge;
  final bool isNew;
  final String title;
  final String subtitle;
  final double price;
  final String? discount;
  final VoidCallback? addToCart;

  const ProductCard({
    super.key,
    required this.imageUrl,
    this.badge,
    required this.isNew,
    required this.title,
    required this.subtitle,
    required this.price,
    this.discount,
    this.id, 
    this.addToCart,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/product_details');
      },
      child: Container(
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
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            /// IMAGE + BADGES
            SizedBox(
              height: 85,
              child: Stack(
                children: [
                  Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        imageUrl,
                        width: 130,
                        height: 85,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),

                  /// DISCOUNT
                  if (discount != null)
                    Positioned(
                      top: 6,
                      left: 6,
                      child: _badge(discount!, Colors.red),
                    ),

                  /// CUSTOM BADGE
                  if (badge != null)
                    Positioned(
                      top: 6,
                      left: discount != null ? 56 : 6,
                      child: _badge(badge!, const Color(0xFF6B4EFF)),
                    ),

                  /// NEW BADGE
                  if (isNew)
                    Positioned(
                      top: 6,
                      right: 6,
                      child: _badge('NEW', Colors.amber),
                    ),
                ],
              ),
            ),

            const SizedBox(height: 4),

            /// FAVORITE ICON (NO IconButton → NO OVERFLOW)
           
              Align(
  alignment: Alignment.centerRight,
  child: Consumer<HomeMainLogic>(
    builder: (context, logic, child) {
      final isFavorite = logic.isFavorite(id ?? '');

      return GestureDetector(
        onTap: () {
          if (id != null) logic.toggleFavorite(id!);
        },
        child: Icon(
          isFavorite ? Icons.favorite : Icons.favorite_border,
          size: 20,
          color: isFavorite ? Colors.red : Colors.grey,
        ),
      );
    },
  ),
),

            
        

            const SizedBox(height: 4),

            /// TITLE
            Text(
              title,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),

            /// SUBTITLE
            Text(
              subtitle,
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey[600],
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),

            const Spacer(),

            /// PRICE
            Text(
              '\$${price.toStringAsFixed(2)}',
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 4),

            Divider(
              height: 8,
              thickness: 1,
              color: AppColors.primary,
            ),

            /// ADD TO CART
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.shopping_bag_outlined,
                  size: 18,
                  color: AppColors.primary,
                ),
                const SizedBox(width: 6),
                InkWell(
                  onTap: addToCart,
                  child: Text(
                    'Add to cart',
                    style: TextStyle(
                      fontSize: 13,
                      color: AppColors.black,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  /// BADGE WIDGET
  Widget _badge(String text, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}

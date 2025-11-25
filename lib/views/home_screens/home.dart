import 'package:cartapp/core/app_images.dart';
import 'package:cartapp/core/app_textstyle.dart';
import 'package:cartapp/viewmodels/bottom_bar/home_main_logic.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 12),

                // Search Bar
                const FunctionalSearchBar(),
                const SizedBox(height: 20),

                // Deal Banner
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    AppImages.deal1,
                    height: screenHeight * 0.32,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),

                const SizedBox(height: 28),

                // Categories
                _buildSectionTitle('Categories'),
                const SizedBox(height: 16),

                // Horizontal Categories
                SizedBox(
                  height: 100,
                  child: Consumer<HomeMainLogic>(
                    builder: (context, logic, child) {
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: logic.categoryNames.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: Column(
                              children: [
                                CircleAvatar(
                                  radius: 32,
                                  backgroundColor: logic.categoryColors[index],
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Image.asset(
                                      logic.categoryImages[index],
                                      height: 40,
                                      width: 40,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  logic.categoryNames[index],
                                  style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),

                const SizedBox(height: 32),

                // Featured Products
                _buildSectionTitle('Featured products'),
                const SizedBox(height: 16),

                // Grid of Products
                GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 0.78,
                  children: const [
                    ProductCard(
                      imageUrl: AppImages.aocado,
                      badge: null,
                      isNew: false,
                      title: 'Fresh Peach', 
                      subtitle: 'dozen',
                      price: 12.99,
                      discount: null,
                    ),
                    ProductCard(
                      imageUrl: 'https://i.imgur.com/5qO6jYJ.png',
                      badge: null,
                      isNew: true,
                      title: 'Avocado',
                      subtitle: '2.0 lbs',
                      price: 7.00,
                      discount: null,
                    ),
                    ProductCard(
                      imageUrl: 'https://i.imgur.com/9kP8m3L.png',
                      badge: null,
                      isNew: false,
                      title: 'Pineapple',
                      subtitle: '1.50 lbs',
                      price: 3.90,
                      discount: null,
                    ),
                    ProductCard(
                      imageUrl: 'https://i.imgur.com/2rF5k8P.png',
                      badge: null,
                      isNew: false,
                      title: 'Black Grapes',
                      subtitle: '5.0 lbs',
                      price: 7.05,
                      discount: '-16%',
                    ),
                    ProductCard(
                      imageUrl: 'https://i.imgur.com/8iL5p7Q.png',
                      badge: null,
                      isNew: true,
                      title: 'Pomegranate',
                      subtitle: '1.50 lbs',
                      price: 2.09,
                      discount: null,
                    ),
                    ProductCard(
                      imageUrl: 'https://i.imgur.com/3jK9m2v.png',
                      badge: null,
                      isNew: false,
                      title: 'Fresh Broccoli',
                      subtitle: '1 kg',
                      price: 3.00,
                      discount: null,
                    ),
                  ],
                ),

                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: appTextTheme.labelSmall?.copyWith(
            fontSize: 19,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        const Icon(Icons.arrow_forward_ios, size: 18, color: Colors.black54),
      ],
    );
  }
}

// Search Bar
class FunctionalSearchBar extends StatelessWidget {
  const FunctionalSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeMainLogic>(
      builder: (context, model, child) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(14),
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 4)),
            ],
          ),
          child: TextField(
            controller: model.textController,
            // onChanged: model.updateText,
            decoration: const InputDecoration(
              hintText: 'Search keywords...',
              hintStyle: TextStyle(color: Colors.grey, fontSize: 15),
              prefixIcon: Icon(Icons.search, color: Colors.grey),
              suffixIcon: Icon(Icons.tune, color: Colors.grey),
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 8),
            ),
          ),
        );
      },
    );
  }
}

// // Final Product Card – 100% Perfect Match
class ProductCard extends StatelessWidget {
  final String imageUrl;
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
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.12),
            blurRadius: 15,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          children: [
            // Image + Badges
            Stack(
              children: [
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(14),
                    child: Image.network(
                      imageUrl,
                      height: 118,
                      width: 118,
                      fit: BoxFit.cover,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Container(
                          height: 118,
                          width: 118,
                          color: Colors.grey[200],
                          child: const Center(child: CircularProgressIndicator(strokeWidth: 2)),
                        );
                      },
                    ),
                  ),
                ),
                if (badge != null)
                  Positioned(
                    top: 8,
                    left: 8,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 5),
                      decoration: BoxDecoration(
                        color: const Color(0xFF6B4EFF),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        badge!,
                        style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                if (isNew)
                  Positioned(
                    top: 8,
                    left: 8,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        color: Colors.amber.shade400,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text(
                        'NEW',
                        style: TextStyle(color: Colors.black87, fontSize: 11, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
              ],
            ),

            const SizedBox(height: 12),

            // Favorite
            Align(
              alignment: Alignment.centerRight,
              child: Icon(
                Icons.favorite,
                color: discount != null ? Colors.red : Colors.grey[350],
                size: 22,
              ),
            ),

            if (discount != null) ...[
              const SizedBox(height: 6),
              Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.red.shade50,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    discount!,
                    style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 13),
                  ),
                ),
              ),
            ],

             SizedBox(height: discount != null ? 8 : 12),

            Text(title, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
            Text(subtitle, style: TextStyle(fontSize: 13, color: Colors.grey[600])),

            const SizedBox(height: 10),

            Text(
              '\$${price.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const Spacer(),

            // Add to Cart Button
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.shopping_cart_outlined, size: 17),
                label: const Text('Add to cart', style: TextStyle(fontSize: 13)),
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.green.shade600,
                  side: BorderSide(color: Colors.green.shade600),
                  padding: const EdgeInsets.symmetric(vertical: 11),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
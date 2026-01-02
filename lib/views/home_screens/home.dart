import 'package:cartapp/core/app_images.dart';
import 'package:cartapp/core/app_textstyle.dart';
import 'package:cartapp/viewmodels/bottom_bar/home_main_logic.dart';
import 'package:cartapp/views/home_screens/widgets/home_itemCard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenHeight = mediaQuery.size.height;
    const bottomBarHeight = 110.0;
    final contentBottomPadding = bottomBarHeight + mediaQuery.padding.bottom + 16;

    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(16, 8, 16, contentBottomPadding),
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
                _buildSectionTitle('Categories',(){Navigator.pushNamed(context, '/categories');}),
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
                                    child: Container(
                                    height: 40,
                                        width: 40,
                                      child: Image.asset(
                                       logic.categoryImages[index],
                                        
                                        fit: BoxFit.contain,
                                      ),
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
                _buildSectionTitle('Featured products',(){Navigator.pushNamed(context, '/featured_products');}),
                const SizedBox(height: 16),

Consumer<HomeMainLogic>(
  builder: (context, logic, child) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: logic.products.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        // crossAxisCount: 2,
  // physics: const NeverScrollableScrollPhysics(),
  crossAxisCount: 2,
  mainAxisSpacing: 16,
  crossAxisSpacing: 16,
  childAspectRatio: 0.774, // width / height — tweak as needed
      ),
      itemBuilder: (context, index) {
        final product = logic.products[index];

        return ProductCard(
          id: product.id,
          imageUrl: product.imageUrl,
          badge: product.badge,
          isNew: product.isNew,
          title: product.title, 
          subtitle: product.subtitle,
          price: product.price,
          discount: product.discount,
          addToCart: () {
          },
        );
      },
    );
  },
),

                // const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title, VoidCallback onTap) {
    return InkWell(
    onTap:onTap
   ,
      child: Row(
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
      ),
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
            color: Colors.grey.shade300,
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

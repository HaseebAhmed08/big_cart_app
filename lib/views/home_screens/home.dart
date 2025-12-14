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
      backgroundColor: Colors.grey[50],
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

                // Grid of Products
                GridView.count(
  shrinkWrap: true,
  physics: const NeverScrollableScrollPhysics(),
  crossAxisCount: 2,
  mainAxisSpacing: 16,
  crossAxisSpacing: 16,
  childAspectRatio: 0.774, // width / height — tweak as needed
  children: [

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
                      imageUrl: AppImages.broccoli,
                      badge: null,
                      isNew: true,
                      title: 'Avocado',
                      subtitle: '2.0 lbs',
                      price: 7.00,
                      discount: null,
                    ),
                    ProductCard(
                      imageUrl: AppImages.grapes,
                      badge: null,
                      isNew: false,
                      title: 'Pineapple',
                      subtitle: '1.50 lbs',
                      price: 3.90,
                      discount: null,
                    ),
                    ProductCard(
                      imageUrl: AppImages.peach,
                      badge: null,
                      isNew: false,
                      title: 'Black Grapes',
                      subtitle: '5.0 lbs',
                      price: 7.05,
                      discount: '-16%',
                    ),
                    ProductCard(
                      imageUrl: 'assets/images/pomegranate.png',
                      badge: null,
                      isNew: true,
                      title: 'Pomegranate',
                      subtitle: '1.50 lbs',
                      price: 2.09,
                      discount: null,
                    ),
                    ProductCard(
                      imageUrl: AppImages.broccoli,
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

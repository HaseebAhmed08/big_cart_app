import 'package:cartapp/viewmodels/bottom_bar/home_main_logic.dart';
import 'package:cartapp/views/home_screens/widgets/home_itemCard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Favorite extends StatelessWidget {
  const Favorite({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
      ),
      body: Consumer<HomeMainLogic>(
        builder: (context, logic, child) {
          final favProducts = logic.favoriteProducts;

          if (favProducts.isEmpty) {
            return const Center(child: Text('No favorites yet!'));
          }

          return GridView.builder(
            padding: const EdgeInsets.all(12),
                  physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,

            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
  mainAxisSpacing: 16,
  crossAxisSpacing: 16,
  childAspectRatio: 0.774,
            ),
            itemCount: favProducts.length,
          itemBuilder: (context, index) {
  final favMap = favProducts[index]; // Yeh Map hai

  // Map ko ProductCard object mein convert karo
  final product = ProductCard(
    id: favMap['id'],
    title: favMap['title'],
    subtitle: favMap['subtitle'],
    price: favMap['price'],
    imageUrl: favMap['imageUrl'],
    isNew: false, // ya jo bhi
    addToCart: () {}, // dummy, baad mein override nahi karenge
    // agar aur fields hain jaise quantity, wo bhi add karo
  );

  return ProductCard(
    id: product.id,
    title: product.title,
    subtitle: product.subtitle,
    price: product.price,
    imageUrl: product.imageUrl,
    isNew: false,
    addToCart: () {
      // Ab ProductCard object pass kar rahe ho
      Provider.of<HomeMainLogic>(context, listen: false).addToCart(product);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('${product.title} added to cart!')),
      );
    },
  );
},
            
          );
        },
      ),
    );
  }
}

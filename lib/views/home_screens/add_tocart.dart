
import 'package:cartapp/core/app_textstyle.dart';
import 'package:cartapp/utils/splash_button.dart';
import 'package:cartapp/viewmodels/bottom_bar/home_main_logic.dart';
import 'package:cartapp/views/home_screens/form_filling.dart';
import 'package:cartapp/views/home_screens/widgets/home_itemCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

class AddTocart extends StatelessWidget {
  const AddTocart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Column(
        children: [
          // Header
          Container(
            height: 114,
            width: double.infinity,
            color: Colors.white,
            padding: const EdgeInsets.only(top: 65),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // LEFT SPACE (same width as right)
                const SizedBox(width: 48),

                // CENTER TITLE
                Expanded(
                  child: Center(
                    child: Text(
                      "Add to Cart",
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),

                // RIGHT SPACE (same as left)
                const SizedBox(width: 48),
              ],
            ),
          ),

          // Cart Items List
          Expanded(
            child: Consumer<HomeMainLogic>(
              builder: (context, cartLogic, child) {
                final cartItems = cartLogic.addToCartedProducts;

                if (cartItems.isEmpty) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.shopping_cart_outlined,
                          size: 80,
                          color: Colors.grey[400],
                        ),
                        const SizedBox(height: 16),
                        Text(
                          "Your cart is empty",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  );
                }

                return ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: cartItems.length,
                  itemBuilder: (context, index) {
                    final product = cartItems[index];
                    return _CartItemTile(
                      product: product,
                      index: index,
                    );
                  },
                );
              },
            ),
          ),

         Consumer<HomeMainLogic>(
           builder: (context, cartLogic, child) {
             final cartItems = cartLogic.addToCartedProducts;
         
             if (cartItems.isNotEmpty) {
               return Padding(
                 padding: const EdgeInsets.only(bottom: 150),
                 child: Container(
                   padding: const EdgeInsets.all(16),
                   color: Colors.white,
                   child: Column(
                     children: [

 Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                           Text(
                    'Charges',
                    style:  appTextTheme.labelMedium
                  ),
                           
                            Text(
                                 '\$5.00',
                                 style:appTextTheme.labelMedium
                               
                             
                           ),
                         ],
                       ),





                     /////////////////////

                     Divider(color: Colors.green),
                       Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                           const Text(
                             'Total:',
                             style: TextStyle(
                               fontSize: 18,
                               fontWeight: FontWeight.w600,
                             ),
                           ),
                           Consumer<HomeMainLogic>(
                             builder: (context, cartLogic, child) {
                               final totalPrice = cartLogic.addToCartedProducts.fold<double>(
                                 0.0,
                                 (sum, item) =>
                                     sum + (item.price * (item.quantity ?? 1)),
                               );
                               return Text(
                                 '\$${totalPrice.toStringAsFixed(2)}',
                                 style: const TextStyle(
                                   fontSize: 18,
                                   fontWeight: FontWeight.w600,
                                   color: Colors.green,
                                 ),
                               );
                             },
                           ),
                         ],
                       ),
                       const SizedBox(height: 20),
                       SplashButton(
                         onTap: () {
                           Navigator.push(context, MaterialPageRoute(builder: (_) => const CheckoutScreen()));
                         },
                         width: double.infinity,
                         height: 56,
                         child: Text('Checkout', style: TextStyle(
                           fontFamily: 'Poppins',
                           fontWeight: FontWeight.bold,
                           color: Colors.white,
                           fontSize: 15,
                         )),
                       ),
                     ],
                   ),
                 ),
               );
             }
             return const SizedBox.shrink();
           },
         ),
      ],
    ),
  );
  }
}

class _CartItemTile extends StatelessWidget {
  final ProductCard product;
  final int index;

  const _CartItemTile({
    required this.product,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Slidable(
        key: ValueKey(product.id ?? index),
       endActionPane: ActionPane(
  motion: const ScrollMotion(),
  extentRatio: 0.30, // Yeh sabse important! Sirf 15% swipe pe delete dikhega → bahut chhota area
  children: [
    CustomSlidableAction(
      onPressed: (context) {
        context.read<HomeMainLogic>().removeFromCart(index);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('${product.title} removed from cart'),
            duration: const Duration(seconds: 2),
          ),
        );
      },
      child: Container(
        width: 70, // Chhota fixed width
        height: double.infinity,
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.delete, color: Colors.white, size: 26),
            SizedBox(height: 4),
            Text(
              'Delete',
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
          ],
        ),
      ),
    ),
  ],
),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: ListTile(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 8,
            ),
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                product.imageUrl,
                width: 60,
                height: 60,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: 60,
                    height: 60,
                    color: Colors.grey[200],
                    child: const Icon(Icons.image, color: Colors.grey),
                  );
                },
              ),
            ),
            title: Text(
              product.title,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.subtitle,
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey[600],
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '\$${product.price.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
            trailing: Container(
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Decrement Button
                  InkWell(
                    onTap: () {
                      context.read<HomeMainLogic>().decrementQuantity(index);
                    },
                    borderRadius: BorderRadius.circular(8),
                    child: Container(
                      width: 32,
                      height: 32,
                      alignment: Alignment.center,
                      child: const Icon(
                        Icons.remove,
                        size: 18,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  // Quantity Display
                  Container(
                    width: 40,
                    alignment: Alignment.center,
                    child: Text(
                      '${product.quantity ?? 1}',
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  // Increment Button
                  InkWell(
                    onTap: () {
                      context.read<HomeMainLogic>().incrementQuantity(index);
                    },
                    borderRadius: BorderRadius.circular(8),
                    child: Container(
                      width: 32,
                      height: 32,
                      alignment: Alignment.center,
                      child: const Icon(
                        Icons.add,
                        size: 18,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

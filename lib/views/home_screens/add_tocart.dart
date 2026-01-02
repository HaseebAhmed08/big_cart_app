
import 'package:flutter/material.dart';
class AddTocart extends StatelessWidget {
  const AddTocart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Column(
        children: [
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

          // ListView.builder(itemBuilder: 
          // (context, index) {
          //   return  CartItemTile(title: '', subtitle: '', price: '', onDelete: () {  }, imageUrl: '',);
          // },)
        ],
      ),
    );
  }
}

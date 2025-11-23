import 'package:cartapp/core/app_images.dart';
import 'package:cartapp/viewmodels/bottom_bar/home_main_logic.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// FunctionalSearchBar 
class FunctionalSearchBar extends StatelessWidget {
  const FunctionalSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    // Provider 
    final textModel = Provider.of<HomeMainLogic>(context, listen: false);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 8.0),
      child: Container(
        // Search Bar Design
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 3,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: TextField(
          // Controller\
          controller: textModel.textController,
          onChanged: textModel.updateText,
          
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.search, color: Colors.grey),
            hintText: 'Search keywords...',
            hintStyle: const TextStyle(color: Colors.grey),
            suffixIcon: IconButton(
              icon: const Icon(Icons.tune, color: Colors.grey),
              onPressed: () {}, 
            ),
            contentPadding: const EdgeInsets.symmetric(vertical: 15.0),
            border: InputBorder.none,
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
          ),
        ),
      ),
    );
  }
}


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
          SizedBox(height: 50),
            const FunctionalSearchBar(),
                      SizedBox(height: 20),

        
            Container(
              width: double.infinity,
              height: 283,
              child: Image.asset(
                'assets/images/deals1.png',
                fit: BoxFit.cover,
              ),
            ),
            
           
          ],
        ),
      ),
    );
  }
}
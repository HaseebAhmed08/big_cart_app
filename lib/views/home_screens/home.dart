import 'package:cartapp/core/app_images.dart';
import 'package:cartapp/core/app_textstyle.dart';
import 'package:cartapp/viewmodels/bottom_bar/home_main_logic.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// FunctionalSearchBar Widget
class FunctionalSearchBar extends StatelessWidget {
  const FunctionalSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 8.0),
      child: Consumer<HomeMainLogic>(
        builder: (context, textModel, child) {
          return Container(
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
              controller: textModel.textController,
              onChanged: textModel.updateText,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search, color: Colors.grey),
                hintText: 'Search keywords...',
                hintStyle: const TextStyle(color: Colors.grey),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.tune, color: Colors.grey),
                  onPressed: () {
                    // Add filter/settings functionality later
                  },
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 15.0),
                border: InputBorder.none,
              ),
            ),
          );
        },
      ),
    );
  }
}

// HomeScreen Widget
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 50),
            const FunctionalSearchBar(),
            const SizedBox(height: 10),

            // Deals Image
            SizedBox(
              width: double.infinity,
              height: screenHeight * 0.32, // responsive height
              child: Image.asset(
                AppImages.deal1,
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(height: 15),
            // Categories Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
               Text(
  'Categories',
  style: appTextTheme.labelSmall?.copyWith(fontSize: 18), // optional override
),

                const Icon(Icons.arrow_forward_ios, size: 18),
              ],
            ),

            SizedBox(height: 10,)
,
            SizedBox(
            height:80,child:  ListView.builder(itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(right:8.0),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundColor: HomeMainLogic().categoryColors[index % HomeMainLogic().categoryColors.length],
                      child:Image.asset(
                      height: 12,
                              HomeMainLogic().categoryImages[index % HomeMainLogic().categoryImages.length],
                              fit: BoxFit.cover,
                            )
                    ),
                    SizedBox(height: 5),
                    Text(HomeMainLogic().categoryNames[index % HomeMainLogic().categoryNames.length], style: TextStyle(fontSize: 12)),
                  ],
                ),
              );
            },itemCount:10,scrollDirection: Axis.horizontal,),
            )
            
          ],
        ),
      ),
    );
  }
}
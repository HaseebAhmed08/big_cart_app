import 'package:cartapp/utils/splash_button.dart';
import 'package:flutter/material.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA), // Light background jaise screenshot mein
    
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
      
            IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.black,size: 28,),
        onPressed: () => Navigator.pop(context),
      ),
              // LEFT SPACE (same width as right)
              // const SizedBox(width: ),
      
              // CENTER TITLE
              Expanded(
                child: Center(
                  child: Text(
                    "Checkout",
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
      
          // Form Fields Container
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.03),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              children: [
                _buildTextField(icon: Icons.person_outline, hint: 'Name'),
                const SizedBox(height: 16),
                _buildTextField(icon: Icons.email_outlined, hint: 'Email address'),
                const SizedBox(height: 16),
                _buildTextField(icon: Icons.phone_outlined, hint: 'Phone number'),
                const SizedBox(height: 16),
                _buildTextField(icon: Icons.location_on_outlined, hint: 'Address'),
                const SizedBox(height: 16),
                _buildTextField(icon: Icons.pin_outlined, hint: 'Zip code'),
                const SizedBox(height: 16),
                _buildTextField(icon: Icons.location_city_outlined, hint: 'City'),
                const SizedBox(height: 16),
                _buildDropdownField(icon: Icons.public, hint: 'Country'),
              ],
            ),
          ),      
          // Next Button
          Padding(
            padding: const EdgeInsets.only(left: 16.0,right: 16.0,top: 180.0,),
            child: SplashButton(
                           onTap: () {
                             Navigator.push(context, MaterialPageRoute(builder: (_) => const CheckoutScreen()));
                           },
                           width: double.infinity,
                           height: 56,
                           child: Text('Finish', style: TextStyle(
                             fontFamily: 'Poppins',
                             fontWeight: FontWeight.bold,
                             color: Colors.white,
                             fontSize: 15,
                           )),
                         ),
          ),
        ],
      ),
    );
  }

  // Reusable TextField Widget
  Widget _buildTextField({required IconData icon, required String hint}) {
    return TextField(
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: Colors.grey[600]),
        hintText: hint,
        hintStyle: TextStyle(color: Colors.grey[500]),
        filled: true,
        fillColor: const Color(0xFFF5F5F5),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 18),
      ),
    );
  }

  // Dropdown for Country
  Widget _buildDropdownField({required IconData icon, required String hint}) {
    return TextField(
      readOnly: true, // Dropdown feel ke liye
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: Colors.grey[600]),
        hintText: hint,
        hintStyle: TextStyle(color: Colors.grey[500]),
        filled: true,
        fillColor: const Color(0xFFF5F5F5),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        suffixIcon: const Icon(Icons.keyboard_arrow_down, color: Colors.grey),
        contentPadding: const EdgeInsets.symmetric(vertical: 18),
      ),
      onTap: () {
        // Yahan country dropdown show kar sakte ho
      },
    );
  }
}
// import 'package:cartapp/core/app_colors.dart';
// import 'package:cartapp/core/app_images.dart';
// import 'package:cartapp/core/app_textstyle.dart';
// import 'package:cartapp/utils/splash_button.dart';
// import 'package:flutter/material.dart';

// class LoginAccount extends StatelessWidget {
//   const LoginAccount({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SizedBox.expand(
//         child: Stack(
//           fit: StackFit.expand,
//           children: [
//           // Background Image (No Zoom)
//           Positioned.fill(
//             child: Image.asset(
//               AppImages.women_With_Cart2,
//               fit: BoxFit.fitWidth,   // 👈 Zoom removed
//               alignment: Alignment.topCenter, // 👈 Image top se start hogi
//             ),
//           ),

//           // Back Arrow
//           Positioned(
//             top: 50,
//             left: 16,
//             child: IconButton(
//               icon: Icon(Icons.arrow_back, size: 32,color: Colors.white),
//               onPressed: () => Navigator.pushReplacementNamed(context, '/welcomeToLogin'),
//             ),
//           ),

//           // Welcome Text on Top
//           Positioned(
//             top: 50,
//             left: 0,
//             right: 0,
//             child: Center(
//               child: Text(
//                 'Welcome',
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 28,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//           ),

//           // Bottom White Card Section
//           Positioned(
//             bottom: 0,
//             left: 0,
//             right: 0,
//             child: Container(
//               width: double.infinity,
//               padding: const EdgeInsets.fromLTRB(24, 32, 24, 40),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(30),
//                   topRight: Radius.circular(30),
//                 ),
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisSize: MainAxisSize.min, // 👈 overflow fix
//                 children: [
//                   // Title
//                   Text(
//                     'Welcome',
//                     style: TextStyle(
//                       fontSize: 24,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.black87,
//                     ),
//                   ),
//                   SizedBox(height: 8),

//                   // Description
//                   Text(
//                     'Sign in to your account',
//                     style: appTextTheme.bodyMedium
//                   ),
//                   SizedBox(height: 20),

//                   // Continue with Google Button
//                   SizedBox(
//                     width: double.infinity,
//                     child: OutlinedButton.icon(
//                       onPressed: () {},
//                       icon: Image.asset(
//                         AppImages.GoogleIcon,
//                         width: 22,
//                         height: 22,
                       
//                       ),
//                       label: Text(
//                         'Continue with google',
//                         style: appTextTheme.bodyMedium
//                       ),
//                       style: OutlinedButton.styleFrom(
//                         padding: EdgeInsets.symmetric(vertical: 14),
//                         side: BorderSide(color: Colors.grey.shade300),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(12),
//                         ),
//                       ),
//                     ),
//                   ),

//                   SizedBox(height: 16),

                  
// SplashButton(child: Text('Create an account'), 
// onTap:(){}, width: double.infinity, height: 50),



//                   SizedBox(height: 20),

//                   // Login Text Button
//                   Center(
//                     child: TextButton(
//                       onPressed: () {},
//                       child: RichText(
//                         text: TextSpan(
//                           style: TextStyle(color: Colors.grey[600], fontSize: 14),
//                           children: [
//                             TextSpan(text: 'Already have an account? '),
//                             TextSpan(
//                               text: 'Login',
//                               style: TextStyle(
//                                 color: AppColors.primaryDark,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//         ),
//       ),
//     );
//   }
// }




// lib/screens/login_account.dart
import 'package:cartapp/core/app_colors.dart';
import 'package:cartapp/core/app_images.dart';
import 'package:cartapp/core/app_textstyle.dart';
import 'package:cartapp/utils/splash_button.dart';
import 'package:flutter/material.dart';

class LoginAccount extends StatelessWidget {
  const LoginAccount({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: [
            // Background Image
            Positioned.fill(
              child: Image.asset(
                AppImages.women_With_Cart2,
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
              ),
            ),

            // Dark Gradient Overlay
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black.withOpacity(0.5),
                      Colors.transparent,
                      Colors.white.withOpacity(0.95),
                    ],
                    stops: const [0.0, 0.4, 0.8],
                  ),
                ),
              ),
            ),

            // Back Button
            Positioned(
              top: 16,
              left: 16,
              child: IconButton(
                onPressed: () => Navigator.pushReplacementNamed(context, '/welcomeToLogin'),
                icon: const Icon(Icons.arrow_back_ios, color: Colors.white, size: 24),
                style: IconButton.styleFrom(
                  backgroundColor: Colors.black.withOpacity(0.3),
                  padding: const EdgeInsets.all(8),
                ),
              ),
            ),

            // Top "Welcome" Text
            const Positioned(
              top: 16,
              left: 0,
              right: 0,
              child: Center(
                child: Text(
                  'Welcome',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        offset: Offset(0, 1),
                        blurRadius: 4,
                        color: Colors.black54,
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Bottom White Card
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.fromLTRB(24, 32, 24, 40),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Welcome back !
                    Text('Welcome back !', style: theme.headlineLarge),
                    const SizedBox(height: 8),

                    // Sign in to your account
                    Text('Sign in to your account', style: theme.bodyMedium),
                    const SizedBox(height: 24),

                    // Email Field
                    _buildTextField(
                    context: context,
                      label: 'Email Address',
                      icon: Icons.email_outlined,
                    ),
                    const SizedBox(height: 16),

                    // Password Field
                    _buildTextField(
                    context: context,
                      label: 'Password',
                      icon: Icons.lock_outline,
                      isPassword: true,
                    ),
                    const SizedBox(height: 16),

                    // Remember me + Forgot password
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Checkbox(
                              value: false,
                              onChanged: (v) {},
                              activeColor: AppColors.primary,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4),
                              ),
                              side: const BorderSide(color: Colors.grey),
                            ),
                            Text('Remember me', style: theme.labelMedium),
                          ],
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'Forgot password',
                            style: theme.labelMedium!.copyWith(
                              color: AppColors.primary,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),

                    // Login Button (Green Gradient)
                    SplashButton(
                      onTap: () {},
                      width: double.infinity,
                      height: 56,
                      gradient: const LinearGradient(
                        colors: [Color(0xFF10B981), Color(0xFF059669)],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                      child: Text('Login', style: theme.labelLarge!.copyWith(color: Colors.white)),
                    ),
                    const SizedBox(height: 24),

                    // Don't have account? Sign up
                    Center(
                      child: TextButton(
                        onPressed: () {},
                        child: RichText(
                          text: TextSpan(
                            style: theme.bodyMedium,
                            children: [
                              const TextSpan(text: "Don't have an account? "),
                              TextSpan(
                                text: 'Sign up',
                                style: theme.labelMedium!.copyWith(
                                  color: AppColors.primary,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Reusable TextField with Visibility Toggle
  Widget _buildTextField({
    required String label,
    required IconData icon,
    bool isPassword = false,
    required var context
  }) {
    final theme = Theme.of(context).textTheme;
    bool obscureText = isPassword;

    return StatefulBuilder(
      builder: (context, setState) {
        return TextField(
          obscureText: isPassword ? obscureText : false,
          style: theme.bodyLarge,
          decoration: InputDecoration(
            labelText: label,
            labelStyle: theme.labelLarge,
            prefixIcon: Icon(icon, color: AppColors.textPrimary),
            suffixIcon: isPassword
                ? IconButton(
                    icon: Icon(
                      obscureText ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                      color: Colors.grey.shade500,
                    ),
                    onPressed: () => setState(() => obscureText = !obscureText),
                  )
                : null,
            filled: true,
            fillColor: const Color(0xFFF9FAFB),
            contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: AppColors.primary, width: 2),
            ),
          ),
        );
      },
    );
  }
}
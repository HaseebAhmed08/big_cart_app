// lib/screens/login_account.dart
import 'package:cartapp/core/app_colors.dart';
import 'package:cartapp/core/app_images.dart';
import 'package:cartapp/core/app_textstyle.dart';
import 'package:cartapp/utils/splash_button.dart';
import 'package:cartapp/viewmodels/login_screen_logic/login_logic.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginAccount extends StatelessWidget {
  const LoginAccount({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return Scaffold(
      // resizeToAvoidBottomInset: false, // bottom card ko fix rakhta hai

      body: Stack(
        // fit: StackFit.expand,
        children: [
          // Background Image
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: MediaQuery.of(context).size.height * 0.6,
            child: Image.asset(
              AppImages.women_With_Cart2,
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
            ),
          ),

          // Back Button
          Positioned(
            top: 50,
            left: 16,
            child: IconButton(
              onPressed: () => Navigator.pushReplacementNamed(context, '/welcomeToLogin'),
              icon: const Icon(Icons.arrow_back, color: Colors.white, size: 32),
              style: IconButton.styleFrom(
                backgroundColor: Colors.black.withOpacity(0.3),
                padding: const EdgeInsets.all(8),
              ),
            ),
          ),

          // Top "Welcome" Text
          const Positioned(
            top: 50,
            left: 0,
            right: 0,
            child: Center(
              child: Text(
                'Welcome',
                style: TextStyle(
                  fontSize: 28,
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
              padding: const EdgeInsets.fromLTRB(24, 20, 24, 40),
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
                  Text(
                    'Welcome back !',
                    style: appTextTheme.headlineLarge,
                  ),
                  const SizedBox(height: 8),

                  // Sign in to your account
                  Text('Sign in to your account', style: theme.bodyMedium),
                  const SizedBox(height: 24),

                  // Email Field
                  _buildTextField(
                    context: context,
                    label: 'Email Address',
                    isPassword: false,
                    isEmailField: true,
                  ),
                  const SizedBox(height: 8),

                  // Password Field
                  _buildTextField(
                    context: context,
                    label: 'Password',
                    isPassword: true,
                    isEmailField: false,
                  ),

                  // Remember me + Forgot password
                  Row(  
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Checkbox(
                            value: Provider.of<LoginViewModel>(context).rememberMe,
                            onChanged: (v) {
                              Provider.of<LoginViewModel>(context, listen: false).toggleRememberMe(v!);
                            },
                            activeColor: AppColors.primary,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
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
                            color: AppColors.textLink,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),

                  // Login Button
                  SplashButton(
                    onTap: () {
                                       Navigator.pushReplacementNamed(context, '/bottom_bar');

                    },
                    width: double.infinity,
                    height: 56,
                    child: Text('Login', style: TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.bold,
    color: Colors.white,
    fontSize: 15,
  )),
                  ),
                  const SizedBox(height: 20),

                  // Don't have account? Sign up
                  Center(
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
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              // yahan pe aapka navigation ya action
              Navigator.pushNamed(context, '/login_create_account');
            },
        ),
      ],
    ),
  ),
),
                  const SizedBox(height: 20),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Reusable TextField with Image Icons
  Widget _buildTextField({
    required String label,
    required bool isPassword,
    required BuildContext context,
    required bool isEmailField,
  }) {
    final loginVM = Provider.of<LoginViewModel>(context);

    return TextField(
      obscureText: isPassword ? loginVM.obscurePassword : false,
      style: appTextTheme.bodyMedium,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: appTextTheme.bodyMedium,
        prefixIcon: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Image.asset(
            isEmailField ? AppImages.messageIcon : AppImages.lockIcon,
            width: 24,
            height: 24,
            color: AppColors.textPrimary,
          ),
        ),
        suffixIcon: isPassword
            ? IconButton(
                icon: Image.asset(
                  AppImages.eyeIcon,
                  width: 24,
                  height: 24,
                  color: loginVM.obscurePassword ? Colors.grey.shade500 : AppColors.primary,
                ),
                onPressed: () => loginVM.togglePasswordVisibility(),
              )
            : null,
        filled: true,
        fillColor: const Color(0xFFF9FAFB),
        contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(color: AppColors.primary, width: 2),
        ),
      ),
    );
  }
}

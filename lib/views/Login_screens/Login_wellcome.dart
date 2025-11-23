import 'package:cartapp/core/app_colors.dart';
import 'package:cartapp/core/app_images.dart';
import 'package:cartapp/core/app_textstyle.dart';
import 'package:cartapp/utils/splash_button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class WellComeLogin extends StatelessWidget {
  const WellComeLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Stack(
          fit: StackFit.expand,
          children: [
          // Background Image (No Zoom)
          Positioned.fill(
            child: Image.asset(
              AppImages.women_With_Cart,
              fit: BoxFit.fitWidth,   // 👈 Zoom removed
              alignment: Alignment.topCenter, // 👈 Image top se start hogi
            ),
          ),

          // Back Arrow
          Positioned(
            top: 50,
            left: 16,
            child: IconButton(
              icon: Icon(Icons.arrow_back, size: 32,color: Colors.white),
              onPressed: () => Navigator.pushReplacementNamed(context, '/splash'),
            ),
          ),

          // Welcome Text on Top
          Positioned(
            top: 50,
            left: 0,
            right: 0,
            child: Center(
              child: Text(
                'Welcome',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          // Bottom White Card Section
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(24, 32, 24, 40),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min, // 👈 overflow fix
                children: [
                  // Title
                  Text(
                    'Welcome',
                    style: appTextTheme.headlineLarge
                  ),
                  SizedBox(height: 8),

                  // Description
                  Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed diam nonumy',
                    style: appTextTheme.headlineMedium
                  ),
                  SizedBox(height: 20),

                  // Continue with Google Button
                  // SizedBox(
                  //   width: double.infinity,
                  //   child: OutlinedButton.icon(
                    
                  //     onPressed: () {
                  //     Navigator.pushReplacementNamed(context, '/LoginAccount');
                  //     },
                  //     icon: Image.asset(
                  //       AppImages.GoogleIcon,
                  //       width: 22,
                  //       height: 22,
                       
                  //     ),
                  //     label: Text(
                  //       'Continue with google',
                  //       style: appTextTheme.bodyMedium
                  //     ),
                  //     style: OutlinedButton.styleFrom(
                  //       padding: EdgeInsets.symmetric(vertical: 14),
                  //       side: BorderSide(color: Colors.grey.shade300),
                  //       shape: RoundedRectangleBorder(
                  //         borderRadius: BorderRadius.circular(12),
                  //       ),
                  //     ),
                  //   ),
                  // ),



SizedBox(
  width: double.infinity,
  child: OutlinedButton(
    onPressed: () {
      Navigator.pushReplacementNamed(context, '/LoginAccount');
    },
    style: OutlinedButton.styleFrom(
      padding: EdgeInsets.symmetric(vertical: 14, horizontal: 16),
      side: BorderSide(color: Colors.grey.shade300),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start, // icon left
      children: [
              SizedBox(width: 40),

        Image.asset(
          AppImages.GoogleIcon,
          width: 22,
          height: 22,
        ),
        SizedBox(width: 30),
        Text(
          'Continue with Google',
          style: appTextTheme.bodyMedium,
        ),
      ],
    ),
  ),
),

                  SizedBox(height: 16),

                  
SplashButton(
child: Text('Create an account',style: TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.bold,
    color: Colors.white,
    fontSize: 15,
  ),), 
onTap:(){
              Navigator.pushNamed(context, '/login_create_account');

}, width: double.infinity, height: 50),



                  SizedBox(height: 20),

                  // Login Text Button
                  Center(
                    child: TextButton(
                      onPressed: () {},
                      child: RichText(
                        text: TextSpan(
                          style: TextStyle(color: Colors.grey[600], fontSize: 14),
                          children: [
                            TextSpan(text: 'Already have an account? '),
                            TextSpan(
                              text: 'Login',
                              style: TextStyle(
                                color: AppColors.primaryDark,
                                fontWeight: FontWeight.bold,

                              ),
                               recognizer: TapGestureRecognizer()
            ..onTap = () {
              // yahan pe aapka navigation ya action
      Navigator.pushReplacementNamed(context, '/LoginAccount');
            },
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
}

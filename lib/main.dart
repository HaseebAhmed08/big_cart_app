import 'package:cartapp/viewmodels/bottom_bar/home_main_logic.dart';
import 'package:cartapp/viewmodels/login_screen_logic/login_logic.dart';
import 'package:cartapp/viewmodels/splash_logic/splash_logic.dart';
import 'package:cartapp/views/Login_screens/login_account.dart';
import 'package:cartapp/views/Login_screens/login_create_account.dart';
import 'package:cartapp/views/home_screens/home_main.dart';
import 'package:cartapp/views/splash_screens/splash1.dart';
import 'package:cartapp/views/Login_screens/Login_wellcome.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SplashViewModel()),
        ChangeNotifierProvider(create: (_) => LoginViewModel()),
                ChangeNotifierProvider(create: (_) => HomeMainModel()),

      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/splash',
        routes: {
          '/splash': (context) => const SplashFirst(),
          '/welcomeToLogin': (context) => WellComeLogin(),
          '/LoginAccount': (context) => const LoginAccount(),
           '/login_create_account': (context) => const CreateAccount(), 

           '/home_main': (context) => const HomeMain(), 


        },
      ),
    );
  }
}

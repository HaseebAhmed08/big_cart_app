import 'package:cartapp/viewmodels/splash/splash_viewmodel.dart';
import 'package:cartapp/views/Login_screens/login_account.dart';
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
    return ChangeNotifierProvider(
      create: (context) => SplashViewModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/splash',
        routes: {
          '/splash': (context) => const SplashFirst(),
          '/welcomeToLogin': (context) =>  WellComeLogin(),
          '/LoginAccount': (context) => const LoginAccount(),

          
        },
      ),
    );
  }
}

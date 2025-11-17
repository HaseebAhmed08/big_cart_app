// lib/viewmodels/login_viewmodel.dart
import 'package:flutter/material.dart';

class LoginViewModel extends ChangeNotifier {
  bool _obscurePassword = true;
  bool get obscurePassword => _obscurePassword;

  bool _rememberMe = false;
  bool get rememberMe => _rememberMe;

  void togglePasswordVisibility() {
    _obscurePassword = !_obscurePassword;
    notifyListeners();
  }

  void toggleRememberMe(bool value) {
    _rememberMe = value;
    notifyListeners();
  }
}

import 'package:cartapp/core/app_colors.dart';
import 'package:flutter/material.dart';

final TextTheme appTextTheme = TextTheme(
  titleLarge: TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.bold,
    fontSize: 30,
    color: Colors.black87
  ),
  titleMedium: TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w600,
    fontSize: 20,
  ),
  bodyMedium: TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
    fontSize: 15,
  ),
  labelMedium: TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w500,
    fontSize: 12,
  ),
);

import 'package:flutter/material.dart';
import 'appColors.dart';

class my_theme_Data {
  static ThemeData lightTheme = ThemeData(
      primaryColor: AppColors.redColor,
      scaffoldBackgroundColor: AppColors.BackgroundColor,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.primaryColor,
        elevation: 0,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedItemColor: AppColors.primaryColor,
          showUnselectedLabels: false),
      bottomSheetTheme: BottomSheetThemeData(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      textTheme: const TextTheme(
          bodyLarge: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: AppColors.whiteColor)));

  static ThemeData DarkTheme = ThemeData(
      primaryColor: AppColors.redColor,
      scaffoldBackgroundColor: AppColors.BackgroundDarkColor,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.primaryColor,
        elevation: 0,
      ),
      textTheme: const TextTheme(
          bodyLarge: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: AppColors.blackColor)));
}

import 'package:ecommerce/common/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    cardColor: AppColors.productCardColor,
    primaryColor: AppColors.primaryColor,
    iconTheme: IconThemeData(color: AppColors.iconColor),
    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor: AppColors.productCardColor,
      iconTheme: IconThemeData(color: AppColors.iconColor),
      foregroundColor: Colors.white,
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        color: Color(0xFF1A1A1D),
        fontWeight: FontWeight.w700,
      ),
      titleMedium: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 18,
        color: Color(0xff1A1A1D),
      ),
      bodyMedium: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 16,
      ),
    ),
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
    scaffoldBackgroundColor: AppColors.bgColorLight,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      type: BottomNavigationBarType.fixed,
      selectedIconTheme: IconThemeData(color: AppColors.primaryColor, size: 30),
      unselectedIconTheme:
          const IconThemeData(color: Color(0xFFC8C9CB), size: 30),
      selectedItemColor: AppColors.primaryColor,
      unselectedItemColor: const Color(0xFFC8C9CB),
      showSelectedLabels: false,
      showUnselectedLabels: false,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColors.primaryColor,
      foregroundColor: Colors.white,
      shape: const CircleBorder(
        side: BorderSide(color: Colors.white, width: 5),
      ),
    ),
  );
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    cardColor:
        AppColors.productCardColorDark, // Use a dark variant of the card color
    primaryColor: AppColors.primaryColor,
    iconTheme: IconThemeData(color: Colors.white), // Light icons for dark theme
    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor: Colors.black, // Dark background for AppBar
      iconTheme: IconThemeData(color: Colors.white), // Light icons for AppBar
      foregroundColor: Colors.white, // Light text for AppBar
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        color: Colors.white, // Light text for dark theme
        fontWeight: FontWeight.w700,
      ),
      titleMedium: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 18,
        color: Colors.white, // Light text for dark theme
      ),
      bodyMedium: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 16,
        color: Colors.white, // Light text for dark theme
      ),
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primaryColor,
      brightness: Brightness.dark, // Set dark mode
    ),
    scaffoldBackgroundColor: Colors.black, // Dark background for scaffold
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.black, // Dark background for BottomNavigationBar
      type: BottomNavigationBarType.fixed,
      selectedIconTheme: IconThemeData(color: AppColors.primaryColor, size: 30),
      unselectedIconTheme: IconThemeData(
          color: Colors.grey, size: 30), // Light icons for dark theme
      selectedItemColor: AppColors.primaryColor,
      unselectedItemColor: Colors.grey, // Light text for dark theme
      showSelectedLabels: false,
      showUnselectedLabels: false,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColors.primaryColor,
      foregroundColor: Colors.white, // Light icon for FAB
      shape: const CircleBorder(
        side: BorderSide(color: Colors.black, width: 5), // Dark border for FAB
      ),
    ),
  );
}

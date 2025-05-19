import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Colors
  static const Color primaryColor = Color(0xFFFFFFFF);
  static const Color accentColor = Color(0xFFFF0000);
  static const Color backgroundColor = Color(0xFF121212);
  static const Color cardColor = Color(0xFF1E1E1E);
  static const Color textPrimaryColor = Color(0xFFFFFFFF);
  static const Color textSecondaryColor = Color(0xFFAAAAAA);
  static const Color dividerColor = Color(0xFF3A3A3A);

  // Text Styles
  static TextStyle get headingStyle => GoogleFonts.inter(
        fontSize: 18.0,
        fontWeight: FontWeight.bold,
        color: textPrimaryColor,
      );

  static TextStyle get subtitleStyle => GoogleFonts.inter(
        fontSize: 14.0,
        fontWeight: FontWeight.w500,
        color: textSecondaryColor,
      );

  static TextStyle get bodyStyle => GoogleFonts.inter(
        fontSize: 14.0,
        color: textPrimaryColor,
      );

  static TextStyle get smallStyle => GoogleFonts.inter(
        fontSize: 12.0,
        color: textSecondaryColor,
      );

  // Theme Data
  static ThemeData get darkTheme => ThemeData(
        primaryColor: primaryColor,
        scaffoldBackgroundColor: backgroundColor,
        colorScheme: const ColorScheme.dark(
          primary: primaryColor,
          secondary: accentColor,
          surface: cardColor,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: backgroundColor,
          elevation: 0,
          titleTextStyle: headingStyle,
        ),
        textTheme: TextTheme(
          displayLarge: headingStyle,
          bodyLarge: bodyStyle,
          bodyMedium: subtitleStyle,
          bodySmall: smallStyle,
        ),
        dividerTheme: const DividerThemeData(
          color: dividerColor,
          thickness: 1,
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: cardColor,
          selectedItemColor: primaryColor,
          unselectedItemColor: textSecondaryColor,
        ),
      );
}
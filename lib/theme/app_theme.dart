import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color primaryColor = Color(0xFF004AC6);
  static Color secondarycolor = Color(0xff2563EB).withValues(alpha: 0.2);
  static const Color backgroundColor = Color(0xFFFAF8FF);
  static const Color textprimaryColor = Color(0xFF191B23);
  static const Color textsecondarycolor = Color(0xFF434655);
  static const Color errorColor = Color(0xFFEF4444);
  static const Color successColor = Color(0xFF22C55E);

  static ThemeData lighttheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: primaryColor,
      onPrimary: Colors.white,
      secondary: secondarycolor,
      onSecondary: Colors.white,
      error: errorColor,
      onError: Colors.white,
      surface: backgroundColor,
      onSurface: textprimaryColor,
    ),
    textTheme: GoogleFonts.manropeTextTheme().copyWith(
      headlineLarge: GoogleFonts.manrope(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: textprimaryColor,
      ),
      headlineMedium: GoogleFonts.manrope(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: textprimaryColor,
      ),
      bodyLarge: GoogleFonts.manrope(
        fontSize: 16,
        fontWeight: FontWeight.normal,
        color: textsecondarycolor,
      ),
      bodyMedium: GoogleFonts.manrope(
        fontSize: 14,
        fontWeight: FontWeight.normal,
        color: textsecondarycolor,
      ),
    ),
  );
}

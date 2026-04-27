import 'package:flutter/material.dart';

class AppTheme {
  static const Color primarycolor = Color(0XFF2563EB);
  static Color secondarycolor = Color(0XFF2563EB).withValues(alpha: 0.20);
  static const Color backgroundcolor = Color(0XFFFAF8FF);
  static const Color textprimarycolor = Color(0XFF191B23);
  static const Color textsecondarycolor = Color(0XFF737686);
  static const Color errorcolor = Color(0XFFEF4444);
  static const Color successcolor = Color(0XFF22C55E);
  static const Color cardcolor = Color(0XFF2563EB);
  static Color bordercolor = Color(0XFFC3C6D7).withValues(alpha: 0.20);

  static ThemeData LightTheme = ThemeData(useMaterial3: true,colorScheme: ColorScheme.light
(brightness: Brightness.light, primary: primarycolor, onPrimary: Colors.white, secondary: s, onSecondary: onSecondary, error: error, onError: onError, surface: surface, onSurface: onSurface))
}

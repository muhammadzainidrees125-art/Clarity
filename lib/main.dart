import 'package:clarity/routes/app_pages.dart';
import 'package:clarity/routes/app_routes.dart';
import 'package:clarity/theme/app_theme.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => MyApp(), // Wrap your app
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the  root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clarity',
      theme: AppTheme.lightTheme,
      themeMode: ThemeMode.light,
      initialRoute: AppRoutes.onboarding,
      routes: AppPages.routes,
    );
  }
}

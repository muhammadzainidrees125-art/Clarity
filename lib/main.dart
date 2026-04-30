<<<<<<< HEAD
import 'package:clarity/feature/signin/screen/view/addtask_screen.dart';
import 'package:clarity/feature/signin/screen/view/wellcome_screen.dart';

import 'package:clarity/theme/app_theme.dart';
=======
import 'package:clarity/dashbord/screen/dashbord_screen.dart';
>>>>>>> 9e4b481c08d2330e500d907841c0b8aaf27631cc
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
<<<<<<< HEAD
      theme: AppTheme.lightTheme,
      themeMode: ThemeMode.light,

      home: AddtaskScreen(),
=======
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: DashbordScreen(),
>>>>>>> 9e4b481c08d2330e500d907841c0b8aaf27631cc
    );
  }
}

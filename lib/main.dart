import 'package:clarity/feature/signin/screen/signin_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the  root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clarity',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: SigninScreen(),
    );
  }
}

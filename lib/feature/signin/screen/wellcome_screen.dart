import 'package:clarity/widgets/custom_container.dart';
import 'package:flutter/material.dart';

class WellcomeScreen extends StatefulWidget {
  const WellcomeScreen({super.key});

  @override
  State<WellcomeScreen> createState() => _WellcomeScreenState();
}

class _WellcomeScreenState extends State<WellcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffffffff),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Clarity',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight(800),
                color: Color(0xff2563EB),
              ),
            ),
            Text(
              'Skip',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight(600),
                color: Color(0xff2563EB),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Color(0xffFAF8FF),
      body: Padding(
        padding: EdgeInsetsGeometry.all(25),
        child: Column(
          children: [CustomContainer(child: Image.asset('assets/Mouse.png'))],
        ),
      ),
    );
  }
}

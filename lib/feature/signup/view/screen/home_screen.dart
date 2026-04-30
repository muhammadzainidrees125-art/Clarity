import 'package:clarity/feature/signin/screen/custom_card.dart';
import 'package:clarity/feature/signup/view/screen/daily_progress.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Color(0XFF004AC6),
        foregroundColor: Color(0XFFFAF8FF),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        child: Icon(Icons.add),
      ),

      backgroundColor: Color(0XFFFAF8FF),
      body: Padding(
        padding: EdgeInsets.all(25),
        child: Column(
          children: [
            DailyProgress(),
            CustomCard(),
            SizedBox(height: 20),
            Container(
              height: 300,
              width: 350,
              color: Color(0XFF2563EB),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Text(textAlign: TextAlign.center, 'Hello, World! ')],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

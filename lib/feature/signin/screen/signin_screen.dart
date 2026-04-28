import 'package:flutter/material.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFAF8FF),
      body: Padding(
        padding: EdgeInsetsGeometry.all(12),
        child: Column(
          children: [
            Container(
              height: 130,
              width: 350,
              padding: EdgeInsets.all(12),

              child: Column(
                children: [
                  Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/clarity 1.png'),
                      ),
                    ),
                  ),
                  Text(
                    'Clarity',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight(800),
                      color: Color(0xff004AC6),
                    ),
                  ),
                  Text(
                    'Manage complex schedules with cognitive ease.',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight(400),
                      color: Color(0xff434655),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

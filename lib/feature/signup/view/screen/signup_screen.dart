import 'package:clarity/feature/core/custom_textfromfield.dart';
import 'package:clarity/widgets/custom_container.dart';
import 'package:clarity/widgets/custom_elevatedbutton.dart';
import 'package:clarity/widgets/custom_elevatedbuttonicon.dart';
import 'package:clarity/widgets/custom_securitycontainer.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: 20),
            Row(
              spacing: 10,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'join',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight(800)),
                ),
                Text(
                  'Clarity',
                  style: TextStyle(
                    color: Color(0XFF2563EB),
                    fontSize: 32,
                    fontWeight: FontWeight(800),
                  ),
                ),
              ],
            ),
            Text(
              'Start your journey toward cognitive calm.',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight(400),
                color: Color(0XFF434655),
              ),
            ),
            SizedBox(height: 20),
            CustomContainer(
              child: Column(
                spacing: 40,
                children: [
                  CustomTextfromfield(title: 'Full Name'),
                  CustomTextfromfield(title: 'Email Address'),
                  CustomTextfromfield(title: 'Password'),
                  CustomTextfromfield(title: 'Confirm Password'),
                  Column(
                    spacing: 20,
                    children: [
                      CustomElevatedbutton(
                        onPressed: () {},
                        title: 'Sign Up',
                        width: 300,
                      ),
                      Row(
                        spacing: 10,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 1,
                            width: 129,
                            decoration: BoxDecoration(color: Color(0XFFC3C6D7)),
                          ),
                          Text(
                            'OR',
                            style: TextStyle(
                              color: Color(0XFF737686),
                              fontSize: 12,
                              fontWeight: FontWeight(600),
                            ),
                          ),
                          Container(
                            height: 1,
                            width: 129,
                            decoration: BoxDecoration(color: Color(0XFFC3C6D7)),
                          ),
                        ],
                      ),
                      Customelevatedbuttonicon(
<<<<<<< HEAD
                        icon: Icons.apple,
=======
                        icon: Icons.account_circle_outlined,
>>>>>>> 7390dcfa3923e983cd1f7c9aa8964a94413c4625
                        color: Color(0XFF000000),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            Text(
              'Already have an account? Sign in',
              style: TextStyle(
                color: Color(0XFF434655),
                fontSize: 14,
                fontWeight: FontWeight(400),
              ),
            ),
            SizedBox(height: 20),
            CustomSecuritycontainer(
              icon: Icons.security,
              title:
                  'Your data is encrypted and stored'
                  'securely. We never share your personal'
                  'information with third parties.',
              color: Color(0XFFD0E1FB),
            ),
          ],
        ),
      ),
    );
  }
}

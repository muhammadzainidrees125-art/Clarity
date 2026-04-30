import 'package:clarity/feature/core/custom_textfromfield.dart';
import 'package:clarity/widgets/custom_container.dart';
import 'package:clarity/widgets/custom_elevatedbuttonicon.dart';
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
      body: SingleChildScrollView(
        padding: EdgeInsetsGeometry.all(12),
        child: Column(
          children: [
            SizedBox(height: 60),
            Container(
              height: 150,
              width: 350,
              padding: EdgeInsets.all(12),

              child: Column(
                children: [
                  Container(
                    height: 50,
                    width: 50,
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
            CustomContainer(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome back',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight(700)),
                  ),
                  Text(
                    'Sign in to your account',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight(400),
                      color: Color(0xff434655),
                    ),
                  ),
                  SizedBox(height: 20),

                  Column(
                    children: [
                      CustomTextfromfield(
                        prefixIcon: Icon(Icons.email),
                        title: 'EMAIL ADDRESS',
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Forgot Password?',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight(600),
                          color: Color(0xff004AC6),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  CustomTextfromfield(
                    title: 'PASSWORD',
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: Icon(Icons.remove_red_eye),
                  ),
                  SizedBox(height: 20),
                  Column(
                    children: [
                      Customelevatedbuttonicon(
                        icon: Icons.arrow_forward,
                        color: Color(0xff004AC6),
                      ),
                      SizedBox(height: 20),
                      Row(
                        spacing: 15,
                        children: [
                          Container(
                            height: 1,
                            width: 70,
                            color: Color(0xffC3C6D7),
                          ),
                          Text(
                            'OR CONTINUE WITH',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight(600),
                              color: Color(0xff434655),
                            ),
                          ),
                          Container(
                            height: 1,
                            width: 70,
                            color: Color(0xffC3C6D7),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        spacing: 16,
                        children: [
                          Container(
                            height: 50,
                            width: 133,
                            decoration: BoxDecoration(
                              color: Color(0xffffffff),
                              border: Border.all(color: Color(0xffC3C6D7)),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(5),
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                    color: Color(0xffffffff),
                                  ),
                                  child: Image.asset('assets/download.jpg'),
                                ),
                                Text(
                                  'Google',
                                  style: TextStyle(
                                    color: Color(0xff191B23),
                                    fontSize: 14,
                                    fontWeight: FontWeight(400),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 50,
                            width: 133,
                            decoration: BoxDecoration(
                              color: Color(0xffffffff),
                              border: Border.all(color: Color(0xffC3C6D7)),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(5),
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                    color: Color(0xffffffff),
                                  ),
                                  child: Image.asset('assets/Icon.png'),
                                ),
                                Text(
                                  'Apple',
                                  style: TextStyle(
                                    color: Color(0xff191B23),
                                    fontSize: 14,
                                    fontWeight: FontWeight(400),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Text(
              'Don\'t have an account? Sign Up',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight(400)),
            ),
          ],
        ),
      ),
    );
  }
}

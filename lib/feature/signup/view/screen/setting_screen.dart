import 'package:clarity/widgets/custom_container.dart';
import 'package:flutter/material.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFFAF8FF),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            CustomContainer(
              color: Color(0XFF2563EB),
              child: Column(
                children: [
                  Row(
                    spacing: 16,
                    children: [
                      Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage('assets/profilepictureimage.png'),
                          ),
                          borderRadius: BorderRadius.circular(70),
                          border: Border.all(
                            color: Color(0XFFFFFFFF),
                            width: 2,
                          ),
                          color: Color(0XFFFFFFFF),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Alex Rivera',
                            style: TextTheme.of(context).bodyLarge?.copyWith(
                              color: Color(0XFFEEEFFF),
                              fontWeight: FontWeight(600),
                            ),
                          ),
                          Text(
                            'alex.rivera@clarity.app',
                            style: TextTheme.of(
                              context,
                            ).bodyMedium?.copyWith(color: Color(0XFFEEEFFF)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Text(
              'PREFERENCES',
              style: TextTheme.of(context).headlineSmall?.copyWith(
                color: Color(0XFF434655),
                fontWeight: FontWeight(400),
              ),
            ),
            CustomContainer(
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Color(0xff004AC6).withValues(alpha: 0.1),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.notifications_active_outlined,
                              color: Color(0XFF004AC6),
                            ),
                            Column(children: []),
                          ],
                        ),
                      ),
                    ],
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

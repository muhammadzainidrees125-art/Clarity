import 'package:clarity/widgets/app_information_widget.dart';
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
      body: SingleChildScrollView(
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
                fontSize: 16,
              ),
            ),
            CustomContainer(
              child: Column(
                spacing: 30,
                children: [
                  Row(
                    spacing: 8,
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
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Notifications',
                            style: TextTheme.of(context).headlineSmall
                                ?.copyWith(
                                  color: Color(0XFF191B23),
                                  fontWeight: FontWeight(600),
                                  fontSize: 16,
                                ),
                          ),
                          Text(
                            'Manage alert sounds and '
                            'banners',
                          ),
                        ],
                      ),
                    ],
                  ),
                  Divider(height: 1, thickness: 1, color: Color(0XFFC3C6D7)),
                  Row(
                    spacing: 8,
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Color(0xff505F76).withValues(alpha: 0.1),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.dark_mode_outlined,
                              color: Color(0XFF505F76),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Dark Mode',
                            style: TextTheme.of(context).headlineSmall
                                ?.copyWith(
                                  color: Color(0XFF191B23),
                                  fontWeight: FontWeight(600),
                                  fontSize: 16,
                                ),
                          ),
                          Text('Use system appearance settings'),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Text(
              'ACCOUNT & SECURITY',
              style: TextTheme.of(context).titleLarge?.copyWith(
                color: Color(0XFF434655),
                fontWeight: FontWeight(400),
                fontSize: 16,
              ),
            ),
            CustomContainer(
              child: Column(
                spacing: 30,
                children: [
                  Row(
                    spacing: 8,
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Color(0xffFFDBCD),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.lock_outline_sharp,
                              color: Color(0XFF7D2D00),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Change Password',
                            style: TextTheme.of(context).headlineSmall
                                ?.copyWith(
                                  color: Color(0XFF191B23),
                                  fontWeight: FontWeight(600),
                                  fontSize: 16,
                                ),
                          ),
                          Text('Update your security credentials'),
                        ],
                      ),
                    ],
                  ),
                  Divider(height: 1, thickness: 1, color: Color(0XFFC3C6D7)),
                  Row(
                    spacing: 8,
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Color(0xffFFDAD6),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.delete_sweep_outlined,
                              color: Color(0XFFBA1A1A),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Reset Data',
                            style: TextTheme.of(context).headlineSmall
                                ?.copyWith(
                                  color: Color(0XFFBA1A1A),
                                  fontWeight: FontWeight(600),
                                  fontSize: 16,
                                ),
                          ),
                          Text(
                            'Wipe all tasks and local history',
                            style: TextTheme.of(context).bodyMedium?.copyWith(
                              color: Color(0XFF93000A),
                              fontSize: 14,
                              fontWeight: FontWeight(400),
                            ),
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
              'ABOUT',
              style: TextTheme.of(context).titleLarge?.copyWith(
                color: Color(0XFF434655),
                fontWeight: FontWeight(400),
                fontSize: 16,
              ),
            ),
            AppInformationWidget(),
          ],
        ),
      ),
    );
  }
}

import 'package:clarity/widgets/custom_container.dart';
import 'package:flutter/material.dart';

class AnalyticsScreen extends StatefulWidget {
  const AnalyticsScreen({super.key});

  @override
  State<AnalyticsScreen> createState() => _AnalyticsScreenState();
}

class _AnalyticsScreenState extends State<AnalyticsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFFAF8FF),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Analytics ',
              style: TextTheme.of(context).headlineLarge?.copyWith(
                color: Color(0XFF000000),
                fontSize: 32,
                fontWeight: FontWeight(800),
              ),
            ),
            Text(
              'Your productivity insights at a glance.',
              style: TextTheme.of(context).bodyMedium?.copyWith(
                color: Color(0XFF434655),
                fontSize: 14,
                fontWeight: FontWeight(400),
              ),
            ),
            SizedBox(height: 20),
            Row(
              spacing: 8,
              children: [
                CustomContainer(
                  borderRadius: BorderRadius.circular(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.check_circle_outline_rounded,
                        color: Color(0XFF004AC6),
                      ),
                      Text('TOTAL COMPLETED'),
                      Text(
                        '42',
                        style: TextTheme.of(context).bodyLarge?.copyWith(
                          color: Color(0XFF191B23),
                          fontSize: 24,
                          fontWeight: FontWeight(700),
                        ),
                      ),
                    ],
                  ),
                ),
                CustomContainer(
                  borderRadius: BorderRadius.circular(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.timer_outlined, color: Color(0XFF004AC6)),
                      Container(
                        height: 16,
                        width: 133,
                        child: Text('AVG TIME'),
                      ),
                      Text(
                        '45',
                        style: TextTheme.of(context).bodyLarge?.copyWith(
                          color: Color(0XFF191B23),
                          fontSize: 24,
                          fontWeight: FontWeight(700),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            CustomContainer(
              color: Color(0XFF004AC6),
              child: Column(
                spacing: 6,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.bolt_rounded, color: Color(0XFFEEEFFF)),
                  Text(
                    'CURRENT STREAK',
                    style: TextTheme.of(context).bodyLarge?.copyWith(
                      color: Color(0XFFEEEFFF),
                      fontSize: 12,
                      fontWeight: FontWeight(600),
                    ),
                  ),
                  Container(
                    width: 350,
                    child: Text(
                      '5 days',
                      style: TextTheme.of(context).bodyLarge?.copyWith(
                        color: Color(0XFFEEEFFF),
                        fontSize: 32,
                        fontWeight: FontWeight(800),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            CustomContainer(
              borderRadius: BorderRadius.circular(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Tasks Completed',
                    style: TextTheme.of(context).bodyLarge?.copyWith(
                      color: Color(0XFF191B23),
                      fontSize: 20,
                      fontWeight: FontWeight(700),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 230,
                        child: Text(
                          'Weekly activity overview',
                          style: TextTheme.of(context).bodyMedium?.copyWith(
                            color: Color(0XFF434655),
                            fontSize: 14,
                            fontWeight: FontWeight(400),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 190),
                        height: 29,
                        width: 70,
                        decoration: BoxDecoration(
                          color: Color(0XFFDBE1FF),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          spacing: 4,
                          children: [
                            Icon(
                              Icons.trending_up_outlined,
                              color: Color(0XFF004AC6),
                            ),
                            Text(
                              '12%',
                              style: TextTheme.of(context).bodyMedium?.copyWith(
                                color: Color(0XFF004AC6),
                                fontSize: 12,
                                fontWeight: FontWeight(600),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Mon'),
                      Text('Tue'),
                      Text('Wed'),
                      Text('Thu'),
                      Text('Fri'),
                      Text('Sat'),
                      Text('Sun'),
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

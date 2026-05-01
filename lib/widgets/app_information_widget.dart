import 'package:clarity/widgets/custom_container.dart';
import 'package:flutter/material.dart';

class AppInformationWidget extends StatefulWidget {
  const AppInformationWidget({super.key});

  @override
  State<AppInformationWidget> createState() => _AppInformationWidgetState();
}

class _AppInformationWidgetState extends State<AppInformationWidget> {
  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 20,
            children: [
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: Color(0XFF004AC6),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  Icons.check_circle_outline,
                  color: Color(0XFFFFFFFF),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Clarity Task Tracker',
                      style: TextTheme.of(context).headlineSmall?.copyWith(
                        fontWeight: FontWeight(400),
                        fontSize: 16,
                        color: Color(0XFF191B23),
                      ),
                    ),
                    Text(
                      'App Version 1.0.0 (Build 204)',
                      style: TextTheme.of(context).bodyMedium?.copyWith(
                        fontWeight: FontWeight(400),
                        fontSize: 14,
                        color: Color(0XFF434655),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Designed and built with focus by the'
                      'Better Craft Team. Helping you'
                      'achieve cognitive clarity every single'
                      'day.',
                      style: TextTheme.of(context).bodyMedium?.copyWith(
                        fontWeight: FontWeight(400),
                        fontSize: 14,
                        color: Color(0XFF434655),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

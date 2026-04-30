import 'package:clarity/widgets/custom_container.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatefulWidget {
  const CustomCard({super.key});

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      color: Color(0XFF2563EB),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            spacing: 8,
            children: [
              Icon(Icons.access_time_outlined, color: Color(0XFFEEEFFF)),
              Text(
                'Focus Time',
                style: TextTheme.of(
                  context,
                ).bodyMedium?.copyWith(color: Color(0XFFEEEFFF)),
              ),
            ],
          ),
          Text(
            '2h 15m',
            style: TextTheme.of(
              context,
            ).headlineLarge?.copyWith(color: Color(0XFFEEEFFF)),
          ),
          Text(
            'tracked today',
            style: TextTheme.of(
              context,
            ).bodySmall?.copyWith(color: Color(0XFFEEEFFF)),
          ),
        ],
      ),
    );
  }
}

import 'package:clarity/widgets/custom_container.dart';
import 'package:flutter/material.dart';

class DailyProgress extends StatefulWidget {
  const DailyProgress({super.key});

  @override
  State<DailyProgress> createState() => _DailyProgressState();
}

class _DailyProgressState extends State<DailyProgress> {
  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 10,
        children: [
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Daily Progress', style: TextTheme.of(context).titleLarge),
              Text(
                '  75%',
                style: TextTheme.of(
                  context,
                ).headlineSmall?.copyWith(color: Color(0XFF004AC6)),
              ),
            ],
          ),
          LinearProgressIndicator(
            value: 0.75,
            backgroundColor: Color(0XFFF1F5F9),
            color: Color(0XFF004AC6),
            minHeight: 8,
            borderRadius: BorderRadius.circular(10),
          ),
          Text(
            '6 to 8 tasks completed today',
            style: TextTheme.of(context).bodyMedium,
          ),
        ],
      ),
    );
  }
}

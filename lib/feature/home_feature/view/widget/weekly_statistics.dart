import 'package:clarity/core/widget/custom_container.dart';
import 'package:clarity/feature/task/data/model/task_model.dart';
import 'package:clarity/feature/task/view/controller/add_task_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WeeklyStatistics extends StatefulWidget {
  const WeeklyStatistics({super.key});

  @override
  State<WeeklyStatistics> createState() => _WeeklyStatisticsState();
}

class _WeeklyStatisticsState extends State<WeeklyStatistics> {
  Map<String, int> getWeeklyFocusTime(List<TaskModel> tasks) {
    Map<String, int> weeklyData = {
      'Mon': 0,
      'Tue': 0,
      'Wed': 0,
      'Thu': 0,
      'Fri': 0,
      'Sat': 0,
      'Sun': 0,
    };

    List<String> dayNames = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];

    for (var task in tasks) {
      if (task.completed && task.completedDate != null) {
        DateTime completedDate = task.completedDate!;
        DateTime now = DateTime.now();
        Duration difference = now.difference(completedDate);

        // Only include tasks from last 7 days
        if (difference.inDays < 7 && difference.inDays >= 0) {
          int dayOfWeek = completedDate.weekday % 7;
          String dayName = dayNames[dayOfWeek];
          weeklyData[dayName] =
              (weeklyData[dayName] ?? 0) + task.focusTimeMinutes;
        }
      }
    }

    return weeklyData;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddTaskCubit, List<TaskModel>>(
      builder: (context, tasks) {
        Map<String, int> weeklyData = getWeeklyFocusTime(tasks);
        int maxFocusTime = weeklyData.values.isEmpty
            ? 1
            : weeklyData.values.reduce((a, b) => a > b ? a : b);
        int totalWeeklyFocusTime = weeklyData.values.reduce((a, b) => a + b);

        return CustomContainer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 15,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Weekly Focus Time',
                    style: TextTheme.of(context).titleLarge,
                  ),
                  Text(
                    '${totalWeeklyFocusTime} min',
                    style: TextTheme.of(
                      context,
                    ).titleSmall?.copyWith(color: Color(0XFF004AC6)),
                  ),
                ],
              ),
              // Weekly Bar Chart
              SizedBox(
                height: 150,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: weeklyData.entries.map((entry) {
                    double barHeight = maxFocusTime > 0
                        ? (entry.value / maxFocusTime) * 100
                        : 0;

                    return Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          '${entry.value}',
                          style: TextTheme.of(
                            context,
                          ).bodySmall?.copyWith(fontSize: 10),
                        ),
                        SizedBox(height: 5),
                        Container(
                          width: 25,
                          height: barHeight,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: entry.value > 0
                                ? Color(0XFF004AC6)
                                : Color(0xffE8E8E8),
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(entry.key, style: TextTheme.of(context).bodySmall),
                      ],
                    );
                  }).toList(),
                ),
              ),
              SizedBox(height: 10),
              // Daily breakdown
              ...weeklyData.entries.map((entry) {
                int focusMinutes = entry.value;
                int hours = focusMinutes ~/ 60;
                int minutes = focusMinutes % 60;

                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(entry.key, style: TextTheme.of(context).bodyMedium),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: focusMinutes > 0
                            ? Color(0xffD0E1FB)
                            : Color(0xffF1F5F9),
                      ),
                      child: Text(
                        focusMinutes > 0 ? '${hours}h ${minutes}m' : 'No work',
                        style: TextTheme.of(context).bodySmall?.copyWith(
                          color: focusMinutes > 0
                              ? Color(0XFF004AC6)
                              : Color(0xff999999),
                        ),
                      ),
                    ),
                  ],
                );
              }).toList(),
            ],
          ),
        );
      },
    );
  }
}

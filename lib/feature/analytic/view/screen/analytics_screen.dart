import 'package:clarity/core/widget/custom_container.dart';
import 'package:clarity/core/widget/custom_securitycontainer.dart';
import 'package:clarity/feature/home_feature/view/widget/weekly_statistics.dart';
import 'package:clarity/feature/task/data/model/task_model.dart';
import 'package:clarity/feature/task/view/controller/add_task_cubit.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnalyticsScreen extends StatefulWidget {
  const AnalyticsScreen({super.key});

  @override
  State<AnalyticsScreen> createState() => _AnalyticsScreenState();
}

class _AnalyticsScreenState extends State<AnalyticsScreen> {
  int calculateCurrentStreak(List<TaskModel> tasks) {
    int streak = 0;
    DateTime currentDate = DateTime.now();

    for (int i = 0; i < 365; i++) {
      DateTime checkDate = currentDate.subtract(Duration(days: i));
      bool hasCompletedTaskOnDay = tasks.any(
        (task) =>
            task.completed &&
            task.completedDate != null &&
            task.completedDate!.year == checkDate.year &&
            task.completedDate!.month == checkDate.month &&
            task.completedDate!.day == checkDate.day,
      );

      if (hasCompletedTaskOnDay) {
        streak++;
      } else {
        break;
      }
    }
    return streak;
  }

  int calculateAverageTime(List<TaskModel> tasks) {
    List<TaskModel> completedTasks = tasks.where((t) => t.completed).toList();
    if (completedTasks.isEmpty) return 0;

    int totalTime = 0;
    for (var task in completedTasks) {
      totalTime += task.focusTimeMinutes;
    }
    return (totalTime / completedTasks.length).toInt();
  }

  Map<String, int> getWeeklyCompletedTasks(List<TaskModel> tasks) {
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

        if (difference.inDays < 7 && difference.inDays >= 0) {
          int dayOfWeek = completedDate.weekday % 7;
          String dayName = dayNames[dayOfWeek];
          weeklyData[dayName] = (weeklyData[dayName] ?? 0) + 1;
        }
      }
    }

    return weeklyData;
  }

  Map<String, double> getWeeklyFocusHours(List<TaskModel> tasks) {
    Map<String, double> weeklyHours = {
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

        if (difference.inDays < 7 && difference.inDays >= 0) {
          int dayOfWeek = completedDate.weekday % 7;
          String dayName = dayNames[dayOfWeek];
          weeklyHours[dayName] =
              (weeklyHours[dayName] ?? 0) + (task.focusTimeMinutes / 60);
        }
      }
    }

    return weeklyHours;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddTaskCubit, List<TaskModel>>(
      builder: (context, tasks) {
        int totalCompleted = tasks.where((t) => t.completed).length;
        int averageTime = calculateAverageTime(tasks);
        int currentStreak = calculateCurrentStreak(tasks);
        Map<String, int> weeklyCompleted = getWeeklyCompletedTasks(tasks);
        Map<String, double> weeklyFocusHours = getWeeklyFocusHours(tasks);

        List<FlSpot> chartSpots = [];
        int spotIndex = 0;
        weeklyFocusHours.forEach((day, hours) {
          chartSpots.add(FlSpot(spotIndex.toDouble(), hours.toDouble()));
          spotIndex++;
        });

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
                SizedBox(height: 37),
                Row(
                  spacing: 20,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: CustomContainer(
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
                              '$totalCompleted',
                              style: TextTheme.of(context).bodyLarge?.copyWith(
                                color: Color(0XFF191B23),
                                fontSize: 24,
                                fontWeight: FontWeight(700),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: CustomContainer(
                        borderRadius: BorderRadius.circular(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.timer_outlined,
                              color: Color(0XFF004AC6),
                            ),
                            Text('AVG TIME'),
                            Text(
                              '$averageTime',
                              style: TextTheme.of(context).bodyLarge?.copyWith(
                                color: Color(0XFF191B23),
                                fontSize: 24,
                                fontWeight: FontWeight(700),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                CustomContainer(
                  width: double.infinity,
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
                      Text(
                        '$currentStreak days',
                        style: TextTheme.of(context).bodyLarge?.copyWith(
                          color: Color(0XFFEEEFFF),
                          fontSize: 32,
                          fontWeight: FontWeight(800),
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
                                  '${totalCompleted > 0 ? ((totalCompleted / (tasks.length > 0 ? tasks.length : 1)) * 100).toStringAsFixed(0) : 0}%',
                                  style: TextTheme.of(context).bodyMedium
                                      ?.copyWith(
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
                        children: weeklyCompleted.keys.map((day) {
                          return Column(
                            children: [
                              Text(
                                '${weeklyCompleted[day]}',
                                style: TextTheme.of(context).bodySmall
                                    ?.copyWith(fontWeight: FontWeight(600)),
                              ),
                              SizedBox(height: 5),
                              Text(day),
                            ],
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),

                WeeklyStatistics(),
                CustomSecuritycontainer(
                  icon: Icons.lightbulb_rounded,
                  title:
                      'Youre most productive on'
                      '**Wednesdays** before 11:00 AM.'
                      'Try scheduling your deep work tasks'
                      'then! ',
                  color: Color(0XFFF3F3FE),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

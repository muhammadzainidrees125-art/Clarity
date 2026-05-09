import 'package:clarity/core/widget/custom_container.dart';
import 'package:clarity/feature/task/data/model/task_model.dart';
import 'package:clarity/feature/task/view/controller/add_task_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DailyProgress extends StatefulWidget {
  const DailyProgress({super.key});

  @override
  State<DailyProgress> createState() => _DailyProgressState();
}

class _DailyProgressState extends State<DailyProgress> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddTaskCubit, List<TaskModel>>(
      builder: (context, tasks) {
        // Calculate completion percentage
        int completedTasks = tasks.where((task) => task.completed).length;
        int totalTasks = tasks.length;
        double progressPercentage = totalTasks > 0
            ? (completedTasks / totalTasks) * 100
            : 0;

        // Calculate today's focus time
        int todayFocusTime = 0;
        for (var task in tasks) {
          if (task.completed &&
              task.completedDate != null &&
              task.completedDate!.year == DateTime.now().year &&
              task.completedDate!.month == DateTime.now().month &&
              task.completedDate!.day == DateTime.now().day) {
            todayFocusTime += task.focusTimeMinutes;
          }
        }

        return CustomContainer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 10,
            children: [
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Daily Progress',
                    style: TextTheme.of(context).titleLarge,
                  ),
                  Text(
                    '${progressPercentage.toStringAsFixed(0)}%',
                    style: TextTheme.of(
                      context,
                    ).headlineSmall?.copyWith(color: Color(0XFF004AC6)),
                  ),
                ],
              ),
              LinearProgressIndicator(
                value: progressPercentage / 100,
                backgroundColor: Color(0XFFF1F5F9),
                color: Color(0XFF004AC6),
                minHeight: 8,
                borderRadius: BorderRadius.circular(10),
              ),
              Text(
                '$completedTasks of $totalTasks tasks completed',
                style: TextTheme.of(context).bodyMedium,
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Today\'s Focus Time',
                        style: TextTheme.of(
                          context,
                        ).bodySmall?.copyWith(color: Color(0xff999999)),
                      ),
                      SizedBox(height: 5),
                      Text(
                        '${todayFocusTime} min',
                        style: TextTheme.of(
                          context,
                        ).titleMedium?.copyWith(color: Color(0XFF004AC6)),
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color(0xffF1F5F9),
                    ),
                    child: Text(
                      '📊 ${DateTime.now().toString().split(' ')[0]}',
                      style: TextTheme.of(context).bodySmall,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

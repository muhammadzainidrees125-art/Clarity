import 'package:clarity/feature/home_feature/view/widget/custom_card.dart';
import 'package:clarity/feature/home_feature/view/widget/daily_progress.dart';
import 'package:clarity/routes/app_routes.dart';
import 'package:clarity/core/widget/custom_container.dart';
import 'package:clarity/feature/task/data/model/task_model.dart';
import 'package:clarity/feature/task/view/controller/add_task_cubit.dart';
import 'package:clarity/feature/task/view/screen/task_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddTaskCubit, List<TaskModel>>(
      builder: (context, tasks) {
        return Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.task);
            },
            backgroundColor: Color(0XFF004AC6),
            foregroundColor: Color(0XFFFAF8FF),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
            ),
            child: Icon(Icons.add),
          ),
          backgroundColor: Color(0XFFFAF8FF),
          body: HomeScreenContent(tasks: tasks),
        );
      },
    );
  }
}

class HomeScreenContent extends StatefulWidget {
  const HomeScreenContent({super.key, required this.tasks});

  final List<TaskModel> tasks;

  @override
  State<HomeScreenContent> createState() => _HomeScreenContentState();
}

enum TaskStatus { all, pending, completed }

class _HomeScreenContentState extends State<HomeScreenContent> {
  TaskStatus selectedStatus = TaskStatus.all;

  List<TaskModel> get filteredTasks {
    if (selectedStatus == TaskStatus.all) return widget.tasks;
    if (selectedStatus == TaskStatus.pending) {
      return widget.tasks.where((task) => !task.completed).toList();
    }
    return widget.tasks.where((task) => task.completed).toList();
  }

  Color getBadgeColor(String? priority) {
    switch (priority?.toLowerCase()) {
      case 'high':
        return Color(0xffFFDAD6);
      case 'medium':
        return Color(0xffFFDBCD);
      case 'low':
        return Color(0xffD0E1FB);
      default:
        return Color(0xffD0E1FB);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        spacing: 12,
        children: [
          DailyProgress(),
          CustomCard(),
          TaskChoiceChipSection(
            selectedIndex: selectedStatus.index,
            onSelected: (index) {
              setState(() {
                selectedStatus = TaskStatus.values[index];
              });
            },
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            spacing: 15,
            children: filteredTasks.map((task) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TaskDetails(
                        task: task,
                        taskIndex: widget.tasks.indexOf(task),
                      ),
                    ),
                  );
                },
                child: CustomContainer(
                  border: Border(
                    left: BorderSide(
                      color: task.completed
                          ? Color(0XFF004AC6)
                          : Color(0xffBA1A1A),
                      width: 4,
                    ),
                  ),
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Icon(
                            task.completed
                                ? Icons.check_circle_outline
                                : Icons.radio_button_off_outlined,
                            color: task.completed
                                ? Color(0xff004AC6)
                                : Color(0xffA1A1A1),
                          ),
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  task.taskTitle ?? '',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight(500),
                                    color: Color(0xff191B23),
                                  ),
                                ),
                                SizedBox(height: 5),
                                Row(
                                  spacing: 10,
                                  children: [
                                    Image.asset('assets/Icon (2).png'),
                                    Text(task.dueDate ?? ''),
                                    Container(
                                      padding: EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                          100,
                                        ),
                                        color: getBadgeColor(
                                          task.priorityLevel,
                                        ),
                                      ),
                                      child: Text(
                                        task.priorityLevel ?? 'Medium',
                                        style: TextStyle(
                                          color: task.completed
                                              ? Color(0xff54647A)
                                              : Color(0xffBA1A1A),
                                          fontSize: 10,
                                          fontWeight: FontWeight(700),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

class TaskChoiceChipSection extends StatelessWidget {
  const TaskChoiceChipSection({
    super.key,
    required this.selectedIndex,
    required this.onSelected,
  });

  final int selectedIndex;
  final ValueChanged<int> onSelected;

  final List<String> items = const ['All', 'Pending', 'Completed'];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: List.generate(items.length, (index) {
          return Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: CustomChoiceChip(
              title: items[index],
              isSelected: selectedIndex == index,
              onTap: () => onSelected(index),
            ),
          );
        }),
      ),
    );
  }
}

class CustomChoiceChip extends StatelessWidget {
  const CustomChoiceChip({
    super.key,
    required this.isSelected,
    required this.title,
    required this.onTap,
  });

  final bool isSelected;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      padding: EdgeInsets.all(4),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      backgroundColor: Colors.grey.shade200,
      selectedColor: Color(0XFF004AC6),
      showCheckmark: false,
      label: Text(
        title,
        style: TextStyle(color: isSelected ? Colors.white : Colors.black),
      ),
      selected: isSelected,
      onSelected: (_) => onTap(),
    );
  }
}

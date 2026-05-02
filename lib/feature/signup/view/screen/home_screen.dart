import 'package:clarity/feature/signin/screen/custom_card.dart';
import 'package:clarity/feature/signup/view/widgets/daily_progress.dart';
import 'package:clarity/widgets/custom_container.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

enum TaskStatus { all, pending, completed }

class TaskItem {
  TaskItem({
    required this.title,
    required this.subtitle,
    required this.badgeText,
    required this.badgeColor,
    required this.completed,
    required this.hasLeftBorder,
  });

  final String title;
  final String subtitle;
  final String badgeText;
  final Color badgeColor;
  final bool completed;
  final bool hasLeftBorder;
}

class _HomeScreenState extends State<HomeScreen> {
  TaskStatus selectedStatus = TaskStatus.all;

  final List<TaskItem> tasks = [
    TaskItem(
      title: 'Finalize Q4 Marketing Budget',
      subtitle: 'Today, 10:00 AM',
      badgeText: 'HIGH',
      badgeColor: Color(0xffFFDAD6),
      completed: false,
      hasLeftBorder: true,
    ),
    TaskItem(
      title: 'Update Design System Tokens',
      subtitle: 'Today, 2:30 PM',
      badgeText: 'MEDIUM',
      badgeColor: Color(0xffFFDBCD),
      completed: false,
      hasLeftBorder: true,
    ),
    TaskItem(
      title: 'Morning Standup Meeting',
      subtitle: 'Completed 9:15 AM',
      badgeText: 'ROUTINE',
      badgeColor: Color(0xffD0E1FB),
      completed: true,
      hasLeftBorder: true,
    ),
  ];

  List<TaskItem> get filteredTasks {
    if (selectedStatus == TaskStatus.all) return tasks;
    if (selectedStatus == TaskStatus.pending) {
      return tasks.where((task) => !task.completed).toList();
    }
    return tasks.where((task) => task.completed).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Color(0XFF004AC6),
        foregroundColor: Color(0XFFFAF8FF),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        child: Icon(Icons.add),
      ),

      backgroundColor: Color(0XFFFAF8FF),
      body: SingleChildScrollView(
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
                return CustomContainer(
                  border: task.hasLeftBorder
                      ? Border(
                          left: BorderSide(
                            color: task.completed
                                ? Color(0XFF004AC6)
                                : Color(0xffBA1A1A),
                            width: 4,
                          ),
                        )
                      : null,
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
                                  task.title,
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
                                    Text(task.subtitle),
                                    Container(
                                      padding: EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                          100,
                                        ),
                                        color: task.badgeColor,
                                      ),
                                      child: Column(
                                        children: [
                                          Text(
                                            task.badgeText,
                                            style: TextStyle(
                                              color: task.completed
                                                  ? Color(0xff54647A)
                                                  : Color(0xffBA1A1A),
                                              fontSize: 10,
                                              fontWeight: FontWeight(700),
                                            ),
                                          ),
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
                    ],
                  ),
                );
              }).toList(),
            ),
          ],
        ),
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

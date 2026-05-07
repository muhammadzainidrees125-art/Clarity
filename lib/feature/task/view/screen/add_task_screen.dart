import 'package:clarity/core/widget/custom_textfromfield.dart';
import 'package:clarity/core/widget/custom_elevatedbutton.dart';
import 'package:clarity/feature/task/view/controller/add_task_cubit.dart';
<<<<<<< HEAD
import 'package:clarity/feature/task/view/state/add_task_state.dart';
import 'package:clarity/feature/task/view/widget/priority_selector.dart';
import 'package:clarity/feature/task/view/widget/tag_input_field.dart';
=======
>>>>>>> 1e1a00af5f8471e94e67a9113bf314bb530924a5
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
<<<<<<< HEAD
  final controller = AddTaskCubit();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (_) => AddTaskCubit(), child: AddTaskView());
  }
}

class AddTaskView extends StatelessWidget {
  const AddTaskView({super.key});

  @override
  Widget build(BuildContext context) {
=======
  @override
  Widget build(BuildContext context) {
>>>>>>> 1e1a00af5f8471e94e67a9113bf314bb530924a5
    final controller = context.read<AddTaskCubit>();
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back),
        ),
        title: Text('Add Task', style: TextTheme.of(context).headlineMedium),
      ),
<<<<<<< HEAD
      backgroundColor: const Color(0xffFAF8FF),
=======

      backgroundColor: const Color(0xffFAF8FF),

>>>>>>> 1e1a00af5f8471e94e67a9113bf314bb530924a5
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          spacing: 10,
          children: [
            /// TITLE
            CustomTextfromfield(
              controller: controller.title,
              title: 'Task Title *',
            ),

            /// DESCRIPTION
            CustomTextfromfield(
              controller: controller.description,
              maxlines: 4,
              title: 'Description',
            ),

            const SizedBox(height: 10),

            /// DUE DATE
            CustomTextfromfield(
              controller: controller.duedate,
              title: 'Due Date',
              suffixIcon: const Icon(Icons.calendar_today_outlined),
            ),

            /// PRIORITY
            PrioritySelector(
              onChanged: (value) {
<<<<<<< HEAD
                controller.setPriority(value);
=======
                context.read<AddTaskCubit>().setPriority(value);
>>>>>>> 1e1a00af5f8471e94e67a9113bf314bb530924a5
              },
            ),

            const SizedBox(height: 15),

            /// TAGS
            TagsInputField(
              title: 'Tags',
              onChanged: (list) {
<<<<<<< HEAD
                controller.setTags(list);
=======
                context.read<AddTaskCubit>().setTags(list);
>>>>>>> 1e1a00af5f8471e94e67a9113bf314bb530924a5
              },
            ),

            /// BUTTONS
            Row(
              spacing: 8,
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Cancel'),
                  ),
                ),

                Expanded(
<<<<<<< HEAD
                  child: BlocBuilder<AddTaskCubit, AddTaskState>(
                    builder: (context, state) {
                      final controller = context.read<AddTaskCubit>();
                      return CustomElevatedbutton(
                        width: double.infinity,
                        onPressed: state.isLoading
                            ? null
                            : () {
                                controller.saveTask();

                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text("Task Added Successfully ✅"),
                                  ),
                                );
                              },
                        title: state.isLoading ? 'Saving...' : 'Save Task',
                      );
                    },
=======
                  child: CustomElevatedbutton(
                    onPressed: () {
                      context.read<AddTaskCubit>().saveTask(context);

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Task Added Successfully ✅"),
                        ),
                      );
                    },
                    fontsize: 13,
                    title: 'Save Task',
                    width: double.infinity,
>>>>>>> 1e1a00af5f8471e94e67a9113bf314bb530924a5
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

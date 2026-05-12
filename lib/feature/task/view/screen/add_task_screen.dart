import 'package:clarity/core/widget/custom_textfromfield.dart';
import 'package:clarity/core/widget/custom_elevatedbutton.dart';
import 'package:clarity/feature/task/view/controller/add_task_cubit.dart';
import 'package:clarity/feature/task/data/model/task_model.dart';
import 'package:clarity/feature/task/view/widget/priority_selector.dart';
import 'package:clarity/feature/task/view/widget/tag_input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const AddTaskView();
  }
}

class AddTaskView extends StatelessWidget {
  const AddTaskView({super.key});

  @override
  Widget build(BuildContext context) {
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
      backgroundColor: const Color(0xffFAF8FF),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
              suffixIcon: IconButton(
                onPressed: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                  );

                  if (pickedDate != null) {
                    controller.duedate.text =
                        "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
                  }
                },
                icon: const Icon(Icons.calendar_month),
              ),
            ),

            /// PRIORITY
            PrioritySelector(
              onChanged: (value) {
                controller.setPriority(value);
              },
            ),

            const SizedBox(height: 15),

            /// TAGS
            TagsInputField(
              title: 'Tags',
              onChanged: (list) {
                controller.setTags(list);
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
                  child: BlocBuilder<AddTaskCubit, List<TaskModel>>(
                    builder: (context, tasks) {
                      final controller = context.read<AddTaskCubit>();
                      return CustomElevatedbutton(
                        width: double.infinity,
                        onPressed: () async {
                          await controller.saveTask(context);
                        },
                        title: 'Save Task',
                      );
                    },
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

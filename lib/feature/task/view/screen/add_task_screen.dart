import 'package:clarity/core/widget/custom_textfromfield.dart';
import 'package:clarity/core/widget/custom_elevatedbutton.dart';
import 'package:clarity/feature/task/data/model/task_model.dart';
import 'package:clarity/feature/task/data/source/task_data.dart';
import 'package:clarity/feature/task/view/controller/add_task_controller.dart';
import 'package:flutter/material.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final controller = AddTaskController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: Text('Add Task', style: TextTheme.of(context).headlineMedium),
      ),
      backgroundColor: Color(0xffFAF8FF),
      body: SingleChildScrollView(
        padding: EdgeInsetsGeometry.all(20),
        child: Column(
          spacing: 10,
          children: [
            CustomTextfromfield(
              controller: controller.title,
              title: 'Task Title *',
            ),
            CustomTextfromfield(
              controller: controller.description,
              maxlines: 4,
              title: 'Description',
            ),
            SizedBox(height: 10),
            CustomTextfromfield(
              controller: controller.duedate,
              title: 'Due Date',
              suffixIcon: Icon(Icons.calendar_today_outlined),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PrioritySelector(
                  onChanged: (value) {
                    setState(() {
                      controller.selectedPriority = value;
                    });
                  },
                ),

                SizedBox(height: 15),
                CustomTextfromfield(
                  controller: TextEditingController(),
                  title: 'Tags',
                ),
                TagsInputField(
                  title: 'Taggggggs',
                  onChanged: (p0) {
                    controller.tags = p0;
                  },
                ),
              ],
            ),
            Row(
              spacing: 8,
              children: [
                Expanded(
                  child: TextButton(onPressed: () {}, child: Text('Cancel')),
                ),
                Expanded(
                  child: CustomElevatedbutton(
                    onPressed: () => controller.saveTask(),
                    fontsize: 13,
                    title: 'Save Task',
                    width: double.infinity,
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

class PrioritySelector extends StatefulWidget {
  final Function(String) onChanged;
  const PrioritySelector({super.key, required this.onChanged});

  @override
  State<PrioritySelector> createState() => _PrioritySelectorState();
}

class _PrioritySelectorState extends State<PrioritySelector> {
  String selectedPriority = 'Medium';

  List<String> priorities = ['Low', 'Medium', 'High'];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Priority Level'),
        SizedBox(height: 8),

        Wrap(
          spacing: 10,
          children: priorities.map((item) {
            return ChoiceChip(
              showCheckmark: false,
              label: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: 8,
                    width: 8,
                    decoration: BoxDecoration(
                      color: item == 'Low'
                          ? Color(0xff22C55E)
                          : item == 'Medium'
                          ? Color(0xffF59E0B)
                          : Color(0xffEF4444),
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                  SizedBox(width: 5),
                  Text(item),
                ],
              ),

              selected: selectedPriority == item,

              selectedColor: Color(0xffD0E1FB),
              backgroundColor: Color(0xffF3F3FE),

              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
                side: BorderSide(color: Color(0xffC3C6D7)),
              ),

              onSelected: (val) {
                setState(() {
                  selectedPriority = item;
                });
                widget.onChanged(item);
              },
            );
          }).toList(),
        ),
      ],
    );
  }
}

class TagsInputField extends StatefulWidget {
  final String title;
  final Function(List<String>) onChanged;

  const TagsInputField({
    super.key,
    required this.title,
    required this.onChanged,
  });

  @override
  State<TagsInputField> createState() => _TagsInputFieldState();
}

class _TagsInputFieldState extends State<TagsInputField> {
  final TextEditingController _controller = TextEditingController();
  List<String> tags = [];

  void addTag(String value) {
    if (value.trim().isEmpty) return;

    setState(() {
      tags.add(value.trim());
      _controller.clear();
    });

    widget.onChanged(tags); // return list to parent
  }

  void removeTag(String tag) {
    setState(() {
      tags.remove(tag);
    });

    widget.onChanged(tags);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.title),

        const SizedBox(height: 8),

        TextField(
          controller: _controller,
          onSubmitted: addTag,
          decoration: const InputDecoration(
            hintText: "Type tag and press enter",
            border: OutlineInputBorder(),
          ),
        ),

        const SizedBox(height: 10),

        Wrap(
          spacing: 8,
          children: tags.map((tag) {
            return Chip(
              label: Text(tag),
              deleteIcon: const Icon(Icons.close),
              onDeleted: () => removeTag(tag),
            );
          }).toList(),
        ),
      ],
    );
  }
}

import 'package:clarity/feature/task/data/model/task_model.dart';
import 'package:clarity/feature/task/data/source/task_data.dart';
import 'package:flutter/material.dart';

class AddTaskController {
  final title = TextEditingController();
  final description = TextEditingController();
  final duedate = TextEditingController();
  String selectedPriority = "Medium";
  List<String> tags = [];
  void saveTask() {
    final task = TaskModel(
      taskTitle: title.text,
      description: description.text,
      dueDate: duedate.text,
      priorityLevel: selectedPriority,
      tags: tags,
      suggestedtasks: '',
    );
    listoftask.add(task);
  }
}

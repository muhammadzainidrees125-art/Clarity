import 'package:clarity/feature/task/data/model/task_model.dart';
import 'package:clarity/feature/task/data/source/task_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddTaskCubit extends Cubit<List<TaskModel>> {
  AddTaskCubit() : super(listoftask);
  final title = TextEditingController();
  final description = TextEditingController();
  final duedate = TextEditingController();
  String priority = "Medium";
  List<String> tags = [];

  void setPriority(String value) {
    priority = value;
  }

  void setTags(List<String> value) {
    tags = value;
  }

  void saveTask(BuildContext context) {
    final task = TaskModel(
      taskTitle: title.text,
      description: description.text,
      dueDate: duedate.text,
      priorityLevel: priority,
      tags: tags,
      completed: false,
    );

    listoftask.add(task);
    emit(List.from(listoftask));

    // Clear controllers
    title.clear();
    description.clear();
    duedate.clear();
    priority = "Medium";
    tags = [];

    // Pop the screen
    Navigator.pop(context);
  }

  void toggleTaskCompletion(int index) {
    listoftask[index].completed = !listoftask[index].completed;
    emit(List.from(listoftask));
  }

  void completeTask(int index) {
    listoftask[index].completed = true;
    emit(List.from(listoftask));
  }

  void removeTask(int index) {
    listoftask.removeAt(index);
    emit(List.from(listoftask));
  }
}

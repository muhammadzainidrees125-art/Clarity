import 'package:clarity/feature/task/data/model/task_model.dart';
import 'package:clarity/feature/task/data/source/task_data.dart';
import 'package:clarity/feature/task/view/state/add_task_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddTaskCubit extends Cubit<AddTaskState> {
  AddTaskCubit() : super(const AddTaskState());

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

  Future<void> saveTask() async {
    emit(state.copyWith(isLoading: true));
    final task = TaskModel(
      taskTitle: title.text,
      description: description.text,
      dueDate: duedate.text,
      priorityLevel: priority,
      tags: tags,
    );

    listoftask.add(task);

    await Future.delayed(const Duration(seconds: 2));

    emit(state.copyWith(isLoading: false));
  }
}

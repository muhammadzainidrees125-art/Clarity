import 'package:clarity/feature/task/data/model/task_model.dart';
import 'package:clarity/feature/task/data/source/task_data.dart';
<<<<<<< HEAD
import 'package:clarity/feature/task/view/state/add_task_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddTaskCubit extends Cubit<AddTaskState> {
  AddTaskCubit() : super(const AddTaskState());

  final title = TextEditingController();
  final description = TextEditingController();
  final duedate = TextEditingController();

=======
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddTaskCubit extends Cubit<List<TaskModel>> {
  AddTaskCubit() : super(listoftask);
  final title = TextEditingController();
  final description = TextEditingController();
  final duedate = TextEditingController();
>>>>>>> 1e1a00af5f8471e94e67a9113bf314bb530924a5
  String priority = "Medium";
  List<String> tags = [];

  void setPriority(String value) {
    priority = value;
  }

  void setTags(List<String> value) {
    tags = value;
  }

<<<<<<< HEAD
  Future<void> saveTask() async {
    emit(state.copyWith(isLoading: true));
=======
  void saveTask(BuildContext context) {
>>>>>>> 1e1a00af5f8471e94e67a9113bf314bb530924a5
    final task = TaskModel(
      taskTitle: title.text,
      description: description.text,
      dueDate: duedate.text,
      priorityLevel: priority,
      tags: tags,
<<<<<<< HEAD
    );

    listoftask.add(task);

    await Future.delayed(const Duration(seconds: 2));

    emit(state.copyWith(isLoading: false));
=======
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
>>>>>>> 1e1a00af5f8471e94e67a9113bf314bb530924a5
  }
}

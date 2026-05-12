import 'package:clarity/feature/task/data/model/task_model.dart';
import 'package:clarity/feature/task/data/source/task_remot_source.dart';
import 'package:clarity/feature/task/domain/usecase/addtask_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddTaskCubit extends Cubit<List<TaskModel>> {
  AddTaskCubit() : super([]);

  final title = TextEditingController();
  final description = TextEditingController();
  final duedate = TextEditingController();
  String priority = "Medium";
  List<String> tags = [];
  final _firebaseService = TaskFirebaseService();
  final _saveTaskUsecase = AddtaskUsecase();
  List<TaskModel> _tasks = [];

  void setPriority(String value) {
    priority = value;
  }

  void setTags(List<String> value) {
    tags = value;
  }

  Future<void> loadTasks() async {
    try {
      final tasks = await _firebaseService.getAllTasks();
      _tasks = tasks;
      emit(List.from(_tasks));
    } catch (e) {
      print('Error loading tasks: $e');
    }
  }

  Future<void> saveTask(BuildContext context) async {
    try {
      final task = TaskModel(
        taskTitle: title.text,
        description: description.text,
        dueDate: duedate.text,
        priorityLevel: priority,
        tags: tags,
        completed: false,
      );

      // Save to Firebase
      await _saveTaskUsecase.addTask(task);

      // Refresh task list from Firebase after save
      await loadTasks();

      // Clear controllers
      title.clear();
      description.clear();
      duedate.clear();
      priority = "Medium";
      tags = [];

      if (context.mounted) {
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Task saved successfully!')),
        );
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Error: ${e.toString()}')));
      }
    }
  }

  Future<void> toggleTaskCompletion(int index) async {
    try {
      final task = _tasks[index];
      task.completed = !task.completed;
      if (task.completed) {
        task.completedDate = DateTime.now();
      }

      if (task.id != null) {
        await _firebaseService.toggleTaskCompletion(task.id!, task.completed);
      }

      emit(List.from(_tasks));
    } catch (e) {
      print('Error toggling task: $e');
    }
  }

  Future<void> completeTask(int index) async {
    try {
      final task = _tasks[index];
      task.completed = true;
      task.completedDate = DateTime.now();

      if (task.id != null) {
        await _firebaseService.toggleTaskCompletion(task.id!, true);
      }

      emit(List.from(_tasks));
    } catch (e) {
      print('Error completing task: $e');
    }
  }

  Future<void> updateFocusTime(int index, int minutes) async {
    try {
      final task = _tasks[index];
      task.focusTimeMinutes += minutes;

      if (task.id != null) {
        await _firebaseService.updateTask(task);
      }

      emit(List.from(_tasks));
    } catch (e) {
      print('Error updating focus time: $e');
    }
  }
}

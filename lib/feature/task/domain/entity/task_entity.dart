import 'package:clarity/feature/task/data/model/task_model.dart';

class TaskEntity {
  String? id;
  String? taskTitle;
  String? description;
  String? dueDate;
  String? priorityLevel;
  List<String>? tags;
  bool completed;
  DateTime? completedDate;
  int focusTimeMinutes;

  TaskEntity({
    this.id,
    required this.taskTitle,
    required this.description,
    required this.dueDate,
    required this.priorityLevel,
    required this.tags,
    this.completed = false,
    this.completedDate,
    this.focusTimeMinutes = 0,
  });

  // 🔥 Entity → Model
  TaskModel toModel() {
    return TaskModel(
      id: id,
      taskTitle: taskTitle,
      description: description,
      dueDate: dueDate,
      priorityLevel: priorityLevel,
      tags: tags,
      completed: completed,
      completedDate: completedDate,
      focusTimeMinutes: focusTimeMinutes,
    );
  }
}

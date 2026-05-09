class TaskModel {
  String? taskTitle;
  String? description;
  String? dueDate;
  String? priorityLevel;
  List<String>? tags;
  bool completed;
  DateTime? completedDate; // When task was completed
  int focusTimeMinutes; // Focus time spent on this task

  TaskModel({
    required this.taskTitle,
    required this.description,
    required this.dueDate,
    required this.priorityLevel,
    required this.tags,
    this.completed = false,
    this.completedDate,
    this.focusTimeMinutes = 0,
  });

  TaskModel copyWith({
    String? title,
    String? description,
    String? dueDate,
    String? priority,
    List<String>? tags,
    bool? completed,
    DateTime? completedDate,
    int? focusTimeMinutes,
  }) {
    return TaskModel(
      taskTitle: title ?? this.taskTitle,
      description: description ?? this.description,
      dueDate: dueDate ?? this.dueDate,
      priorityLevel: priority ?? this.priorityLevel,
      tags: tags ?? this.tags,
      completed: completed ?? this.completed,
      completedDate: completedDate ?? this.completedDate,
      focusTimeMinutes: focusTimeMinutes ?? this.focusTimeMinutes,
    );
  }
}

class TaskModel {
  String? taskTitle;
  String? description;
  String? dueDate;
  String? priorityLevel;
  List<String>? tags;

  TaskModel({
    required this.taskTitle,
    required this.description,
    required this.dueDate,
    required this.priorityLevel,
    required this.tags,
  });

  TaskModel copyWith({
    String? title,
    String? description,
    String? dueDate,
    String? priority,
    List<String>? tags,
  }) {
    return TaskModel(
      taskTitle: title ?? this.taskTitle,
      description: description ?? this.description,
      dueDate: dueDate ?? this.dueDate,
      priorityLevel: priority ?? this.priorityLevel,
      tags: tags ?? this.tags,
    );
  }
}

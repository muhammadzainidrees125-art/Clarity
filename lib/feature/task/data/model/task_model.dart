class TaskModel {
  String? taskTitle;
  String? description;
  String? dueDate;
  String? priorityLevel;
  List<String>? tags;
  bool completed;
  DateTime? completedDate; // When task was completed
  int focusTimeMinutes; // Focus time spent on this task
  String? id; // Firestore document ID

  TaskModel({
    required this.taskTitle,
    required this.description,
    required this.dueDate,
    required this.priorityLevel,
    required this.tags,
    this.completed = false,
    this.completedDate,
    this.focusTimeMinutes = 0,
    this.id,
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
    String? id,
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
      id: id ?? this.id,
    );
  }

  // Convert TaskModel to JSON for Firestore
  Map<String, dynamic> toJson() {
    return {
      'taskTitle': taskTitle,
      'description': description,
      'dueDate': dueDate,
      'priorityLevel': priorityLevel,
      'tags': tags ?? [],
      'completed': completed,
      'completedDate': completedDate,
      'focusTimeMinutes': focusTimeMinutes,
      'createdAt': DateTime.now(),
    };
  }

  // Create TaskModel from Firestore document
  factory TaskModel.fromJson(Map<String, dynamic> json, String docId) {
    return TaskModel(
      id: docId,
      taskTitle: json['taskTitle'] as String?,
      description: json['description'] as String?,
      dueDate: json['dueDate'] as String?,
      priorityLevel: json['priorityLevel'] as String?,
      tags: List<String>.from(json['tags'] ?? []),
      completed: json['completed'] as bool? ?? false,
      completedDate: json['completedDate'] != null
          ? (json['completedDate'] as dynamic).toDate()
          : null,
      focusTimeMinutes: json['focusTimeMinutes'] as int? ?? 0,
    );
  }
}

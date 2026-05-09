import 'package:clarity/feature/task/data/model/task_model.dart';

List<TaskModel> listoftask = [
  TaskModel(
    taskTitle: 'Email follow-up',
    description: 'Send follow-up emails to clients',
    dueDate: '05/01/2026',
    priorityLevel: 'Medium',
    tags: ['Work'],
    completed: true,
    completedDate: DateTime.now().subtract(Duration(days: 1)),
    focusTimeMinutes: 45,
  ),

  TaskModel(
    taskTitle: 'Daily workout',
    description: '30 minutes gym session',
    dueDate: '05/02/2026',
    priorityLevel: 'High',
    tags: ['Health'],
    completed: true,
    completedDate: DateTime.now(),
    focusTimeMinutes: 60,
  ),

  TaskModel(
    taskTitle: 'Project meeting',
    description: 'Discuss project progress with team',
    dueDate: '05/03/2026',
    priorityLevel: 'Low',
    tags: ['Office'],
    completed: true,
    completedDate: DateTime.now().subtract(Duration(days: 2)),
    focusTimeMinutes: 90,
  ),

  TaskModel(
    taskTitle: 'Grocery shopping',
    description: 'Buy vegetables and fruits',
    dueDate: '05/04/2026',
    priorityLevel: 'Medium',
    tags: ['Personal'],
    completed: false,
    focusTimeMinutes: 0,
  ),

  TaskModel(
    taskTitle: 'Study Flutter',
    description: 'Practice UI layouts and state management',
    dueDate: '05/05/2026',
    priorityLevel: 'High',
    tags: ['Learning', 'Coding'],
    completed: true,
    completedDate: DateTime.now(),
    focusTimeMinutes: 120,
  ),

  TaskModel(
    taskTitle: 'Design mockups',
    description: 'Create UI mockups for new feature',
    dueDate: '05/06/2026',
    priorityLevel: 'High',
    tags: ['Design'],
    completed: true,
    completedDate: DateTime.now().subtract(Duration(days: 3)),
    focusTimeMinutes: 150,
  ),
];

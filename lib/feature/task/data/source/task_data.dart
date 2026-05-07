import 'package:clarity/feature/task/data/model/task_model.dart';

List<TaskModel> listoftask = [
  TaskModel(
    taskTitle: 'Email follow-up',
    description: 'Send follow-up emails to clients',
    dueDate: '05/01/2026',
    priorityLevel: 'Medium',
    tags: ['Work'],
    completed: false,
  ),

  TaskModel(
    taskTitle: 'Daily workout',
    description: '30 minutes gym session',
    dueDate: '05/02/2026',
    priorityLevel: 'High',
    tags: ['Health'],
    completed: false,
  ),

  TaskModel(
    taskTitle: 'Project meeting',
    description: 'Discuss project progress with team',
    dueDate: '05/03/2026',
    priorityLevel: 'Low',
    tags: ['Office'],
    completed: true,
  ),

  TaskModel(
    taskTitle: 'Grocery shopping',
    description: 'Buy vegetables and fruits',
    dueDate: '05/04/2026',
    priorityLevel: 'Medium',
    tags: ['Personal'],
    completed: false,
  ),

  TaskModel(
    taskTitle: 'Study Flutter',
    description: 'Practice UI layouts and state management',
    dueDate: '05/05/2026',
    priorityLevel: 'High',
    tags: ['Learning', 'Coding'], // 👈 multiple tags possible
    completed: false,
  ),
];

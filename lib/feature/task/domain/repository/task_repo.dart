import 'package:clarity/feature/task/data/model/task_model.dart';

abstract class TaskRepo {
  Future<void> addTask(TaskModel task);
}

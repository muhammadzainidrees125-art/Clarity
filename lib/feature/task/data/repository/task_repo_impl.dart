import 'package:clarity/feature/task/data/model/task_model.dart';
import 'package:clarity/feature/task/data/source/task_remot_source.dart';
import 'package:clarity/feature/task/domain/repository/task_repo.dart';

class TaskRepoImpl implements TaskRepo {
  TaskFirebaseService source = TaskFirebaseService();
  @override
  Future<void> addTask(TaskModel task) async {
    await source.saveTask(task);
  }
}

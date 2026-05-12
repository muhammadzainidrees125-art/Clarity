import 'package:clarity/feature/task/data/model/task_model.dart';
import 'package:clarity/feature/task/data/repository/task_repo_impl.dart';
import 'package:clarity/feature/task/data/source/task_remot_source.dart';
import 'package:clarity/feature/task/domain/repository/task_repo.dart';

class AddtaskUsecase {
  TaskRepo repository = TaskRepoImpl();
  Future<void> addTask(TaskModel task) async {
    await repository.addTask(task);
  }
}

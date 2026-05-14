import 'package:clarity/feature/task/data/repository/task_repo_impl.dart';
import 'package:clarity/feature/task/domain/entity/task_entity.dart';
import 'package:clarity/feature/task/domain/repository/task_repo.dart';

class AddtaskUsecase {
  TaskRepo repository = TaskRepoImpl();
  Future<void> addTask(TaskEntity task) async {
    await repository.addTask(task.toModel());
  }
}

import 'package:ostad_task_management/shared/task_model.dart';
import 'package:ostad_task_management/shared/task_status_util.dart';

class TaskManager {
  static List<TaskModel> tasks = [];

  static void addTask(TaskModel task) {
    tasks.add(task);
  }

  static bool updateTask(TaskModel newTask, int index) {
    if (index >= 0) {
      tasks[index] = newTask;
      return true;
    } else {
      return false;
    }
  }

  static int getTaskCountByStatus(TaskStatus status) {
    int count = tasks.where((element) {
      return element.status == status;
    }).length;
    return count;
  }

  static void editTask(TaskModel task) {}
}

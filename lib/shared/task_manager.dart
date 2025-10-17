import 'package:ostad_task_management/shared/task_model.dart';
import 'package:ostad_task_management/shared/task_status_util.dart';

class TaskManager {
  static List<TaskModel> tasks = [];
  static bool isListChanged = false;

  static void addTask(TaskModel task) {
    tasks.add(task);
    isListChanged = true;
  }

  static bool updateTask(TaskModel newTask, int index) {
    isListChanged = true;
    if (index >= 0) {
      tasks[index] = newTask;
      return true;
    } else {
      return false;
    }
  }

  static int getTaskCountByStatus(TaskStatus status) {
    isListChanged = true;
    int count = tasks.where((element) {
      return element.status == status;
    }).length;
    return count;
  }

  static void deleteTask(TaskModel task) {
    tasks.removeAt(tasks.indexOf(task));
  }
}

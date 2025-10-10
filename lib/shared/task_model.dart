import 'package:ostad_task_management/shared/task_status_util.dart';

class TaskModel {
  final String title;
  final String description;
  final DateTime date;
  final TaskStatus status;

  TaskModel({
    required this.title,
    required this.description,
    required this.date,
    required this.status,
  });
}

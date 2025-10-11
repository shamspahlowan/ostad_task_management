import 'package:ostad_task_management/shared/task_status_util.dart';

class TaskModel {
  final String title;
  final String description;
  final String date;
  final TaskStatus status;

  TaskModel({
    required this.title,
    required this.description,
    required this.date,
    required this.status,
  });
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is TaskModel &&
        other.title == title &&
        other.description == description &&
        other.date == date &&
        other.status == status;
  }

  @override
  int get hashCode =>
      title.hashCode ^ description.hashCode ^ date.hashCode ^ status.hashCode;
}

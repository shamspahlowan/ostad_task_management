import 'package:flutter/material.dart';

enum TaskStatus { newtask, progress, completed, cancelled }

extension TaskStatusUtil on TaskStatus {
  Color get getColor {
    switch (this) {
      case TaskStatus.cancelled:
        return const Color(0xFFFFE0E0);
      case TaskStatus.newtask:
        return const Color(0xFFDCEBFF);
      case TaskStatus.completed:
        return const Color(0xFFDCFFE2);
      case TaskStatus.progress:
        return const Color(0xFFE8DCFF);
    }
  }

  String get getLabel {
    switch (this) {
      case TaskStatus.cancelled:
        return "Cancelled";
      case TaskStatus.newtask:
        return "New Task";
      case TaskStatus.completed:
        return "Completed";
      case TaskStatus.progress:
        return "Progress";
    }
  }
}

enum TaskFilter { all, newTask, progress, completed, cancelled }

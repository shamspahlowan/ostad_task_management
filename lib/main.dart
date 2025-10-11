import 'package:flutter/material.dart';
import 'package:ostad_task_management/app.dart';
import 'package:ostad_task_management/shared/sample_data.dart';
import 'package:ostad_task_management/shared/task_manager.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  TaskManager.tasks = [...mockTasks];
  runApp(App());
}

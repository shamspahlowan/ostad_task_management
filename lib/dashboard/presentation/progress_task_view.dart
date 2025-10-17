import 'package:flutter/material.dart';
import 'package:ostad_task_management/shared/task_list_view_manager.dart';
import 'package:ostad_task_management/shared/task_status_util.dart';

class ProgressTaskView extends StatefulWidget {
  const ProgressTaskView({super.key});

  @override
  State<ProgressTaskView> createState() => _ProgressTaskViewState();
}

class _ProgressTaskViewState extends State<ProgressTaskView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          children: [
            TaskListViewManager(
              taskStatus: TaskStatus.progress,
              onTaskChange: () {
                setState(() {});
              },
            ),
          ],
        ),
      ),
    );
  }
}

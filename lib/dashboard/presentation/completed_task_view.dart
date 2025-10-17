import 'package:flutter/material.dart';
import 'package:ostad_task_management/shared/task_list_view_manager.dart';
import 'package:ostad_task_management/shared/task_status_util.dart';

class CompletedTaskView extends StatefulWidget {
  const CompletedTaskView({super.key});

  @override
  State<CompletedTaskView> createState() => _CompletedTaskViewState();
}

class _CompletedTaskViewState extends State<CompletedTaskView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          children: [
            TaskListViewManager(
              taskStatus: TaskStatus.completed,
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

import 'package:flutter/material.dart';
import 'package:ostad_task_management/shared/task_list_view_manager.dart';
import 'package:ostad_task_management/shared/task_status_util.dart';

class CancelledTaskView extends StatefulWidget {
  const CancelledTaskView({super.key});

  @override
  State<CancelledTaskView> createState() => _CancelledTaskViewState();
}

class _CancelledTaskViewState extends State<CancelledTaskView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          children: [
            TaskListViewManager(
              taskStatus: TaskStatus.cancelled,
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

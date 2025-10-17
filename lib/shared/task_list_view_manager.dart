import 'package:flutter/material.dart';
import 'package:ostad_task_management/dashboard/presentation/task_view.dart';
import 'package:ostad_task_management/dashboard/widgets/task_tile.dart';
import 'package:ostad_task_management/shared/task_manager.dart';
import 'package:ostad_task_management/shared/task_status_util.dart';

class TaskListViewManager extends StatefulWidget {
  final TaskStatus taskStatus;
  final VoidCallback? onTaskChange;
  const TaskListViewManager({
    super.key,
    required this.taskStatus,
    this.onTaskChange,
  });

  @override
  State<TaskListViewManager> createState() => _TaskListViewManagerState();
}

class _TaskListViewManagerState extends State<TaskListViewManager> {
  Future<void> onUpdateSuccess(BuildContext context, int index) async {
    bool isUpdateSuccessful = false;
    isUpdateSuccessful = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return TaskView(task: TaskManager.tasks[index]);
        },
      ),
    );
    if (isUpdateSuccessful == true) {
      widget.onTaskChange?.call();
    }
  }

  Future<void> onDeleteTask(BuildContext context, int index) async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Task'),
        content: const Text(
          'Are you sure you want to delete this task? This action cannot be undone.',
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
            ),
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Delete'),
          ),
        ],
      ),
    );

    if (confirm == true) {
      TaskManager.deleteTask(TaskManager.tasks[index]);
      setState(() {});
      widget.onTaskChange?.call();
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Task deleted successfully.'),
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.redAccent,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    var tasks = TaskManager.tasks
        .where((element) => element.status == widget.taskStatus)
        .toList();
    return Expanded(
      child: ListView.separated(
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          final task = tasks[index];
          final originalIndex = TaskManager.tasks.indexOf(task);
          return TaskTile(
            task: tasks[index],
            onTap: () async {
              await onUpdateSuccess(context, originalIndex);
            },
            onDelete: () async {
              await onDeleteTask(context, originalIndex);
            },
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(height: 10);
        },
        itemCount: tasks.length,
      ),
    );
  }
}

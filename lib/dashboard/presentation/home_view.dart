import 'package:flutter/material.dart';
import 'package:ostad_task_management/dashboard/presentation/add_task_view.dart';
import 'package:ostad_task_management/dashboard/presentation/task_view.dart';
import 'package:ostad_task_management/dashboard/widgets/progress_track_tile.dart';
import 'package:ostad_task_management/dashboard/widgets/task_tile.dart';
import 'package:ostad_task_management/shared/task_manager.dart';
import 'package:ostad_task_management/shared/task_status_util.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool isInsertionSuccessful = false;
  bool isUpdateSuccessful = false;

  void _navigateAddTaskView() async {
    isInsertionSuccessful = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return AddTaskView();
        },
      ),
    );

    if (isInsertionSuccessful == true) {
      setState(() {
        isInsertionSuccessful = false;
      });
    }
  }

  List<TaskStatus> statuses = TaskStatus.values;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Row(
              spacing: 2,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ...List.generate(statuses.length, (index) {
                  return ProgressTrackTile(status: statuses[index]);
                }),
              ],
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) {
                  return TaskTile(
                    task: TaskManager.tasks[index],
                    onTap: () async {
                      isUpdateSuccessful = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return TaskView(task: TaskManager.tasks[index]);
                          },
                        ),
                      );
                      if (isUpdateSuccessful == true) {
                        setState(() {
                          isUpdateSuccessful = false;
                        });
                      }
                    },
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(height: 10);
                },
                itemCount: TaskManager.tasks.length,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _navigateAddTaskView,
        child: Icon(Icons.add, size: 30),
      ),
    );
  }
}

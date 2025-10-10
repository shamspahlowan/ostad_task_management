import 'package:flutter/material.dart';
import 'package:ostad_task_management/dashboard/widgets/progress_track_tile.dart';
import 'package:ostad_task_management/dashboard/widgets/task_tile.dart';
import 'package:ostad_task_management/shared/task_status_util.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
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
                // ProgressTrackTile(status: TaskStatus.newtask),
                // ProgressTrackTile(status: TaskStatus.progress),
                // ProgressTrackTile(status: TaskStatus.completed),
                // ProgressTrackTile(status: TaskStatus.cancelled),
              ],
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return TaskTile(status: statuses[index % statuses.length]);
                },
                separatorBuilder: (context, index) {
                  return SizedBox(height: 10);
                },
                itemCount: 10,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add, size: 30),
      ),
    );
  }
}

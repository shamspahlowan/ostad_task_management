import 'package:flutter/material.dart';
import 'package:ostad_task_management/dashboard/presentation/add_task_view.dart';
import 'package:ostad_task_management/dashboard/widgets/progress_track_tile.dart';
import 'package:ostad_task_management/shared/api_caller.dart';
import 'package:ostad_task_management/shared/show_snackbar_message.dart';
import 'package:ostad_task_management/shared/task_list_view_manager.dart';
import 'package:ostad_task_management/shared/task_status_count_model.dart';
import 'package:ostad_task_management/shared/task_status_util.dart';
import 'package:ostad_task_management/util/urls.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool _isGetTaskStatusCountInProgress = false;
  List<TaskStatusCountModel> _taskStatusCountList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getAllTaskStatusCount();
  }

  void _navigateAddTaskView() async {
    bool isInsertionSuccessful = false;
    isInsertionSuccessful = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return AddTaskView();
        },
      ),
    );

    if (isInsertionSuccessful == true) {
      setState(() {});
    }
  }

  Future<void> _getAllTaskStatusCount() async {
    _isGetTaskStatusCountInProgress = true;
    setState(() {});
    final ApiResponse response = await ApiCaller.getRequest(
      url: Urls.getTaskStatusCount,
    );

    _isGetTaskStatusCountInProgress = false;
    setState(() {});

    if (response.isSccuess) {
      List<TaskStatusCountModel> list = [];
      for (Map<String, dynamic> jsonData in response.body["data"]) {
        list.add(TaskStatusCountModel.fromJson(jsonData));
        _taskStatusCountList = list;
      }
    } else {
      ShowSnackbarMessage.showSnackBarMessage(context, response.error ?? "");
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
            Visibility(
              visible: _isGetTaskStatusCountInProgress == false,
              replacement: Center(child: CircularProgressIndicator()),
              child: Row(
                spacing: 2,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ...List.generate(_taskStatusCountList.length, (index) {
                    return ProgressTrackTile(
                      status: _taskStatusCountList[index].status,
                      count: _taskStatusCountList[index].count.toString(),
                    );
                  }),
                ],
              ),
            ),
            SizedBox(height: 10),
            TaskListViewManager(
              taskStatus: TaskStatus.newtask,
              onTaskChange: () {
                setState(() {});
              },
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

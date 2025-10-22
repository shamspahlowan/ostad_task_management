import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ostad_task_management/shared/api_caller.dart';
import 'package:ostad_task_management/shared/show_snackbar_message.dart';
import 'package:ostad_task_management/shared/task_manager.dart';
import 'package:ostad_task_management/shared/task_model.dart';
import 'package:ostad_task_management/shared/task_status_util.dart';
import 'package:ostad_task_management/util/asset_paths.dart';
import 'package:ostad_task_management/util/urls.dart';

class AddTaskView extends StatefulWidget {
  const AddTaskView({super.key});

  @override
  State<AddTaskView> createState() => _AddTaskViewState();
}

class _AddTaskViewState extends State<AddTaskView> {
  late TextEditingController _titleController;
  late TextEditingController _descriptionController;
  final _formKey = GlobalKey<FormState>();

  bool _isAddNewTaskInProgress = false;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController();
    _descriptionController = TextEditingController();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(38.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 160),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Add Task",
                  style: GoogleFonts.jetBrainsMono(
                    color: Colors.black,
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      controller: _titleController,
                      decoration: InputDecoration(
                        hintText: "Title",
                        filled: true,
                        fillColor: const Color(0xFFF0F1F1),
                      ),
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      controller: _descriptionController,
                      decoration: InputDecoration(
                        hintText: "Description",
                        filled: true,
                        fillColor: const Color(0xFFF0F1F1),
                      ),
                      maxLines: 10,
                    ),
                    SizedBox(height: 15),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          DateTime now = DateTime.now();
                          String date = "${now.day}/${now.month}/${now.year}";
                          if (_titleController.text.isNotEmpty &&
                              _descriptionController.text.isNotEmpty) {
                            TaskManager.addTask(
                              TaskModel(
                                title: _titleController.text,
                                description: _descriptionController.text,
                                date: date,
                                status: TaskStatus.newtask,
                              ),
                            );

                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                elevation: 1,
                                backgroundColor: Colors.green,
                                content: Text("Task added successfully."),
                                duration: Duration(seconds: 2),
                              ),
                            );
                            Navigator.pop(context, true);
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                elevation: 1,
                                backgroundColor: Colors.redAccent,
                                content: Text(
                                  "please add something to your task",
                                ),
                              ),
                            );
                          }
                        },
                        child: SvgPicture.asset(
                          AssetPaths.buttonIcon,
                          colorFilter: ColorFilter.mode(
                            Colors.white,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onSubmit() {}

  Future<void> _addNewTask() async {
    _isAddNewTaskInProgress = true;
    setState(() {});
    Map<String, dynamic> json = {
      "title": _titleController.text.trim(),
      "description": _descriptionController.text.trim(),
      "status": "New",
    };
    final ApiResponse response = await ApiCaller.postRequest(
      url: Urls.createTaskUrl,
      body: json,
    );

    if (response.isSccuess) {
      
    } else {
      ShowSnackbarMessage.showSnackBarMessage(context, response.error!);
    }
  }
}

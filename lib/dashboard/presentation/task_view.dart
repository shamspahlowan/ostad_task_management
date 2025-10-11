import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ostad_task_management/shared/task_manager.dart';
import 'package:ostad_task_management/shared/task_model.dart';
import 'package:ostad_task_management/shared/task_status_util.dart';
import 'package:ostad_task_management/util/asset_paths.dart';

class TaskView extends StatefulWidget {
  final TaskModel task;
  const TaskView({super.key, required this.task});

  @override
  State<TaskView> createState() => _TaskViewState();
}

class _TaskViewState extends State<TaskView> {
  late TextEditingController _titleController;
  late TextEditingController _descriptionController;
  late TaskStatus selectedStatus;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.task.title);
    _descriptionController = TextEditingController(
      text: widget.task.description,
    );
    selectedStatus = widget.task.status;
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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Column(
            children: [
              SizedBox(height: 160),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _titleController,
                      maxLines: 1,
                      style: GoogleFonts.jetBrainsMono(
                        color: Colors.black,
                        fontSize: 24,

                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(width: 5),
                  Expanded(
                    child: DropdownButtonFormField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: selectedStatus.getColor,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 14,
                        ),
                      ),
                      initialValue: selectedStatus,
                      items: [
                        for (var status in TaskStatus.values)
                          DropdownMenuItem(
                            value: status,
                            child: Text(status.name),
                          ),
                      ],
                      onChanged: (value) {
                        setState(() {
                          selectedStatus = value!;
                        });
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              TextFormField(controller: _descriptionController, maxLines: 10),
              SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    _onSave(context);
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
      ),
    );
  }

  void _onSave(BuildContext context) {
    if (_descriptionController.text.isNotEmpty &&
        _titleController.text.isNotEmpty) {
      TaskModel newTask = TaskModel(
        title: _titleController.text,
        description: _descriptionController.text,
        date: widget.task.date,
        status: selectedStatus,
      );

      if (newTask == widget.task) {
        Navigator.pop(context, false);
      } else {
        int index = TaskManager.tasks.indexOf(widget.task);
        if (TaskManager.updateTask(newTask, index)) {
          Navigator.pop(context, true);
        }
        // widget.task.title =
      }
    }
  }
}

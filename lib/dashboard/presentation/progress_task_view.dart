import 'package:flutter/material.dart';

class ProgressTaskView extends StatefulWidget {
  const ProgressTaskView({super.key});

  @override
  State<ProgressTaskView> createState() => _ProgressTaskViewState();
}

class _ProgressTaskViewState extends State<ProgressTaskView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text("progress")));
  }
}

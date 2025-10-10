import 'package:flutter/material.dart';

class CompletedTaskView extends StatefulWidget {
  const CompletedTaskView({super.key});

  @override
  State<CompletedTaskView> createState() => _CompletedTaskViewState();
}

class _CompletedTaskViewState extends State<CompletedTaskView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text("completed")));
  }
}

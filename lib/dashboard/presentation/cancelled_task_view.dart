import 'package:flutter/material.dart';

class CancelledTaskView extends StatefulWidget {
  const CancelledTaskView({super.key});

  @override
  State<CancelledTaskView> createState() => _CancelledTaskViewState();
}

class _CancelledTaskViewState extends State<CancelledTaskView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text("cancel")));
  }
}

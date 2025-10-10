import 'package:flutter/material.dart';
import 'package:ostad_task_management/dashboard/presentation/cancelled_task_view.dart';
import 'package:ostad_task_management/dashboard/presentation/completed_task_view.dart';
import 'package:ostad_task_management/dashboard/presentation/home_view.dart';
import 'package:ostad_task_management/dashboard/presentation/progress_task_view.dart';
import 'package:ostad_task_management/dashboard/widgets/custom_app_bar.dart';
import 'package:ostad_task_management/dashboard/widgets/custom_navigation_bar.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  int currentIndex = 0;

  final List<Widget> _pages = [
    HomeView(),
    ProgressTaskView(),
    CompletedTaskView(),
    CancelledTaskView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: _pages[currentIndex],
      bottomNavigationBar: CustomNavigationBar(
        viewCount: _pages.length,
        currentIndex: currentIndex,
        onSelected: (value) {
          setState(() {
            currentIndex = value;
          });
        },
      ),
    );
  }
}

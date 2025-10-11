import 'package:ostad_task_management/shared/task_model.dart';
import 'package:ostad_task_management/shared/task_status_util.dart';

List<TaskModel> mockTasks = [
  TaskModel(
    title: 'Design Landing Page',
    description:
        'Create the hero section and features grid for the new website.',
    date: '2025-10-12',
    status: TaskStatus.cancelled,
  ),
  TaskModel(
    title: 'Fix Login Bug',
    description:
        'Resolve the “invalid token” issue when user logs in via Google.',
    date: '2025-10-10',
    status: TaskStatus.progress,
  ),
  TaskModel(
    title: 'Database Optimization',
    description: 'Analyze slow queries in PostgreSQL and create indexes.',
    date: '2025-10-14',
    status: TaskStatus.completed,
  ),
  TaskModel(
    title: 'Prepare Presentation',
    description: 'Draft slides for the product pitch to investors.',
    date: '2025-10-15',
    status: TaskStatus.completed,
  ),
  TaskModel(
    title: 'Implement Dark Mode',
    description: 'Add theme switcher and adapt colors for accessibility.',
    date: '2025-10-16',
    status: TaskStatus.progress,
  ),
  TaskModel(
    title: 'Code Review',
    description: 'Review pull requests from the frontend team before merging.',
    date: '2025-10-11',
    status: TaskStatus.completed,
  ),
];

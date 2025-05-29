import 'dart:ui';

class Task {
  final String title;
  final String subtitle;
  final double progress;
  final int taskCount;
  final Color color;

  Task({
    required this.title,
    required this.subtitle,
    required this.progress,
    required this.taskCount,
    required this.color,
  });
}

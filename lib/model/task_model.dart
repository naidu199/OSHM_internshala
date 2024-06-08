import 'package:flutter/material.dart';

class Task {
  final String title;
  final String category;
  final String priority;
  final IconData mainIcon;
  final Color mainIconColor;
  final IconData priorityIcon;
  final double progress;
  final String dueDate;
  final String assignedTo;
  final String status;
  final Color progressColor;
  final Color priorityIconColor;

  Task({
    required this.title,
    required this.category,
    required this.priority,
    required this.mainIcon,
    required this.mainIconColor,
    required this.priorityIcon,
    required this.progress,
    required this.dueDate,
    required this.assignedTo,
    required this.status,
    required this.progressColor,
    required this.priorityIconColor,
  });
  static List<Task> tasks = [
    Task(
      title: 'Room 303 Set Up',
      category: 'Housekeeping',
      priority: 'High',
      mainIcon: Icons.cleaning_services,
      mainIconColor: Colors.blue,
      priorityIcon: Icons.signal_cellular_alt_rounded,
      priorityIconColor: Colors.red,
      progress: 30.0,
      dueDate: '14 July 2024, 05:00 PM',
      assignedTo: 'Garima Bhatia',
      status: 'In-progress',
      progressColor: Colors.orange,
    ),
    Task(
      title: 'Fire Place Check & Up',
      category: 'Maintenance &...',
      priority: 'Low',
      mainIcon: Icons.miscellaneous_services_outlined,
      mainIconColor: Colors.deepPurpleAccent,
      priorityIcon: Icons.signal_cellular_alt_1_bar,
      priorityIconColor: Colors.green,
      progress: 0.0,
      dueDate: '14 July 2024, 05:00 PM',
      assignedTo: 'Ranganathan',
      status: 'To do task',
      progressColor: const Color.fromARGB(255, 248, 224, 3),
    ),
    Task(
      title: 'Water Leakage Repair',
      category: 'Raise a Incident',
      priority: 'Low',
      mainIcon: Icons.water_damage_outlined,
      mainIconColor: Colors.red,
      priorityIcon: Icons.signal_cellular_alt_1_bar,
      priorityIconColor: Colors.green,
      progress: 100.0,
      dueDate: '14 July 2024, 05:00 PM',
      assignedTo: 'Mahesh Taluk..',
      status: 'Completed',
      progressColor: Colors.green,
    ),
  ];
}

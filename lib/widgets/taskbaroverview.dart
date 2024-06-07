import 'package:flutter/material.dart';

class TaskBar extends StatelessWidget {
  const TaskBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                decoration: BoxDecoration(
                  // border: const Border(
                  //     bottom: BorderSide(width: 2.0, color: Colors.pink)),
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.pink.withOpacity(0.2),
                ),
                child: const Text(
                  'Task Overview',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.pink,
                  ),
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                child: const Text(
                  'My SOP\'s',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  _buildStatusCard(
                    'To Do Task',
                    Colors.yellow,
                    16,
                  ),
                  const SizedBox(height: 8.0),
                  _buildStatusCard(
                    'In-progress',
                    Colors.orange,
                    16,
                  ),
                ],
              ),
              Column(
                children: [
                  _buildStatusCard(
                    'Overdue',
                    Colors.red,
                    16,
                  ),
                  const SizedBox(height: 8.0),
                  _buildStatusCard(
                    'Completed',
                    Colors.green,
                    16,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatusCard(String title, Color color, int count) {
    return Container(
      width: 170.0,
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        border: Border.all(color: color, width: 1.5),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(Icons.donut_large_outlined, weight: 20, color: color),
              const SizedBox(width: 8.0),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ],
          ),
          Text(
            '$count',
            style: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

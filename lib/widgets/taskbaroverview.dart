import 'package:flutter/material.dart';

class TaskBar extends StatelessWidget {
  final Function(String) onStatusSelected;
  const TaskBar({super.key, required this.onStatusSelected});
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
              InkWell(
                onTap: () => onStatusSelected(''),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.pink.withOpacity(0.2),
                  ),
                  child: Text(
                    'Task Overview',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.pinkAccent[400],
                    ),
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
                  InkWell(
                    onTap: () {
                      onStatusSelected('To do task');
                    },
                    child: _buildStatusCard(
                      'To Do Task',
                      Colors.yellow,
                      16,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  InkWell(
                    onTap: () {
                      onStatusSelected('In-progress');
                    },
                    child: _buildStatusCard(
                      'In-progress',
                      Colors.orange,
                      16,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  InkWell(
                    onTap: () {
                      onStatusSelected('Overdue');
                    },
                    child: _buildStatusCard(
                      'Overdue',
                      Colors.red,
                      16,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  InkWell(
                    onTap: () {
                      onStatusSelected('Completed');
                    },
                    child: _buildStatusCard(
                      'Completed',
                      Colors.green,
                      16,
                    ),
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

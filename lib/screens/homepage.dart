import 'package:flutter/material.dart';
import 'package:oshm_internshala/constants/colors.dart';
import 'package:oshm_internshala/widgets/calender.dart';
import 'package:oshm_internshala/widgets/taskbaroverview.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 40,
        leading: const Padding(
          padding: EdgeInsets.only(left: 4.0),
          child: Icon(
            size: 26,
            Icons.arrow_back,
            color: buttoncolor,
          ),
        ),
        titleSpacing: 0,
        title: Row(
          children: [
            const Text(
              'Manage Tasks',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              width: 10,
            ),
            const Icon(
              size: 26,
              Icons.info_outline,
              color: buttoncolor,
            ),
            const Spacer(),
            Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                  color: Colors.red, borderRadius: BorderRadius.circular(5)),
              child: const Row(
                children: [
                  Icon(
                    Icons.warning_amber,
                    color: Colors.white,
                    size: 20,
                  ),
                  SizedBox(
                    width: 3,
                  ),
                  Text(
                    "Incident Log",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  )
                ],
              ),
            )
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(size: 26, Icons.search),
            color: buttoncolor,
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CalendarPage(),
            const SizedBox(height: 10),
            const TaskBar(),
            const SizedBox(height: 10),
            // Task List
            Expanded(
              child: ListView(
                children: [
                  _buildTaskCard(
                    'Room 303 Set Up',
                    'Housekeeping',
                    'High',
                    'Garima Bhatia',
                    30,
                    '14 July 2024, 05:00 PM',
                  ),
                  _buildTaskCard(
                    'Fire Place Check & Up...',
                    'Maintenance &...',
                    'Low',
                    'Ranganathan',
                    0,
                    '14 July 2024, 05:00 PM',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.pink,
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildStatusCard(String title, Color color, int count) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          Text(
            '$count',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _buildTaskCard(String title, String category, String priority,
      String assignedTo, int progress, String dueDate) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.check_box, color: Colors.blue),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                Text(
                  priority,
                  style: const TextStyle(color: Colors.red),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(category),
            const SizedBox(height: 8),
            Row(
              children: [
                Text('Assigned to: $assignedTo'),
                const Spacer(),
                Text(dueDate),
              ],
            ),
            const SizedBox(height: 8),
            LinearProgressIndicator(
              value: progress / 100,
              backgroundColor: Colors.grey[200],
              color: Colors.green,
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Text('In-progress'),
                const Spacer(),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                  child: const Text('Done'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

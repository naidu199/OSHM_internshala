import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
import 'package:flutter_stepindicator/flutter_stepindicator.dart';
import 'package:oshm_internshala/model/task_model.dart';

class TaskCard extends StatelessWidget {
  final Task task;
  const TaskCard({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 20),
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 12),
        child: Column(
          children: [
            TaskDetails(
              task: task,
            ),
            TaskProgress(
              task: task,
            ),
          ],
        ),
      ),
    );
  }
}

class TaskDetails extends StatelessWidget {
  final Task task;
  const TaskDetails({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(6.0),
              decoration: BoxDecoration(
                color: task.mainIconColor.withOpacity(0.6),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Icon(task.mainIcon,
                  size: 40, color: Colors.white.withOpacity(0.9)),
            ),
            const SizedBox(width: 8.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    task.title,
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4.0),
                  Row(
                    children: [
                      Text(
                        task.category,
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 14.0,
                        ),
                      ),
                      const SizedBox(width: 16.0),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 4.0),
                        decoration: BoxDecoration(
                          color: task.priorityIconColor.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              task.priorityIcon,
                              color: task.priorityIconColor,
                              size: 14.0,
                            ),
                            const SizedBox(width: 4.0),
                            Text(
                              task.priority,
                              style: TextStyle(
                                  color: task.priorityIconColor,
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'View More',
                  style: TextStyle(
                      color: Colors.green,
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12.0),
                Text(
                  task.assignedTo,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 14.0,
                  ),
                ),
              ],
            ),
          ],
        ),
        const Divider(
          height: 25,
          thickness: 2,
        )
      ],
    );
  }
}

class TaskProgress extends StatelessWidget {
  final Task task;
  const TaskProgress({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                  text: TextSpan(children: [
                const TextSpan(
                  text: "Progress status: ",
                  style: TextStyle(
                      fontSize: 13.0,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text: "${task.progress}%",
                  style: TextStyle(
                      fontSize: 13.0,
                      color: task.progressColor,
                      fontWeight: FontWeight.bold),
                )
              ])),
              Text(task.dueDate,
                  style: const TextStyle(
                      fontSize: 11.0,
                      color: Colors.grey,
                      fontWeight: FontWeight.w500)),
            ],
          ),
        ),
        const SizedBox(height: 10.0),
        FlutterStepIndicator(
          page: task.page,
          height: 25,
          list: List.generate(5, (index) => index),
          onChange: (index) {},
          progressColor: task.progressColor,
          positiveColor: task.progressColor,
          negativeColor: Colors.grey,
        ),
        Text(task.status,
            style: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.bold,
              color: task.progressColor,
            )),
        // const SizedBox(height: 4.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                      color:
                          task.progress == '100' ? Colors.grey : Colors.white,
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(
                          color: task.progress == '100'
                              ? Colors.white
                              : Colors.green,
                          width: 2)),
                  child: Row(
                    children: [
                      Icon(
                        Icons.check_circle_outline,
                        size: 24,
                        color: task.progress == '100'
                            ? Colors.white
                            : Colors.green,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                          task.progress == '0' ||
                                  (task.status == 'Overdue' &&
                                      task.progress != 'Approval Awaited')
                              ? "Start"
                              : "Done",
                          style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                            color: task.progress == '100'
                                ? Colors.white
                                : Colors.green,
                          )),
                    ],
                  ),
                ),
                const SizedBox(width: 4.0),
                Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.green, width: 2)),
                  child: const Icon(
                    Icons.more_horiz,
                    size: 24,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
          ],
        ),
        // const SizedBox(height: 16.0),
      ],
    );
  }
}

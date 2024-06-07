import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_stepindicator/flutter_stepindicator.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(8.0),
        child: const Column(
          children: [TaskDetails(), TaskProgress()],
        ),
      ),
    );
  }
}

class TaskDetails extends StatelessWidget {
  const TaskDetails({super.key});

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
                color: Colors.blue[100],
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Icon(Icons.cleaning_services,
                  size: 40, color: Colors.white.withOpacity(0.9)),
            ),
            const SizedBox(width: 8.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Room 303 Set Up',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4.0),
                  Row(
                    children: [
                      const Text(
                        'Housekeeping',
                        style: TextStyle(
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
                          color: Colors.red[100],
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        child: const Row(
                          children: [
                            Icon(
                              Icons.signal_cellular_alt_rounded,
                              color: Colors.red,
                              size: 14.0,
                            ),
                            SizedBox(width: 4.0),
                            Text(
                              'High',
                              style: TextStyle(
                                  color: Colors.red,
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
            const Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'View More',
                  style: TextStyle(
                      color: Colors.green,
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 12.0),
                Text(
                  'Garima Bhatia',
                  style: TextStyle(
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
  const TaskProgress({super.key});

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
                  text: const TextSpan(children: [
                TextSpan(
                  text: "Progress status: ",
                  style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text: " 30%",
                  style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.orange,
                      fontWeight: FontWeight.bold),
                )
              ])),
              // const Text(
              //   "Progress status: 30%",
              //   style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              // ),
              const Text("14 July 2024, 05:00 PM",
                  style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.grey,
                      fontWeight: FontWeight.w500)),
            ],
          ),
        ),
        const SizedBox(height: 8.0),
        FlutterStepIndicator(
          page: 2,
          height: 25,
          list: List.generate(5, (index) => index),
          onChange: (index) {},
          progressColor: Colors.orange,
          positiveColor: Colors.orange,
          negativeColor: Colors.grey,
        ),
        const Text("In-progress",
            style: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.bold,
              color: Colors.orange,
            )),
        // const SizedBox(height: 4.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(3),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(color: Colors.green, width: 2)),
                  child: const Row(
                    children: [
                      Icon(
                        Icons.check_circle_outline,
                        size: 24,
                        color: Colors.green,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text("Done",
                          style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
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

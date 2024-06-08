import 'package:flutter/material.dart';

class NewTaskAllotment extends StatelessWidget {
  const NewTaskAllotment({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              selectionColumn(
                Icons.calendar_month,
                "SHEDULE",
                "28 July 2023..",
              ),
              selectionColumn(
                Icons.location_on_outlined,
                "LOCATION",
                "Enter Locati..",
              ),
              Column(
                children: [
                  const Row(
                    children: [
                      Icon(
                        Icons.menu_outlined,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text('PRIORITY'),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 3),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 4.0),
                        decoration: BoxDecoration(
                          color: Colors.deepPurple.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        child: const Row(
                          children: [
                            Icon(
                              Icons.signal_cellular_alt_2_bar_rounded,
                              color: Colors.deepPurple,
                              size: 14.0,
                            ),
                            SizedBox(width: 4.0),
                            Text(
                              'Medium',
                              style: TextStyle(
                                  color: Colors.deepPurple,
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                      const Icon(
                        Icons.arrow_drop_up_outlined,
                        color: Colors.green,
                      )
                    ],
                  )
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              selectionColumn(
                Icons.account_circle_outlined,
                "ASSIGN TO",
                "Enter Assignee",
              ),
              const SizedBox(
                width: 20,
              ),
              selectionColumn(
                Icons.notifications_active_rounded,
                "REMAINDER",
                "03 min before",
              ),
            ],
          )
        ],
      ),
    );
  }

  Column selectionColumn(IconData icon, String title, String text) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              icon,
              color: Colors.grey,
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              title,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                  color: Colors.grey, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              text,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                  color: Colors.black, fontWeight: FontWeight.bold),
            ),
            const Icon(
              Icons.arrow_drop_up_outlined,
              color: Colors.green,
            )
          ],
        )
      ],
    );
  }
}

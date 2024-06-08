import 'package:flutter/material.dart';

class NewTaskDetails extends StatelessWidget {
  const NewTaskDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "TASK CATEGORY",
            style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
          ),
          Row(
            children: [
              const Text(
                'HouseKeeping',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                width: 10,
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.arrow_drop_up,
                  color: Colors.green,
                  size: 32,
                ),
              ),
            ],
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
            child: const Text("Room 303 Set up"),
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            // width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
            child: const Text(
                "Prepare room 303 for the arrival of returing guests, ensuring it is throughly cleaned, sanitised and all amenities are restocked."),
          )
        ],
      ),
    );
  }
}

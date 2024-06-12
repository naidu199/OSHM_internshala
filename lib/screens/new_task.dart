import 'package:flutter/material.dart';
import 'package:oshm_internshala/widgets/new_task_allotment.dart';
import 'package:oshm_internshala/widgets/new_task_details.dart';

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({super.key});

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  final List<String> _checkList = [
    "Door mat & entrance to be cleaned",
    "Fan blades to be cleaned and no noise",
    "Working AC with remote",
    "Clean ceiling and floor",
    "Working bedside lights",
    "Pillows as per number of guests",
    "Clean blankets and duvets",
    "Fresh linen",
    "Tidy curtains & blinds",
    "Clean balcony, furniture & floor",
    "Stocked, clean dustbin"
  ];

  final TextEditingController _checkListController = TextEditingController();
  bool isSelected = false;
  @override
  void dispose() {
    _checkListController.dispose();
    super.dispose();
  }

  bool isTaskAllotmentVisible = false;
  bool isTaskDetailsVisible = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                child: const Text(
                  'cancel',
                  style: TextStyle(color: Colors.red, fontSize: 16),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              const Text('New Task',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              TextButton(
                child: const Text(
                  'Save',
                  style: TextStyle(color: Colors.green, fontSize: 16),
                ),
                onPressed: () {},
              ),
            ],
          ),
          const Divider(
            thickness: 2,
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            children: [
              const Text(
                'TASK DETAILS',
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                width: 48,
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    isTaskDetailsVisible = !isTaskDetailsVisible;
                  });
                },
                icon: Icon(
                  isTaskDetailsVisible
                      ? Icons.arrow_drop_up
                      : Icons.arrow_drop_down,
                  color: Colors.green,
                  size: 32,
                ),
              )
            ],
          ),
          isTaskDetailsVisible ? const NewTaskDetails() : const SizedBox(),
          Row(
            children: [
              const Text(
                'TASK ALLOTMENT',
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                width: 20,
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    isTaskAllotmentVisible = !isTaskAllotmentVisible;
                  });
                },
                icon: Icon(
                  isTaskAllotmentVisible
                      ? Icons.arrow_drop_up
                      : Icons.arrow_drop_down,
                  color: Colors.green,
                  size: 32,
                ),
              )
            ],
          ),
          isTaskAllotmentVisible ? const NewTaskAllotment() : const SizedBox(),
          const SizedBox(height: 8.0),
          const Row(
            children: [
              Icon(Icons.star_border),
              SizedBox(
                width: 10,
              ),
              Text('POINTS')
            ],
          ),
          Container(
            margin: const EdgeInsets.only(left: 30),
            padding: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 0.5),
            ),
            child: const Text(
              '1000',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 14.0),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _checkListController,
                  decoration: const InputDecoration(
                    hintText: 'Type here & Add Check List',
                    border: OutlineInputBorder(),
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(
                  Icons.add_circle_outline,
                  color: Colors.green,
                  size: 32,
                ),
                onPressed: () {},
              ),
            ],
          ),
          const SizedBox(height: 16.0),
          const Text(
            'Check List',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8.0),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: _checkList.length,
            itemBuilder: (context, index) {
              return newtaskAdded(index);
            },
          ),
          Center(
              heightFactor: 0.2,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.arrow_drop_down,
                  color: Colors.green,
                  size: 38,
                ),
              )),
          SwitchListTile(
            title: const Text('Save this template'),
            value: isSelected,
            // selected: true,
            onChanged: (value) {
              setState(() {
                isSelected = !isSelected;
              });
            },
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.green,
              ),
              onPressed: () {
                // Create task action
              },
              child: const Text('Create Task'),
            ),
          ),
        ],
      ),
    );
  }

  Widget newtaskAdded(int index) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.remove_circle, color: Colors.red),
          Text(_checkList[index]),
          const Icon(
            Icons.warning_amber_outlined,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}

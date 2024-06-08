import 'package:flutter/material.dart';
import 'package:oshm_internshala/constants/colors.dart';
import 'package:oshm_internshala/model/task_model.dart';
import 'package:oshm_internshala/screens/new_task.dart';
import 'package:oshm_internshala/widgets/calender.dart';
import 'package:oshm_internshala/widgets/taskbaroverview.dart';
import 'package:oshm_internshala/widgets/taskcard.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final List<Task> tasks = Task.tasks;
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
                    size: 18,
                  ),
                  SizedBox(
                    width: 3,
                  ),
                  Text(
                    "Incident Logs",
                    style: TextStyle(
                        fontSize: 10,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CalendarPage(),
              const SizedBox(height: 10),
              const TaskBar(),
              const SizedBox(height: 10),
              // TaskCard(),
              ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: tasks.length,
                  itemBuilder: ((context, index) {
                    return TaskCard(task: tasks[index]);
                  }))

              // Task List
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
        onPressed: () => _showBottomSheet(context),
        backgroundColor: Colors.pink,
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      showDragHandle: true,
      enableDrag: true,
      isScrollControlled: true,
      builder: (context) {
        return DraggableScrollableSheet(
          maxChildSize: 0.9,
          initialChildSize: 0.85,
          minChildSize: 0.2,
          builder: (context, scrollController) {
            return Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: SingleChildScrollView(
                controller: scrollController,
                child: const NewTaskScreen(),
              ),
            );
          },
        );
      },
    );
  }
}

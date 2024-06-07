import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay = DateTime.now();
  List<DateTime> getDatesInRange(DateTime start, int days) {
    return List.generate(days, (index) => start.add(Duration(days: index)));
  }

  @override
  Widget build(BuildContext context) {
    final dates = getDatesInRange(DateTime.now(), 30);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.chevron_left, color: Colors.green),
                    onPressed: () {
                      setState(() {
                        _focusedDay =
                            DateTime(_focusedDay.year, _focusedDay.month - 1);
                      });
                    },
                  ),
                  Text(
                    '${DateFormat('MMMM').format(_focusedDay)} ${_focusedDay.year}',
                    style: const TextStyle(
                        fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    icon: const Icon(Icons.chevron_right, color: Colors.green),
                    onPressed: () {
                      setState(() {
                        _focusedDay =
                            DateTime(_focusedDay.year, _focusedDay.month + 1);
                      });
                    },
                  ),
                ],
              ),
              IconButton(
                icon: const Icon(Icons.calendar_month_outlined,
                    size: 32, color: Colors.green),
                onPressed: () async {
                  DateTime? selectedDate = await showDatePicker(
                    context: context,
                    initialDate: _focusedDay,
                    firstDate: DateTime(2010),
                    lastDate: DateTime(2030),
                  );
                  if (selectedDate != null) {
                    setState(() {
                      _focusedDay = selectedDate;
                      _selectedDay = selectedDate;
                    });
                  }
                },
              ),
            ],
          ),
          SizedBox(
            height: 60.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: dates.length,
              itemBuilder: (context, index) {
                final date = dates[index];
                final isSelected =
                    _selectedDay != null && isSameDay(date, _selectedDay!);

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedDay = date;
                      _focusedDay = date;
                    });
                  },
                  child: Container(
                    width: 50.0,
                    margin: const EdgeInsets.symmetric(horizontal: 1.0),
                    decoration: BoxDecoration(
                      // color: isSelected ? Colors.pinkAccent : Colors.white,
                      border: isSelected
                          ? Border.all(color: Colors.pink, width: 2.0)
                          : null,
                      borderRadius: BorderRadius.circular(8.0),
                      shape: BoxShape.rectangle,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          DateFormat('dd').format(date),
                          style: TextStyle(
                            fontSize: 16,
                            color: isSelected ? Colors.pink : Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          DateFormat('E').format(date),
                          style: TextStyle(
                            fontSize: 16,
                            color: isSelected ? Colors.pink : Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          // const SizedBox(height: 16.0),
          // if (_selectedDay != null)
          //   Text(
          //     'Selected Day: ${_selectedDay!.day}/${_selectedDay!.month}/${_selectedDay!.year}',
          //     style: const TextStyle(
          //       fontSize: 18.0,
          //       fontWeight: FontWeight.bold,
          //     ),
          //   ),
        ],
      ),
    );
  }
}

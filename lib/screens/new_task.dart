import 'package:flutter/material.dart';

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({super.key});

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'TASK DETAILS',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 8),
                const Row(
                  children: [
                    Icon(Icons.check_circle, color: Colors.green),
                    SizedBox(width: 8),
                    Text('Task Allotment'),
                  ],
                ),
                const SizedBox(height: 16),
                const Text(
                  '✩ POINTS',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 8),
                const Text('1000', style: TextStyle(fontSize: 18)),
                const SizedBox(height: 16),
                const TextField(
                  decoration: InputDecoration(
                    hintText: 'Type here & Add Check List',
                    suffixIcon: Icon(Icons.add_circle_outline),
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Check List',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 8),
                _buildChecklistItem('Door mat & entrance to be cleaned',
                    Icons.radio_button_unchecked),
                _buildChecklistItem('Fan blades to be cleaned and no noise',
                    Icons.radio_button_unchecked),
                _buildChecklistItem(
                    'Working AC with remote', Icons.radio_button_unchecked),
                _buildChecklistItem(
                    'Clean ceiling and floor', Icons.radio_button_unchecked),
                _buildChecklistItem(
                    'Working bedside lights', Icons.radio_button_unchecked),
                _buildChecklistItem('Pillows as per number of guests',
                    Icons.radio_button_unchecked),
                _buildChecklistItem(
                    'Clean blankets and duvets', Icons.radio_button_unchecked),
                _buildChecklistItem(
                    'Fresh linen', Icons.radio_button_unchecked),
                _buildChecklistItem(
                    'Tidy curtains & blinds', Icons.radio_button_unchecked),
                _buildChecklistItem('Clean balcony, furniture & floor',
                    Icons.radio_button_unchecked),
                _buildChecklistItem(
                    'Stocked, clean dustbin', Icons.radio_button_unchecked),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Save this template'),
                    const SizedBox(width: 8),
                    Switch(
                      value: false,
                      onChanged: (value) {},
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 16,
                    ),
                    textStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  child: const Text('Create Task'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChecklistItem(String text, IconData icon) {
    return Row(
      children: [
        Icon(icon, color: Colors.red),
        const SizedBox(width: 8),
        Text(text),
        const Spacer(),
        const Icon(Icons.arrow_drop_up, size: 16),
      ],
    );
  }
}

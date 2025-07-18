import 'package:flutter/material.dart';

class DateSection extends StatelessWidget {
  final String dayText;
  final String monthText;

  const DateSection({required this.dayText, required this.monthText});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Column(
        children: [
          Container(color: Colors.green),
          Text(
            dayText,
            style: const TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            monthText,
            style: const TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

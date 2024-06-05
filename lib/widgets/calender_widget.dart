import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CalenderWidget extends StatelessWidget {
  const CalenderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0), // Rounded rectangular border
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Text(
              DateFormat('MMMM yyyy').format(DateTime.now()),
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            GridView.builder(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 7, // 7 days in a week
                crossAxisSpacing: 8.0, // Spacing between grid items
                mainAxisSpacing: 8.0,
              ),
              itemCount: 42, // 6 rows * 7 columns for 42 grid items
              itemBuilder: (context, index) {
                final currentDate = DateTime.now();
                final currentMonth = currentDate.month;
                final startWeekday =
                    DateTime(currentDate.year, currentMonth, 1).weekday;
                final totalDays =
                    DateTime(currentDate.year, currentMonth + 1, 0).day;

                // Calculate the date for each grid item
                final date = index - startWeekday + 2;
                final color = date == currentDate.day
                    ? Colors.red
                    : null; // Highlight current date in red

                // Check if the date is within the current month
                if (date >= 1 && date <= totalDays) {
                  return Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Text(
                      '$date',
                      style: TextStyle(
                        color: date == currentDate.day ? Colors.white : null,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                } else {
                  return Container();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
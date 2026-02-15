import 'package:app/models/habit_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateScreen extends StatelessWidget {
  final List<Habit> habits;

  const DateScreen({super.key, required this.habits});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Habit Timeline")),
      body:
          habits.isEmpty
              ? const Center(child: Text("No habits created"))
              : ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: habits.length,
                itemBuilder: (context, index) {
                  final habit = habits[index];

                  return Card(
                    margin: const EdgeInsets.only(bottom: 15),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            habit.name,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: habit.color,
                            ),
                          ),

                          const SizedBox(height: 10),

                          Row(
                            children: [
                              const Icon(Icons.play_arrow, size: 18),
                              const SizedBox(width: 6),
                              Text(
                                "Started: ${DateFormat.yMMMd().format(habit.startDate)}",
                              ),
                            ],
                          ),

                          const SizedBox(height: 6),

                          Row(
                            children: [
                              const Icon(Icons.stop, size: 18),
                              const SizedBox(width: 6),
                              Text(
                                habit.endDate == null
                                    ? "End: Ongoing"
                                    : "Ended: ${DateFormat.yMMMd().format(habit.endDate!)}",
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
    );
  }
}

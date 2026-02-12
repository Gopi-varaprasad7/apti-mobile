import 'package:app/widgets/habbit_widget/add_habit_dialog.dart';
import 'package:flutter/material.dart';

class HabitScreen extends StatefulWidget {
  const HabitScreen({super.key});

  @override
  State<HabitScreen> createState() => _HabitScreenState();
}

class _HabitScreenState extends State<HabitScreen> {
  final List<Map<String, dynamic>> habits = [];

  void _showAddHabitDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AddHabitDialog(
          onCreate: (name, period, color) {
            setState(() {
              habits.add({"name": name, "period": period, "color": color});
            });
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Habits', style: TextStyle(color: Colors.blue)),
      ),
      body:
          habits.isEmpty
              ? Center(
                child: ElevatedButton(
                  onPressed: _showAddHabitDialog,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 15,
                    ),
                  ),
                  child: const Text(
                    "Add Habit",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              )
              : ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: habits.length,
                itemBuilder: (context, index) {
                  final habit = habits[index];

                  return Container(
                    margin: const EdgeInsets.only(bottom: 15),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: habit["color"],
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          habit["name"],
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          habit["period"],
                          style: const TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  );
                },
              ),
      floatingActionButton:
          habits.isNotEmpty
              ? FloatingActionButton(
                onPressed: _showAddHabitDialog,
                child: const Icon(Icons.add),
              )
              : null,
    );
  }
}

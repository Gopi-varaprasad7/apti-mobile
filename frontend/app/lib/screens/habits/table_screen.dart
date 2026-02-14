import 'package:app/models/habit_model.dart';
import 'package:flutter/material.dart';

class TableScreen extends StatefulWidget {
  final List<Habit> habits;

  const TableScreen({super.key, required this.habits});

  @override
  State<TableScreen> createState() => _TableScreenState();
}

class _TableScreenState extends State<TableScreen> {
  void _addSubTopic(Habit habit) {
    TextEditingController controller = TextEditingController();

    showDialog(
      context: context,
      builder:
          (_) => AlertDialog(
            title: const Text("Add Sub-topic"),
            content: TextField(
              controller: controller,
              decoration: const InputDecoration(hintText: "Enter sub-topic"),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("Cancel"),
              ),
              ElevatedButton(
                onPressed: () {
                  if (controller.text.isEmpty) return;

                  setState(() {
                    habit.subTopics.add(SubTopic(title: controller.text));
                  });

                  Navigator.pop(context);
                },
                child: const Text("Add"),
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Habit Tables")),
      body:
          widget.habits.isEmpty
              ? const Center(child: Text("No habits created"))
              : ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: widget.habits.length,
                itemBuilder: (context, index) {
                  final habit = widget.habits[index];

                  return Card(
                    margin: const EdgeInsets.only(bottom: 20),
                    elevation: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          /// Habit Title
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                habit.name,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: habit.color,
                                ),
                              ),
                              IconButton(
                                icon: const Icon(Icons.add),
                                onPressed: () => _addSubTopic(habit),
                              ),
                            ],
                          ),

                          const SizedBox(height: 10),

                          /// Table
                          habit.subTopics.isEmpty
                              ? const Text("No sub-topics yet")
                              : DataTable(
                                columns: const [
                                  DataColumn(label: Text("Sub-topic")),
                                  DataColumn(label: Text("Completed")),
                                ],
                                rows:
                                    habit.subTopics.map((sub) {
                                      return DataRow(
                                        cells: [
                                          DataCell(Text(sub.title)),
                                          DataCell(
                                            Checkbox(
                                              value: sub.isCompleted,
                                              onChanged: (value) {
                                                setState(() {
                                                  sub.isCompleted =
                                                      value ?? false;
                                                });
                                              },
                                            ),
                                          ),
                                        ],
                                      );
                                    }).toList(),
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

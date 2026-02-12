import 'package:flutter/material.dart';

class AddHabitDialog extends StatefulWidget {
  final Function(String name, String period, Color color) onCreate;

  const AddHabitDialog({super.key, required this.onCreate});

  @override
  State<AddHabitDialog> createState() => _AddHabitDialogState();
}

class _AddHabitDialogState extends State<AddHabitDialog> {
  final TextEditingController controller = TextEditingController();
  String selectedPeriod = "daily";
  Color selectedColor = Colors.pink;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.pop(context),
                ),
              ),

              const Text(
                "Name of habit",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 10),

              TextField(
                controller: controller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              const Text(
                "Goal period",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 10),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:
                    ["daily", "weekly", "monthly"]
                        .map(
                          (period) => ChoiceChip(
                            label: Text(period),
                            selected: selectedPeriod == period,
                            onSelected: (_) {
                              setState(() {
                                selectedPeriod = period;
                              });
                            },
                          ),
                        )
                        .toList(),
              ),

              const SizedBox(height: 20),

              const Text(
                "Select color",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 10),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:
                    [
                          Colors.pink,
                          Colors.green,
                          Colors.blue,
                          Colors.yellow,
                          Colors.purple,
                          Colors.orange,
                        ]
                        .map(
                          (color) => GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedColor = color;
                              });
                            },
                            child: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                color: color,
                                borderRadius: BorderRadius.circular(10),
                                border:
                                    selectedColor == color
                                        ? Border.all(
                                          color: Colors.black,
                                          width: 3,
                                        )
                                        : null,
                              ),
                            ),
                          ),
                        )
                        .toList(),
              ),

              const SizedBox(height: 30),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () {
                    if (controller.text.isEmpty) return;

                    widget.onCreate(
                      controller.text,
                      selectedPeriod,
                      selectedColor,
                    );

                    Navigator.pop(context);
                  },
                  child: const Text("Create Habit"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

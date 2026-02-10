import 'package:flutter/material.dart';

class QuestionCard extends StatefulWidget {
  final String category;
  final String difficulty;

  const QuestionCard({
    super.key,
    required this.category,
    required this.difficulty,
  });

  @override
  State<QuestionCard> createState() => _QuestionCardState();
}

class _QuestionCardState extends State<QuestionCard> {
  String? selectedOption;
  bool isSubmitting = false;
  final Map<String, dynamic> questionData = {
    "question":
        "Two trains are moving in opposite directions at 60 km/hr and 40 km/hr. If their lengths are 120 m and 80 m, how long will they take to cross each other?",
    "options": ["6 seconds", "7.2 seconds", "10 seconds", "12 seconds"],
    "answer": "7.2 seconds",
    "aiHint":
        "Add both speeds to get relative speed and divide total length by that speed.",
  };

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Chip(
                  label: Text(widget.category),
                  backgroundColor: Colors.blue.shade50,
                ),
                const SizedBox(width: 8),
                Chip(
                  label: Text(widget.difficulty),
                  backgroundColor: _difficultyColor(),
                ),
              ],
            ),

            const SizedBox(height: 16),
            Text(
              questionData["question"],
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),

            const SizedBox(height: 20),
            ...questionData["options"].map<Widget>((option) {
              return Container(
                margin: const EdgeInsets.only(bottom: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: RadioListTile<String>(
                  value: option,
                  groupValue: selectedOption,
                  title: Text(option),
                  onChanged: (value) {
                    setState(() {
                      selectedOption = value;
                    });
                  },
                ),
              );
            }).toList(),

            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    icon: const Icon(Icons.smart_toy),
                    label: const Text("Ask AI"),
                    onPressed: _showAiHint,
                  ),
                ),

                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: selectedOption == null ? null : _submitAnswer,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                    ),
                    child:
                        isSubmitting
                            ? const SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: Colors.white,
                              ),
                            )
                            : const Text("Submit"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _showAiHint() {
    showDialog(
      context: context,
      builder:
          (_) => AlertDialog(
            title: const Text("AI Hint 🤖"),
            content: Text(questionData["aiHint"]),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("Got it"),
              ),
            ],
          ),
    );
  }

  void _submitAnswer() {
    setState(() {
      isSubmitting = true;
    });

    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        isSubmitting = false;
      });

      final bool isCorrect = selectedOption == questionData["answer"];

      showDialog(
        context: context,
        builder:
            (_) => AlertDialog(
              title: Text(isCorrect ? "Correct 🎉" : "Wrong ❌"),
              content: Text(
                isCorrect
                    ? "Excellent work!"
                    : "Correct answer is: ${questionData["answer"]}",
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("Next"),
                ),
              ],
            ),
      );
    });
  }

  Color _difficultyColor() {
    switch (widget.difficulty) {
      case 'Easy':
        return Colors.green.shade100;
      case 'Medium':
        return Colors.orange.shade100;
      case 'Hard':
        return Colors.red.shade100;
      default:
        return Colors.grey.shade200;
    }
  }
}

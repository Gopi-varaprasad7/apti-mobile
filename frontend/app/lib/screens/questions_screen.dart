import 'package:app/screens/home_screen.dart';
import 'package:flutter/material.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});

  @override
  State<QuestionsScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionsScreen> {
  String selectedCategory = 'Trains';
  String selectedLevel = 'Easy';

  IconData getDifficultyIcon(String level) {
    switch (level) {
      case 'Easy':
        return Icons.sentiment_satisfied_alt;
      case 'Medium':
        return Icons.sentiment_neutral;
      case 'Hard':
        return Icons.sentiment_very_dissatisfied;
      default:
        return Icons.help;
    }
  }

  Color getDifficultyColor(String level) {
    switch (level) {
      case 'Easy':
        return Colors.green;
      case 'Medium':
        return Colors.orange;
      case 'Hard':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 24),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomeScreen(),
                          ),
                        );
                      },
                      icon: const Icon(Icons.arrow_back),
                      color: Colors.grey,
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      'AptiVerve',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.blue,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.person),
                  color: Colors.grey,
                ),
              ],
            ),
            Row(
              children: [
                // CATEGORY DROPDOWN
                InkWell(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder:
                          (_) => Column(
                            mainAxisSize: MainAxisSize.min,
                            children:
                                ['Trains', 'Boats', 'Time', 'Percentage', 'Age']
                                    .map(
                                      (category) => ListTile(
                                        title: Text(category),
                                        onTap: () {
                                          setState(() {
                                            selectedCategory = category;
                                          });
                                          Navigator.pop(context);
                                        },
                                      ),
                                    )
                                    .toList(),
                          ),
                    );
                  },
                  child: Row(
                    children: [
                      Text(
                        selectedCategory,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 4),
                      const Icon(Icons.arrow_drop_down),
                    ],
                  ),
                ),

                const Spacer(),

                // DIFFICULTY DROPDOWN
                InkWell(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder:
                          (_) => Column(
                            mainAxisSize: MainAxisSize.min,
                            children:
                                ['Easy', 'Medium', 'Hard']
                                    .map(
                                      (level) => ListTile(
                                        leading: Icon(
                                          getDifficultyIcon(level),
                                          color: getDifficultyColor(level),
                                        ),
                                        title: Text(level),
                                        onTap: () {
                                          setState(() {
                                            selectedLevel = level;
                                          });
                                          Navigator.pop(context);
                                        },
                                      ),
                                    )
                                    .toList(),
                          ),
                    );
                  },
                  child: Row(
                    children: [
                      Icon(
                        getDifficultyIcon(selectedLevel),
                        color: getDifficultyColor(selectedLevel),
                      ),
                      const SizedBox(width: 6),
                      Text(
                        selectedLevel,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: getDifficultyColor(selectedLevel),
                        ),
                      ),
                      const Icon(Icons.arrow_drop_down),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class SubTopic {
  String title;
  bool isCompleted;

  SubTopic({required this.title, this.isCompleted = false});
}

class Habit {
  final String name;
  final String period;
  final Color color;
  final List<SubTopic> subTopics;

  Habit({
    required this.name,
    required this.period,
    required this.color,
    this.subTopics = const [],
  });
}

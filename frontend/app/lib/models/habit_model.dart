import 'package:flutter/material.dart';


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
  })

}

class SubTopic {
  final String id;
  final String title;
  bool isCompleted;

  SubTopic({
    required this.title,
    this.isCompleted = false,
    String? id,
  }) : id = id ?? DateTime.now().millisecondsSinceEpoch.toString();
}

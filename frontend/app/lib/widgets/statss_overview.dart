import 'package:app/widgets/stat_card.dart';
import 'package:flutter/material.dart';

class StatsOverview extends StatelessWidget {
  final int attempted;
  final int correct;
  final int wrong;

  const StatsOverview({
    super.key,
    required this.attempted,
    required this.correct,
    required this.wrong,
  });

  double get accuracy {
    if (attempted == 0) return 0;
    return (correct / attempted) * 100;
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      crossAxisSpacing: 12,
      mainAxisSpacing: 12,
      children: [
        StatCard(
          title: 'Attempted',
          value: attempted.toString(),
          icon: Icons.quiz,
          color: Colors.blue,
        ),
        StatCard(
          title: 'Correct',
          value: correct.toString(),
          icon: Icons.check_circle,
          color: Colors.green,
        ),
        StatCard(
          title: 'Wrong',
          value: wrong.toString(),
          icon: Icons.cancel,
          color: Colors.red,
        ),
        StatCard(
          title: 'Accuracy',
          value: '${accuracy.toStringAsFixed(1)}%',
          icon: Icons.trending_up,
          color: Colors.purple,
        ),
      ],
    );
  }
}

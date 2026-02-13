import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class StatsScreen extends StatelessWidget {
  const StatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final habits = [
      {"name": "Workout", "completed": 4, "total": 7, "color": Colors.blue},
      {"name": "Reading", "completed": 5, "total": 7, "color": Colors.green},
      {
        "name": "Meditation",
        "completed": 2,
        "total": 7,
        "color": Colors.purple,
      },
    ];

    int totalCompleted = habits.fold(
      0,
      (sum, h) => sum + (h["completed"] as int),
    );

    int totalTargets = habits.fold(0, (sum, h) => sum + (h["total"] as int));

    double overallPercentage =
        totalTargets == 0 ? 0 : (totalCompleted / totalTargets) * 100;
    return Scaffold(
      appBar: AppBar(title: const Text('Statistics')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Text(
              "Overall Completion",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 200,
              child: PieChart(
                PieChartData(
                  sections: [
                    PieChartSectionData(
                      value: totalCompleted.toDouble(),
                      color: Colors.green,
                      title: "${overallPercentage.toStringAsFixed(1)}%",
                      radius: 60,
                    ),
                    PieChartSectionData(
                      value: (totalTargets - totalCompleted).toDouble(),
                      color: Colors.grey.shade300,
                      title: "",
                      radius: 60,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 40),
            const Text(
              "Daily Completion Per Habit",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: BarChart(
                BarChartData(
                  barGroups: List.generate(habits.length, (index) {
                    final habit = habits[index];

                    double percentage =
                        (habit["completed"] as int) / (habit["total"] as int);

                    return BarChartGroupData(
                      x: index,
                      barRods: [
                        BarChartRodData(
                          toY: percentage * 100,
                          color: habit["color"] as Color,
                          width: 20,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ],
                    );
                  }),
                  titlesData: FlTitlesData(
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          return Text(
                            habits[value.toInt()]["name"] as String,
                            style: const TextStyle(fontSize: 10),
                          );
                        },
                      ),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: true),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

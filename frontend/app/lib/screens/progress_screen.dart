import 'package:app/screens/habits/date_screen.dart';
import 'package:app/screens/habits/habits_screen.dart';
import 'package:app/screens/habits/stats_screen.dart';
import 'package:app/screens/habits/table_screen.dart';
import 'package:flutter/material.dart';

class ProgressScreen extends StatefulWidget {
  const ProgressScreen({super.key});

  @override
  State<ProgressScreen> createState() => _ProgressScreenState();
}

class _ProgressScreenState extends State<ProgressScreen> {
  int index = 0;
  bool isNaviVisible = true;

  final List<Widget> pages = [
    const HabitScreen(),
    const StatsScreen(),
    const TableScreen(habits: []),
    const DateScreen(habits: []),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[index],
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                isNaviVisible = !isNaviVisible;
              });
            },
            child: Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
              child: Icon(
                isNaviVisible
                    ? Icons.keyboard_arrow_down
                    : Icons.keyboard_arrow_up,
                color: Colors.white,
              ),
            ),
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            height: isNaviVisible ? 70 : 0,
            child: Wrap(
              children: [
                BottomNavigationBar(
                  currentIndex: index,
                  onTap: (value) {
                    setState(() {
                      index = value;
                    });
                  },
                  type: BottomNavigationBarType.fixed,
                  items: const [
                    BottomNavigationBarItem(
                      icon: Icon(Icons.track_changes),
                      label: 'Habits',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.bar_chart),
                      label: "Stats",
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.table_chart),
                      label: "Table",
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.date_range),
                      label: "Table",
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

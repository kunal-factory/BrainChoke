import 'package:flutter/material.dart';
import 'package:projectorders/Mobile/it_screen.dart';
import 'package:projectorders/Mobile/lt_screen.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  LandingScreenState createState() => LandingScreenState();
}

class LandingScreenState extends State<LandingScreen> {
  static const numberTruthList = [
    "one",
    "two",
    "three",
    "four",
    "five",
    "six",
    "seven",
    "eight",
    "nine",
    "tem"
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Tasks to do!!'),
            bottom: const TabBar(
              tabs: [
                Tab(
                  icon: Icon(
                    Icons.home,
                    color: Colors.cyan,
                  ),
                ),
                Tab(
                  icon: Icon(
                    Icons.area_chart_rounded,
                    color: Colors.cyan,
                  ),
                ),
              ],
            ),
          ),
          body: const TabBarView(
            children: [ItScreen(), LtScreen()],
          ),
        ));
  }
}

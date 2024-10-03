import 'dart:math';

import 'package:flutter/material.dart';

class LtScreen extends StatefulWidget {
  const LtScreen({super.key});

  @override
  LtScreenState createState() => LtScreenState();
}

class Task {
  final String title;
  final int subTasks;
  final DateTime dateCreated;
  final Color color;

  Task({
    required this.title,
    required this.subTasks,
    required this.dateCreated,
    required this.color,
  });
}

class TaskListRow extends StatelessWidget {
  final Task task;
  final int totalTasks;

  TaskListRow({required this.task, required this.totalTasks});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      color: task.color.withOpacity(0.3),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: task.color,
          child: Text(
            task.subTasks.toString(),
            style: const TextStyle(
              color: Colors.white, // Set digit color to white
              fontWeight: FontWeight.bold, // Make digit bold
              fontSize: 16, // Adjust font size if needed
            ),
          ),
        ),
        title: Text(
          task.title,
          style: const TextStyle(
            color: Colors.white, // Set title color to white
            fontWeight: FontWeight.bold, // Make title bold
            fontSize: 18, // Adjust font size
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Created on: ${task.dateCreated.toLocal().toString().split(' ')[0]}',
              style: TextStyle(
                color: Colors
                    .grey[700], // Use a contrasting color for "Created on"
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              'Total tasks: $totalTasks',
              style: const TextStyle(
                color:
                    Colors.black, // Use a contrasting color for "Total tasks"
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Function to get random color from 5 predefined colors
Color getRandomColor() {
  final List<Color> colors = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.orange,
    Colors.purple,
  ];
  return colors[Random().nextInt(colors.length)];
}

class LtScreenState extends State<LtScreen> {
  final List<Task> tasks = List.generate(
    10,
    (index) => Task(
      title: 'Task ${index + 1}',
      subTasks: Random().nextInt(5) + 1, // Random number of subtasks
      dateCreated: DateTime.now().subtract(Duration(days: index)), // Mock date
      color: getRandomColor(), // Assign random color
    ),
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        color: Colors.white,
        child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Expanded(
                    child: ListView.builder(
                  itemCount: tasks.length,
                  itemBuilder: (context, index) {
                    final task = tasks[index];
                    return TaskListRow(
                      task: task,
                      totalTasks: 20,
                    );
                  },
                ))
              ],
            )),
      ),
    );
  }
}

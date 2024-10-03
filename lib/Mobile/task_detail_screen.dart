import 'package:flutter/material.dart';

class TaskDetailScreen extends StatelessWidget {
  final List<SubTask> subTasks = [
    SubTask(name: 'Subtask 1', description: 'Description for subtask 1'),
    SubTask(name: 'Subtask 2', description: 'Description for subtask 2'),
    SubTask(name: 'Subtask 3', description: 'Description for subtask 3'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Task Details'),
      ),
      body: Column(
        children: [
          // Task Details Section with a Gradient
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.blueAccent,
                  Colors.purpleAccent
                ], // Gradient for task details
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Main Task',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // White text
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Description: This is a detailed task description.',
                  style: TextStyle(color: Colors.white), // White text
                ),
                SizedBox(height: 10),
                Text(
                  'Created Date: 2024-10-03',
                  style: TextStyle(color: Colors.white), // White text
                ),
              ],
            ),
          ),
          SizedBox(height: 20),

          // Subtasks Section with a Gradient for Each List Item
          Expanded(
            child: ListView.builder(
              itemCount: subTasks.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  padding: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.tealAccent,
                        Colors.lightBlueAccent
                      ], // Gradient for each subtask
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(
                        12), // Rounded corners for subtasks
                  ),
                  child: ListTile(
                    leading: Icon(
                      Icons.check_circle_outline,
                      color: Colors.black, // Black icons
                    ),
                    title: Text(
                      subTasks[index].name,
                      style: TextStyle(
                          color: Colors.black), // Black text for subtasks
                    ),
                    subtitle: Text(
                      subTasks[index].description,
                      style: TextStyle(
                          color: Colors.grey[700]), // Grey text for description
                    ),
                  ),
                );
              },
            ),
          ),
          // Create Task Button
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                // Handle create new task action
              },
              child: Text('Create New Task'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.blueAccent, // Text color
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SubTask {
  final String name;
  final String description;

  SubTask({required this.name, required this.description});
}

import 'package:flutter/material.dart';

class ItScreen extends StatefulWidget {
  const ItScreen({super.key});

  @override
  ItScreenState createState() => ItScreenState();
}

class ItScreenState extends State<ItScreen> {
  final List<SubTask> subTasks = [
    SubTask(
      title: 'Design database schema',
      isCompleted: true,
      dueDate: DateTime.now().add(Duration(days: 2)),
      priority: 'High',
      assignee: 'John',
    ),
    SubTask(
      title: 'Create API endpoints',
      isCompleted: false,
      dueDate: DateTime.now().add(Duration(days: 5)),
      priority: 'Medium',
      assignee: 'Doe',
    ),
    SubTask(
      title: 'Set up CI/CD pipeline',
      isCompleted: false,
      dueDate: DateTime.now().add(Duration(days: 7)),
      priority: 'Low',
      assignee: 'Anna',
    ),
    SubTask(
      title: 'Write unit tests',
      isCompleted: true,
      dueDate: DateTime.now().add(Duration(days: 1)),
      priority: 'High',
      assignee: 'Mark',
    ),
    SubTask(
      title: 'Review code',
      isCompleted: false,
      dueDate: DateTime.now().add(Duration(days: 3)),
      priority: 'Medium',
      assignee: 'Sarah',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        color: Colors.white,
        child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                const Text(
                  "12 Sept 2024",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w800,
                      color: Colors.teal),
                ),
                Expanded(
                    child: ListView.builder(
                  itemCount: subTasks.length,
                  itemBuilder: (context, index) {
                    final subTask = subTasks[index];
                    return SubTaskRow(subTask: subTask);
                  },
                ))
              ],
            )),
      ),
    );
  }
}

class SubTask {
  final String title;
  final bool isCompleted;
  final DateTime dueDate;
  final String priority;
  final String assignee;

  SubTask({
    required this.title,
    required this.isCompleted,
    required this.dueDate,
    required this.priority,
    required this.assignee,
  });
}

class SubTaskRow extends StatelessWidget {
  final SubTask subTask;

  SubTaskRow({required this.subTask});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      elevation: 0, // Remove shadow for flat design
      color: subTask.isCompleted
          ? Colors.green[100]
          : Colors.grey[200], // Background color based on status
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, '/taskDetail');
        },
        child: ListTile(
          title: Text(
            subTask.title,
            style: TextStyle(
              decoration: subTask.isCompleted
                  ? TextDecoration.lineThrough
                  : TextDecoration.none,
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: subTask.isCompleted
                  ? Colors.green[700]
                  : Colors.black, // Darker green for completed, black for not
            ),
          ),
          subtitle: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Due Date
              Row(
                children: [
                  Icon(
                    Icons.calendar_today,
                    size: 14,
                    color: Colors.grey[600],
                  ),
                  SizedBox(width: 4),
                  Text(
                    'Due: ${subTask.dueDate.toLocal().toString().split(' ')[0]}',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
              // Priority Tag
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: _getPriorityColor(subTask.priority),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  subTask.priority,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Function to get priority color
  Color _getPriorityColor(String priority) {
    switch (priority.toLowerCase()) {
      case 'high':
        return Colors.red;
      case 'medium':
        return Colors.orange;
      case 'low':
        return Colors.green;
      default:
        return Colors.grey;
    }
  }
}

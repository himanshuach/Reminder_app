import 'package:flutter/material.dart';
import 'package:reminder_app/theme.dart';
import 'package:reminder_app/models/reminder_model.dart';

class ReminderApp extends StatefulWidget {
  const ReminderApp({super.key});

  @override
  State<ReminderApp> createState() => _ReminderAppState();
}

class _ReminderAppState extends State<ReminderApp> {
  final List<Reminder> _reminders = [
    Reminder(title: "Morning Routine", completed: true),
    Reminder(title: "Hydration", completed: true),
    Reminder(title: "Work Priorities", completed: true),
    Reminder(title: "Break Time", completed: false),
    Reminder(title: "Night Routine", completed: false),
  ];

  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  List<Reminder> get _filteredReminders {
    if (_searchQuery.isEmpty) {
      return _reminders;
    }
    return _reminders.where((reminder) =>
        reminder.title.toLowerCase().contains(_searchQuery.toLowerCase())).toList();
  }

  void _toggleReminder(int index) {
    setState(() {
      final reminder = _reminders[index];
      final updatedReminder = reminder.copyWith(completed: !reminder.completed);
      _reminders[index] = updatedReminder;
    });
  }

  void _addNewReminder() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        final TextEditingController titleController = TextEditingController();
        final TextEditingController descriptionController = TextEditingController();
        Priority selectedPriority = Priority.medium;
        
        return StatefulBuilder(
          builder: (context, setDialogState) {
            return AlertDialog(
              title: const Text('Add New Reminder'),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: titleController,
                      decoration: const InputDecoration(
                        hintText: 'Enter reminder title',
                        border: OutlineInputBorder(),
                      ),
                      autofocus: true,
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      controller: descriptionController,
                      decoration: const InputDecoration(
                        hintText: 'Enter description (optional)',
                        border: OutlineInputBorder(),
                      ),
                      maxLines: 2,
                    ),
                    const SizedBox(height: 16),
                    DropdownButtonFormField<Priority>(
                      value: selectedPriority,
                      decoration: const InputDecoration(
                        labelText: 'Priority',
                        border: OutlineInputBorder(),
                      ),
                      items: Priority.values.map((priority) {
                        return DropdownMenuItem(
                          value: priority,
                          child: Text(priority.name),
                        );
                      }).toList(),
                      onChanged: (Priority? value) {
                        setDialogState(() {
                          selectedPriority = value!;
                        });
                      },
                    ),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('Cancel'),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (titleController.text.isNotEmpty) {
                      setState(() {
                        _reminders.add(Reminder(
                          title: titleController.text,
                          description: descriptionController.text.isNotEmpty 
                              ? descriptionController.text 
                              : null,
                          priority: selectedPriority,
                        ));
                      });
                      Navigator.of(context).pop();
                    }
                  },
                  child: const Text('Add'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.black),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          // Header Section
          Container(
            color: Colors.blue,
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Himanshu\nGood Morning,",
                        style: AppTextStyles.header,
                      ),
                      Text(
                        "${_reminders.where((r) => !r.completed).length} Tasks Pending",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                const CircleAvatar(
                  backgroundImage: AssetImage('lib/assets/profile.jpg'),
                  radius: 24,
                ),
              ],
            ),
          ),
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              onChanged: (value) {
                setState(() {
                  _searchQuery = value;
                });
              },
              decoration: InputDecoration(
                hintText: "Search for anything...",
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
          ),
          // Task List
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: _filteredReminders.length + 1,
              itemBuilder: (context, index) {
                if (index == _filteredReminders.length) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: ElevatedButton.icon(
                      onPressed: _addNewReminder,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      icon: const Icon(Icons.add),
                      label: const Text("Add more tasks.."),
                    ),
                  );
                }
                final reminder = _filteredReminders[index];
                return TaskItem(
                  reminder: reminder,
                  onTap: () => _toggleReminder(_reminders.indexOf(reminder)),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        margin: const EdgeInsets.all(10),
        child: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.phone),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_circle),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.camera_alt),
              label: "",
            ),
          ],
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.black,
          backgroundColor: Colors.white,
          elevation: 0,
          iconSize: 24,
          currentIndex: 1,
          onTap: (index) {
            // Handle navigation
            debugPrint("Tapped on index: $index");
          },
        ),
      ),
    );
  }
}

class TaskItem extends StatelessWidget {
  final Reminder reminder;
  final VoidCallback? onTap;

  const TaskItem({
    super.key, 
    required this.reminder,
    this.onTap,
  });

  Color _getPriorityColor() {
    switch (reminder.priority) {
      case Priority.low:
        return Colors.green;
      case Priority.medium:
        return Colors.orange;
      case Priority.high:
        return Colors.red;
      case Priority.urgent:
        return Colors.purple;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.orange,
          borderRadius: BorderRadius.circular(20),
          border: reminder.isOverdue 
              ? Border.all(color: Colors.red, width: 2)
              : null,
        ),
        child: Row(
          children: [
            Icon(
              reminder.completed ? Icons.check_circle : Icons.radio_button_unchecked,
              color: reminder.completed ? Colors.black : Colors.grey,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    reminder.title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                      decoration: reminder.completed ? TextDecoration.lineThrough : null,
                    ),
                  ),
                  if (reminder.description != null) ...[
                    const SizedBox(height: 4),
                    Text(
                      reminder.description!,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.black54,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                  if (reminder.dueDate != null) ...[
                    const SizedBox(height: 4),
                    Text(
                      reminder.isOverdue 
                          ? 'Overdue!'
                          : 'Due: ${reminder.daysUntilDue == 0 ? 'Today' : '${reminder.daysUntilDue} days'}',
                      style: TextStyle(
                        fontSize: 12,
                        color: reminder.isOverdue ? Colors.red : Colors.black54,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: _getPriorityColor(),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                reminder.priority.name,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
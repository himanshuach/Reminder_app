import 'package:flutter/material.dart';
import 'package:reminder_app/theme.dart';

class ReminderApp extends StatelessWidget {
  const ReminderApp({super.key});

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
            child: const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Himanshu\nGood Morning,",
                        style: AppTextStyles.header,
                      ),
                      Text(
                        "2 Tasks Pending",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                CircleAvatar(
                  backgroundImage: AssetImage('lib/assets/profile.jpg'), // Add profile image asset
                  radius: 24,
                ),
              ],
            ),
          ),
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
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
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                const TaskItem(title: "Morning Routine", isChecked: true),
                const TaskItem(title: "Hydration", isChecked: true),
                const TaskItem(title: "Work Priorities", isChecked: true),
                const TaskItem(title: "Break Time", isChecked: false),
                const TaskItem(title: "Night Routine", isChecked: false),
                const SizedBox(height: 16),
                ElevatedButton.icon(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  icon: const Icon(Icons.add),
                  label: const Text("Add more tasks.."),
                ),
              ],
            ),
          ),
        ],
      ),
bottomNavigationBar: Container(
  decoration: BoxDecoration(
    color: Colors.white, // Background color of the rectangle
    borderRadius: BorderRadius.circular(20), // Rounded corners for rectangle
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.5), // Shadow color
        spreadRadius: 2, // Spread radius
        blurRadius: 5, // Blur radius
        offset: const Offset(0, 3), // Shadow position
      ),
    ],
  ),
  margin: const EdgeInsets.all(10), // Margin around the rectangle
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
    backgroundColor: Colors.white, // Background color
    elevation: 0, // Shadow/elevation for bar
    iconSize: 24, // Default size for all icons
    currentIndex: 0, // Highlight the central icon initially
    onTap: (index) {
      // Handle navigation
      print("Tapped on index: $index");
    },
        ),
      ),
    );
  }
}

class TaskItem extends StatelessWidget {
  final String title;
  final bool isChecked;

  const TaskItem({super.key, required this.title, required this.isChecked});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.orange,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Icon(
            isChecked ? Icons.check_circle : Icons.radio_button_unchecked,
            color: isChecked ? Colors.black : Colors.grey,
          ),
          const SizedBox(width: 16),
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
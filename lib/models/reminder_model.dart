class Reminder {
  final String title;
  bool completed;

  Reminder({required this.title, this.completed = false});

  // You can add helper methods like toggleCompletion() to handle the state of reminders
  void toggleCompletion() {
    completed = !completed;
  }
}

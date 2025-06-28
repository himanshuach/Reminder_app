import 'package:uuid/uuid.dart';

class Reminder {
  final String id;
  final String title;
  final String? description;
  final DateTime? dueDate;
  final bool completed;
  final Priority priority;
  final DateTime createdAt;

  Reminder({
    String? id,
    required this.title,
    this.description,
    this.dueDate,
    this.completed = false,
    this.priority = Priority.medium,
    DateTime? createdAt,
  }) : 
    id = id ?? const Uuid().v4(),
    createdAt = createdAt ?? DateTime.now();

  // Toggle completion status
  void toggleCompletion() {
    // Note: This method modifies the object directly
    // In a real app, you'd want to use proper state management
  }

  // Create a copy with updated fields
  Reminder copyWith({
    String? id,
    String? title,
    String? description,
    DateTime? dueDate,
    bool? completed,
    Priority? priority,
    DateTime? createdAt,
  }) {
    return Reminder(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      dueDate: dueDate ?? this.dueDate,
      completed: completed ?? this.completed,
      priority: priority ?? this.priority,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  // Convert to JSON for storage
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'dueDate': dueDate?.toIso8601String(),
      'completed': completed,
      'priority': priority.index,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  // Create from JSON
  factory Reminder.fromJson(Map<String, dynamic> json) {
    return Reminder(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      dueDate: json['dueDate'] != null ? DateTime.parse(json['dueDate']) : null,
      completed: json['completed'] ?? false,
      priority: Priority.values[json['priority'] ?? 1],
      createdAt: DateTime.parse(json['createdAt']),
    );
  }

  // Check if reminder is overdue
  bool get isOverdue {
    if (dueDate == null || completed) return false;
    return DateTime.now().isAfter(dueDate!);
  }

  // Get days until due
  int? get daysUntilDue {
    if (dueDate == null) return null;
    final now = DateTime.now();
    final due = DateTime(dueDate!.year, dueDate!.month, dueDate!.day);
    final today = DateTime(now.year, now.month, now.day);
    return due.difference(today).inDays;
  }
}

enum Priority {
  low,
  medium,
  high,
  urgent,
}

extension PriorityExtension on Priority {
  String get name {
    switch (this) {
      case Priority.low:
        return 'Low';
      case Priority.medium:
        return 'Medium';
      case Priority.high:
        return 'High';
      case Priority.urgent:
        return 'Urgent';
    }
  }

  int get value {
    switch (this) {
      case Priority.low:
        return 0;
      case Priority.medium:
        return 1;
      case Priority.high:
        return 2;
      case Priority.urgent:
        return 3;
    }
  }
}

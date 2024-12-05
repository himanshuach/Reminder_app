import 'package:reminder_app/screens/reminder_screen.dart';
import 'package:flutter/material.dart';
import 'package:reminder_app/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: AppColors.primary,
        scaffoldBackgroundColor: AppColors.background,
        textTheme: const TextTheme(
          displayLarge: AppTextStyles.header,
          bodyLarge: AppTextStyles.body,
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const ReminderApp(),
    );
  }
}
import 'package:flutter/material.dart';

// Centralized colors
class AppColors {
  static const Color primary = Colors.blue;
  static const Color accent = Colors.orange;
  static const Color background = Colors.white;
  static const Color text = Colors.black;
  static const Color mutedText = Colors.grey;
}

// Text styles
class AppTextStyles {
  static const TextStyle header = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.text,
  );

  static const TextStyle subHeader = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: AppColors.text,
  );

  static const TextStyle body = TextStyle(
    fontSize: 16,
    color: AppColors.text,
  );

  static const TextStyle mutedBody = TextStyle(
    fontSize: 14,
    color: AppColors.mutedText,
  );
}

// Box decoration (similar to div styling)
class AppDecorations {
  static BoxDecoration roundedBox({Color? color}) {
    return BoxDecoration(
      color: color ?? AppColors.accent,
      borderRadius: BorderRadius.circular(20),
    );
  }
}
